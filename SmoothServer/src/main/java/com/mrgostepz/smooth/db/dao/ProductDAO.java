package com.mrgostepz.smooth.db.dao;

import com.mrgostepz.smooth.db.repository.ProductRepository;
import com.mrgostepz.smooth.db.rowmapper.ProductRowMapper;
import com.mrgostepz.smooth.model.db.Product;
import com.mrgostepz.smooth.model.db.SetMenu;
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
import java.util.StringJoiner;

import static com.mrgostepz.smooth.db.sql.ProductSQL.SQL_ADD_PRODUCT;
import static com.mrgostepz.smooth.db.sql.ProductSQL.SQL_DELETE_PRODUCT;
import static com.mrgostepz.smooth.db.sql.ProductSQL.SQL_GET_ALL_PRODUCT;
import static com.mrgostepz.smooth.db.sql.ProductSQL.SQL_GET_PRODUCT_BY_COLUMN;
import static com.mrgostepz.smooth.db.sql.ProductSQL.SQL_GET_PRODUCT_BY_ID;
import static com.mrgostepz.smooth.db.sql.ProductSQL.SQL_UPDATE_PRODUCT;


@Service
@RequiredArgsConstructor
public class ProductDAO implements ProductRepository {

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
            statement.setInt(3, product.getIsAvailable());
            statement.setInt(4, product.getStock());
            statement.setDouble(5, product.getPrice());
            statement.setString(6, product.getFoodType());
            if (product.getListProductIds() != null) {
                StringJoiner listProducts = new StringJoiner(",");
                for (Integer id : product.getListProductIds()) {
                    listProducts.add(id.toString());
                }
                statement.setString(7, listProducts.toString());
            } else {
                statement.setString(7, null);
            }

            statement.setInt(8, product.getIsActive());

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
                    product.getIsAvailable(),
                    product.getStock(),
                    product.getPrice(),
                    product.getFoodType(),
                    product.getListProductIds(),
                    product.getIsActive(),
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
