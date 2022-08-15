package com.mrgostepz.smooth.db.dao;

import com.mrgostepz.smooth.db.repository.OrderRepository;
import com.mrgostepz.smooth.db.rowmapper.OrderRowMapper;
import com.mrgostepz.smooth.model.db.OrderMenu;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.sql.*;
import java.util.List;

import static com.mrgostepz.smooth.db.sql.OrderSQL.*;

@Service
@RequiredArgsConstructor
public class OrderDAO implements OrderRepository {
    private static final Logger logger = LogManager.getLogger(OrderDAO.class);

    private final JdbcTemplate jdbcTemplate;
    @Override
    public List<OrderMenu> getAll() {
        try {
            return jdbcTemplate.query(SQL_GET_ALL_ORDER, new OrderRowMapper());
        } catch (DataAccessException ex) {
            logger.error(ex.getMessage());
            throw ex;
        }
    }

    @Override
    public OrderMenu getById(Integer id) {
        try {
            return jdbcTemplate.queryForObject(SQL_GET_ORDER_BY_ID, new OrderRowMapper(), id);
        } catch (DataAccessException ex) {
            logger.error(ex.getMessage());
            throw ex;
        }
    }

    @Override
    public Integer add(OrderMenu orderMenu) {
        DataSource dataSource = jdbcTemplate.getDataSource();
        assert dataSource != null;
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement(SQL_ADD_ORDER, Statement.RETURN_GENERATED_KEYS)) {
            statement.setInt(1, orderMenu.getTableId());
            statement.setString(2, orderMenu.getOrderDetail());
            statement.setDouble(3, orderMenu.getAmount());
            statement.setDate(4, orderMenu.getStartTime());
            statement.setString(5, orderMenu.getStatus().getValueString());
            statement.setString(6, orderMenu.getOrderType().getValueString());

            int affectedRows = statement.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating order menu failed, no rows affected.");
            }
            try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    orderMenu.setId(generatedKeys.getInt(1));
                } else {
                    throw new SQLException("Creating order menu failed, no ID obtained.");
                }
            }
            return orderMenu.getId();
        } catch (DataAccessException | SQLException ex) {
            logger.error(ex.getMessage());
            return -1;
        } finally {
            logger.info("Create new Order: {}", orderMenu);
        }
    }

    @Override
    public Boolean update(OrderMenu orderMenu) {
        try {
            int result = jdbcTemplate.update(SQL_UPDATE_ORDER,
                    orderMenu.getTableId(),
                    orderMenu.getOrderDetail(),
                    orderMenu.getAmount(),
                    orderMenu.getStartTime(),
                    orderMenu.getStartTime(),
                    orderMenu.getOrderType().getValueString(),
                    orderMenu.getId());
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
