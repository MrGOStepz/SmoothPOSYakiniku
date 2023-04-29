package com.mrgostepz.smooth.db.dao;

import com.mrgostepz.smooth.db.repository.OrderInfoRepository;
import com.mrgostepz.smooth.db.rowmapper.OrderDetailRowMapper;
import com.mrgostepz.smooth.db.rowmapper.OrderRowMapper;
import com.mrgostepz.smooth.db.rowmapper.OrderSummatyRowMapper;
import com.mrgostepz.smooth.model.db.OrderDetail;
import com.mrgostepz.smooth.model.db.OrderInfo;
import com.mrgostepz.smooth.model.db.OrderSummary;
import com.mrgostepz.smooth.model.request.OrderUpdateStatus;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;

import static com.mrgostepz.smooth.db.sql.OrderDetailSQL.SQL_GET_ORDER_DETAIL_BY_DAY;
import static com.mrgostepz.smooth.db.sql.OrderDetailSQL.SQL_GET_ORDER_DETAIL_BY_ORDER_INFO_ID_LIST;
import static com.mrgostepz.smooth.db.sql.OrderInfoSQL.SQL_ADD_ORDER;
import static com.mrgostepz.smooth.db.sql.OrderInfoSQL.SQL_DELETE_ORDER;
import static com.mrgostepz.smooth.db.sql.OrderInfoSQL.SQL_GET_ALL_ORDER;
import static com.mrgostepz.smooth.db.sql.OrderInfoSQL.SQL_GET_COOK_ORDER;
import static com.mrgostepz.smooth.db.sql.OrderInfoSQL.SQL_GET_ORDER_BY_ID;
import static com.mrgostepz.smooth.db.sql.OrderInfoSQL.SQL_GET_ORDER_INFO_BY_TABLE;
import static com.mrgostepz.smooth.db.sql.OrderInfoSQL.SQL_UPDATE_ORDER;
import static com.mrgostepz.smooth.db.sql.OrderInfoSQL.SQL_UPDATE_ORDER_DONE;

@Service
@RequiredArgsConstructor
public class OrderInfoDAO implements OrderInfoRepository {
    private static final Logger logger = LogManager.getLogger(OrderInfoDAO.class);

    private final JdbcTemplate jdbcTemplate;

    @Override
    public List<OrderInfo> getAll() {
        try {
            return jdbcTemplate.query(SQL_GET_ALL_ORDER, new OrderRowMapper());
        } catch (DataAccessException ex) {
            logger.error(ex.getMessage());
            throw ex;
        }
    }

    @Override
    public List<OrderInfo> getCookOrder() {
        try {
            return jdbcTemplate.query(SQL_GET_COOK_ORDER, new OrderRowMapper());
        } catch (DataAccessException ex) {
            logger.error(ex.getMessage());
            throw ex;
        }
    }

    @Override
    public List<OrderDetail> getOrderByTableName(String tableName, Set<Integer> idList) {
        try {
            NamedParameterJdbcTemplate template = new NamedParameterJdbcTemplate(jdbcTemplate.getDataSource());
            MapSqlParameterSource parameters = new MapSqlParameterSource();
            parameters.addValue("ids", idList);
            return template.query(SQL_GET_ORDER_DETAIL_BY_ORDER_INFO_ID_LIST, parameters, new OrderDetailRowMapper());
        } catch (DataAccessException ex) {
            logger.error(ex.getMessage());
            throw ex;
        }
    }

    @Override
    public List<OrderSummary> getOrderDetailByDay() {
        try {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();
            String todayDate = formatter.format(date);
            String dateTime = String.format("between DATE_FORMAT(\"%s 00:00:01\", \"%%Y-%%m-%%d %%T\") and DATE_FORMAT(\"%s 23:59:59\", \"%%Y-%%m-%%d %%T\")", todayDate, todayDate);
            String sql = "SELECT PRODUCT_ID, POPUP_DETAIL_ID, sum(quantity) as quantity, sum(price) as amount from order_detail where started_time "  + dateTime + "  GROUP BY PRODUCT_ID, POPUP_DETAIL_ID";
            List<OrderSummary>  orderSummariesList=  jdbcTemplate.query(sql, new OrderSummatyRowMapper());
            return orderSummariesList;
        } catch (DataAccessException ex) {
            logger.error(ex.getMessage());
            throw ex;

        }
    }

    @Override
    public List<OrderInfo> getOrderInfoByTableName(String tableName) {
        try {
            return jdbcTemplate.query(SQL_GET_ORDER_INFO_BY_TABLE, new OrderRowMapper(), tableName);
        } catch (DataAccessException ex) {
            logger.error(ex.getMessage());
            throw ex;
        }
    }

    @Override
    public Boolean updateOrderStatus(OrderUpdateStatus orderUpdateStatus) {
        try {
            int result = jdbcTemplate.update(SQL_UPDATE_ORDER_DONE,
                    orderUpdateStatus.getStatus(),
                    orderUpdateStatus.getOrderInfoId());
            return result == 1;
        } catch (DataAccessException ex) {
            logger.error(ex.getMessage());
            throw ex;
        }
    }

    @Override
    public OrderInfo getById(Integer id) {
        try {
            return jdbcTemplate.queryForObject(SQL_GET_ORDER_BY_ID, new OrderRowMapper(), id);
        } catch (DataAccessException ex) {
            logger.error(ex.getMessage());
            throw ex;
        }
    }

    @Override
    public Integer add(OrderInfo orderInfo) {
        DataSource dataSource = jdbcTemplate.getDataSource();
        assert dataSource != null;
        orderInfo.setReceiptJson("");
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement(SQL_ADD_ORDER, Statement.RETURN_GENERATED_KEYS)) {
            statement.setString(1, orderInfo.getTableName());
            statement.setString(2, orderInfo.getReceiptJson());
            statement.setString(3, orderInfo.getOrderType());
            statement.setDouble(4, orderInfo.getAmount());
            statement.setString(5, orderInfo.getStatus());
            statement.setTimestamp(6, orderInfo.getStartedTime());
            statement.setTimestamp(7, orderInfo.getLastUpdatedTime());

            int affectedRows = statement.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating order menu failed, no rows affected.");
            }
            try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    orderInfo.setId(generatedKeys.getInt(1));
                } else {
                    throw new SQLException("Creating order menu failed, no ID obtained.");
                }
            }
            return orderInfo.getId();
        } catch (DataAccessException | SQLException ex) {
            logger.error(ex.getMessage());
            return -1;
        } finally {
            logger.info("Create new Order: {}", orderInfo);
        }
    }

    @Override
    public Boolean update(OrderInfo orderInfo) {
        try {
            int result = jdbcTemplate.update(SQL_UPDATE_ORDER,
                    orderInfo.getTableName(),
                    orderInfo.getReceiptJson(),
                    orderInfo.getOrderType(),
                    orderInfo.getAmount(),
                    orderInfo.getStatus(),
                    orderInfo.getStartedTime(),
                    orderInfo.getLastUpdatedTime(),
                    orderInfo.getId());
            return result == 1;
        } catch (DataAccessException ex) {
            logger.error(ex.getMessage());
            throw ex;
        }
    }

    @Override
    public Boolean deleteById(Integer id) {
        try {
            int result = jdbcTemplate.update(SQL_DELETE_ORDER, id);
            return result == 1;
        } catch (DataAccessException ex) {
            logger.error(ex.getMessage());
            throw ex;
        }
    }


}
