package com.mrgostepz.smooth.db.dao;

import com.mrgostepz.smooth.db.repository.CategoryInfoRepository;
import com.mrgostepz.smooth.db.rowmapper.CategoryInfoMapper;
import com.mrgostepz.smooth.model.db.CategoryInfo;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.sql.*;
import java.util.List;

import static com.mrgostepz.smooth.db.sql.CategoryInfoSQL.*;

@Service
@RequiredArgsConstructor
public class CategoryInfoDAO implements CategoryInfoRepository {
    private static final Logger logger = LogManager.getLogger(CategoryInfoDAO.class);

    private final JdbcTemplate jdbcTemplate;
    @Override
    public List<CategoryInfo> getAll() {
        try {
            return jdbcTemplate.query(SQL_GET_ALL_CATEGORY_INFO, new CategoryInfoMapper());
        } catch (DataAccessException ex) {
            logger.error(ex.getMessage());
            throw ex;
        }
    }

    @Override
    public CategoryInfo getById(Integer id) {
        try {
            return jdbcTemplate.queryForObject(SQL_GET_CATEGORY_INFO_BY_ID, new CategoryInfoMapper(), id);
        } catch (DataAccessException ex) {
            logger.error(ex.getMessage());
            throw ex;
        }
    }

    @Override
    public Integer add(CategoryInfo CategoryInfo) {
        DataSource dataSource = jdbcTemplate.getDataSource();
        assert dataSource != null;
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement(SQL_ADD_CATEGORY_INFO, Statement.RETURN_GENERATED_KEYS)) {
            statement.setString(1, CategoryInfo.getName());

            int affectedRows = statement.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating product failed, no rows affected.");
            }
            try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    CategoryInfo.setCategoryInfoId(generatedKeys.getInt(1));
                } else {
                    throw new SQLException("Creating product failed, no ID obtained.");
                }
            }
            return CategoryInfo.getCategoryInfoId();
        } catch (DataAccessException | SQLException ex) {
            logger.error(ex.getMessage());
            return -1;
        } finally {
            logger.info("Create new Order: {}", CategoryInfo);
        }
    }

    @Override
    public Boolean update(CategoryInfo CategoryInfo) {
        try {
            int result = jdbcTemplate.update(SQL_UPDATE_CATEGORY_INFO,
                    CategoryInfo.getCategoryInfoId(),
                    CategoryInfo.getName(),
                    CategoryInfo.getCategoryInfoId());
            return result == 1;
        } catch (DataAccessException ex) {
            logger.error(ex.getMessage());
            throw ex;
        }
    }

    @Override
    public Boolean deleteById(Integer id) {
        try {
            int result = jdbcTemplate.update(SQL_DELETE_CATEGORY_INFO, id);
            return result == 1;
        } catch (DataAccessException ex) {
            logger.error(ex.getMessage());
            throw ex;
        }
    }
}
