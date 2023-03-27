package com.mrgostepz.smooth.db.dao;

import com.mrgostepz.smooth.db.repository.OrderRepository;
import com.mrgostepz.smooth.db.repository.TableCurrentStateRepository;
import com.mrgostepz.smooth.db.rowmapper.OrderRowMapper;
import com.mrgostepz.smooth.db.rowmapper.TableCurrentStateMapper;
import com.mrgostepz.smooth.model.db.TableCurrentState;
import com.mrgostepz.smooth.model.db.TableCurrentState;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.sql.*;
import java.util.List;

import static com.mrgostepz.smooth.db.sql.ProductSQL.SQL_UPDATE_PRODUCT;
import static com.mrgostepz.smooth.db.sql.TableCurrentStateSQL.*;

@Service
@RequiredArgsConstructor
public class TableCurrentStateDAO implements TableCurrentStateRepository {
    private static final Logger logger = LogManager.getLogger(TableCurrentStateDAO.class);

    private final JdbcTemplate jdbcTemplate;
    @Override
    public List<TableCurrentState> getAll() {
        try {
            return jdbcTemplate.query(SQL_GET_ALL_TABLE_CURRENT_STATE, new TableCurrentStateMapper());
        } catch (DataAccessException ex) {
            logger.error(ex.getMessage());
            throw ex;
        }
    }

    @Override
    public TableCurrentState getById(Integer id) {
        try {
            return jdbcTemplate.queryForObject(SQL_GET_TABLE_CURRENT_STATE_BY_ID, new TableCurrentStateMapper(), id);
        } catch (DataAccessException ex) {
            logger.error(ex.getMessage());
            throw ex;
        }
    }

    @Override
    public Integer add(TableCurrentState tableCurrentState) {
        DataSource dataSource = jdbcTemplate.getDataSource();
        assert dataSource != null;
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement(SQL_ADD_TABLE_CURRENT_STATE, Statement.RETURN_GENERATED_KEYS)) {
            statement.setInt(1, tableCurrentState.getTableCurrentStateId());
            statement.setInt(2, tableCurrentState.getTableId());
            statement.setInt(3, tableCurrentState.getOrderId());
            statement.setString(4, tableCurrentState.getStatus());

            int affectedRows = statement.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating product failed, no rows affected.");
            }
            try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    tableCurrentState.setTableCurrentStateId(generatedKeys.getInt(1));
                } else {
                    throw new SQLException("Creating product failed, no ID obtained.");
                }
            }
            return tableCurrentState.getTableCurrentStateId();
        } catch (DataAccessException | SQLException ex) {
            logger.error(ex.getMessage());
            return -1;
        } finally {
            logger.info("Create new Order: {}", tableCurrentState);
        }
    }

    @Override
    public Boolean update(TableCurrentState tableCurrentState) {
        try {
            int result = jdbcTemplate.update(SQL_UPDATE_TABLE_CURRENT_STATE,
                    tableCurrentState.getTableId(),
                    tableCurrentState.getOrderId(),
                    tableCurrentState.getStatus(),
                    tableCurrentState.getTableCurrentStateId());
            return result == 1;
        } catch (DataAccessException ex) {
            logger.error(ex.getMessage());
            throw ex;
        }
    }

    @Override
    public Boolean deleteById(Integer id) {
        try {
            int result = jdbcTemplate.update(SQL_DELETE_TABLE_CURRENT_STATE, id);
            return result == 1;
        } catch (DataAccessException ex) {
            logger.error(ex.getMessage());
            throw ex;
        }
    }
}
