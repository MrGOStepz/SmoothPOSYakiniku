package com.mrgostepz.smooth.db.dao;

import com.mrgostepz.smooth.db.repository.ProductRepositories;
import com.mrgostepz.smooth.db.rowmapper.ProductRowMapper;
import com.mrgostepz.smooth.model.db.Product;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.sql.*;
import java.util.List;

import static com.mrgostepz.smooth.db.sql.ProductSQL.*;

@Service
@RequiredArgsConstructor
public class ProductDAO implements ProductRepositories {

    private static final Logger logger = LogManager.getLogger(ProductDAO.class);

    private final JdbcTemplate jdbcTemplate;

    @Override
    public List<Product> getAll() {
        try {
            return jdbcTemplate.query(SQL_GET_ALL_PRODUCT, new ProductRowMapper());
        } catch (DataAccessException ex) {
            logger.error(ex.getMessage());
            throw ex;
        }
    }

    @Override
    public Product getById(Integer id) {
        try {
            return jdbcTemplate.queryForObject(SQL_GET_PRODUCT_BY_ID, new ProductRowMapper(), id);
        } catch (DataAccessException ex) {
            logger.error(ex.getMessage());
            throw ex;
        }
    }

    @Override
    public Integer add(Product product) {
        DataSource dataSource = jdbcTemplate.getDataSource();
        assert dataSource != null;
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement(SQL_ADD_PRODUCT, Statement.RETURN_GENERATED_KEYS)) {
            statement.setString(1, product.getName());
            statement.setString(2, product.getDescription());
            statement.setDouble(3, product.getPrice());
            statement.setString(4, product.getFoodType());
            statement.setInt(5, product.getCategoryInfoId());
            statement.setInt(6, product.getPopupInfoId());
            statement.setInt(7, product.getLocationPage());
            statement.setInt(8, product.getLocationRow());
            statement.setInt(9, product.getLocationColumn());
            statement.setInt(10, product.getStock());
            statement.setString(11, product.getImagePath());
            statement.setInt(12, Boolean.TRUE.equals(product.getIsAvailable()) ? 1 : 0);

            int affectedRows = statement.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating product failed, no rows affected.");
            }
            try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    product.setId(generatedKeys.getInt(1));
                } else {
                    throw new SQLException("Creating product failed, no ID obtained.");
                }
            }
            return product.getId();
        } catch (DataAccessException | SQLException ex) {
            logger.error(ex.getMessage());
            return -1;
        } finally {
            logger.info("Create new Product: {}", product);
        }
    }

    @Override
    public Boolean update(Product product) {
        try {
            int result = jdbcTemplate.update(SQL_UPDATE_PRODUCT,
                    product.getName(),
                    product.getDescription(),
                    product.getPrice(),
                    product.getFoodType(),
                    product.getCategoryInfoId(),
                    product.getPopupInfoId(),
                    product.getLocationPage(),
                    product.getLocationRow(),
                    product.getLocationColumn(),
                    product.getIsAvailable(),
                    product.getImagePath(),
                    product.getStock(),
                    product.getId());
            return result == 1;
        } catch (DataAccessException ex) {
            logger.error(ex.getMessage());
            throw ex;
        }
    }

    @Override
    public Boolean deleteById(Integer id) {
        try {
            int result = jdbcTemplate.update(SQL_DELETE_PRODUCT, id);
            return result == 1;
        } catch (DataAccessException ex) {
            logger.error(ex.getMessage());
            throw ex;
        }
    }

    @Override
    public List<Product> getProductInfoByColumn(String columnName, String value) {
        try {
            return jdbcTemplate.query(SQL_GET_PRODUCT_BY_COLUMN, new ProductRowMapper(), columnName, value);
        } catch (DataAccessException ex) {
            logger.error(ex.getMessage());
            throw ex;
        }
    }


}
