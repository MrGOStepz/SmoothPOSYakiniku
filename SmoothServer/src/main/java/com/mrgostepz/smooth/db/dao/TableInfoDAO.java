package com.mrgostepz.smooth.db.dao;

import com.mrgostepz.smooth.db.repository.TableInfoRepository;
import com.mrgostepz.smooth.db.rowmapper.TableInfoMapper;
import com.mrgostepz.smooth.model.db.TableInfo;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;


import static com.mrgostepz.smooth.db.sql.TableInfoSQL.SQL_ADD_TABLE_INFO;
import static com.mrgostepz.smooth.db.sql.TableInfoSQL.SQL_DELETE_TABLE_INFO;
import static com.mrgostepz.smooth.db.sql.TableInfoSQL.SQL_GET_ALL_TABLE_INFO;
import static com.mrgostepz.smooth.db.sql.TableInfoSQL.SQL_GET_TABLE_INFO_BY_ID;
import static com.mrgostepz.smooth.db.sql.TableInfoSQL.SQL_UPDATE_TABLE_INFO;

@Service
@RequiredArgsConstructor
public class TableInfoDAO implements TableInfoRepository {
    private static final Logger logger = LogManager.getLogger(TableInfoDAO.class);

    private final JdbcTemplate jdbcTemplate;
    @Override
    public List<TableInfo> getAll() {
        try {
            return jdbcTemplate.query(SQL_GET_ALL_TABLE_INFO, new TableInfoMapper());
        } catch (DataAccessException ex) {
            logger.error(ex.getMessage());
            throw ex;
        }
    }

    @Override
    public TableInfo getById(Integer id) {
        try {
            return jdbcTemplate.queryForObject(SQL_GET_TABLE_INFO_BY_ID, new TableInfoMapper(), id);
        } catch (DataAccessException ex) {
            logger.error(ex.getMessage());
            throw ex;
        }
    }

    @Override
    public Integer add(TableInfo tableInfo) {
        DataSource dataSource = jdbcTemplate.getDataSource();
        assert dataSource != null;
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement(SQL_ADD_TABLE_INFO, Statement.RETURN_GENERATED_KEYS)) {
            statement.setString(1, tableInfo.getName());

            int affectedRows = statement.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating product failed, no rows affected.");
            }
            try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    tableInfo.setTableInfoId(generatedKeys.getInt(1));
                } else {
                    throw new SQLException("Creating product failed, no ID obtained.");
                }
            }
            return tableInfo.getTableInfoId();
        } catch (DataAccessException | SQLException ex) {
            logger.error(ex.getMessage());
            return -1;
        } finally {
            logger.info("Create new Order: {}", tableInfo);
        }
    }

    @Override
    public Boolean update(TableInfo tableInfo) {
        try {
            int result = jdbcTemplate.update(SQL_UPDATE_TABLE_INFO,
                    tableInfo.getTableInfoId(),
                    tableInfo.getName(),
                    tableInfo.getTableInfoId());
            return result == 1;
        } catch (DataAccessException ex) {
            logger.error(ex.getMessage());
            throw ex;
        }
    }

    @Override
    public Boolean deleteById(Integer id) {
        try {
            int result = jdbcTemplate.update(SQL_DELETE_TABLE_INFO, id);
            return result == 1;
        } catch (DataAccessException ex) {
            logger.error(ex.getMessage());
            throw ex;
        }
    }
}
