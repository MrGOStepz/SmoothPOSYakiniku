package com.mrgostepz.smooth.db.dao;

import com.mrgostepz.smooth.db.repository.OrderDetailRepository;
import com.mrgostepz.smooth.db.rowmapper.OrderDetailRowMapper;
import com.mrgostepz.smooth.model.db.OrderDetail;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.sql.*;
import java.util.List;

import static com.mrgostepz.smooth.db.sql.OrderDetailSQL.*;
import static com.mrgostepz.smooth.db.sql.OrderSQL.*;

@Service
@RequiredArgsConstructor
public class OrderDetailDAO implements OrderDetailRepository {
    private static final Logger logger = LogManager.getLogger(OrderDetailDAO.class);

    private final JdbcTemplate jdbcTemplate;
    @Override
    public List<OrderDetail> getAll() {
        try {
            return jdbcTemplate.query(SQL_GET_ALL_ORDER_DETAIL, new OrderDetailRowMapper());
        } catch (DataAccessException ex) {
            logger.error(ex.getMessage());
            throw ex;
        }
    }

    @Override
    public OrderDetail getById(Integer id) {
        try {
            return jdbcTemplate.queryForObject(SQL_GET_ORDER_DETAIL_BY_ID, new OrderDetailRowMapper(), id);
        } catch (DataAccessException ex) {
            logger.error(ex.getMessage());
            throw ex;
        }
    }

    @Override
    public Integer add(OrderDetail orderDetail) {
        DataSource dataSource = jdbcTemplate.getDataSource();
        assert dataSource != null;
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement(SQL_ADD_ORDER_DETAIL, Statement.RETURN_GENERATED_KEYS)) {
            statement.setInt(1, orderDetail.getId());
            statement.setInt(2, orderDetail.getProductId());
            statement.setInt(3, orderDetail.getOrderId());
            statement.setString(4, orderDetail.getStatus().getValueString());
            statement.setInt(5, orderDetail.getQuality());
            statement.setDouble(6, orderDetail.getPrice());
            statement.setString(7, orderDetail.getComment());
            statement.setBoolean(8, orderDetail.getIsActive());

            int affectedRows = statement.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating order menu failed, no rows affected.");
            }
            try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    orderDetail.setId(generatedKeys.getInt(1));
                } else {
                    throw new SQLException("Creating order menu failed, no ID obtained.");
                }
            }
            return orderDetail.getId();
        } catch (DataAccessException | SQLException ex) {
            logger.error(ex.getMessage());
            return -1;
        } finally {
            logger.info("Create new Order: {}", orderDetail);
        }
    }

    @Override
    public Boolean update(OrderDetail orderDetail) {
        try {
            int result = jdbcTemplate.update(SQL_UPDATE_ORDER,
                    orderDetail.getProductId(),
                    orderDetail.getOrderId(),
                    orderDetail.getStatus().getValueString(),
                    orderDetail.getQuality(),
                    orderDetail.getPrice(),
                    orderDetail.getComment(),
                    orderDetail.getIsActive(),
                    orderDetail.getId());
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
