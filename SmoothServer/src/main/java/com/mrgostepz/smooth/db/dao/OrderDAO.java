package com.mrgostepz.smooth.db.dao;

import com.mrgostepz.smooth.db.repository.OrderRepository;
import com.mrgostepz.smooth.db.rowmapper.OrderRowMapper;
import com.mrgostepz.smooth.model.db.OrderInfo;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.sql.*;
import java.util.List;

import static com.mrgostepz.smooth.db.sql.OrderInfoSQL.*;

@Service
@RequiredArgsConstructor
public class OrderDAO implements OrderRepository {
    private static final Logger logger = LogManager.getLogger(OrderDAO.class);

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
