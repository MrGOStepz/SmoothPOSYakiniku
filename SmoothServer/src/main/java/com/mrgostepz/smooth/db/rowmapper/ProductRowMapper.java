package com.mrgostepz.smooth.db.rowmapper;

import com.mrgostepz.smooth.model.db.Product;
import com.mrgostepz.smooth.model.enumtype.FoodType;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static com.mrgostepz.smooth.db.ColumnName.*;

public class ProductRowMapper implements RowMapper<Product> {
    @Override
    public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
        Product product = new Product();
        product.setId(rs.getInt(COL_ID));
        product.setName(rs.getString(COL_NAME));
        product.setDescription(rs.getString(COL_DESCRIPTION));
        product.setPrice(rs.getDouble(COL_PRICE));
        product.setFoodType(FoodType.fromString(rs.getString(COL_FOOD_TYPE)));
        product.setCategoryId(rs.getInt(COL_CATEGORY_ID));
        product.setLocationPage(rs.getInt(COL_LOCATION_PAGE));
        product.setLocationRow(rs.getInt(COL_LOCATION_ROW));
        product.setLocationColumn(rs.getInt(COL_LOCATION_COLUMN));
        product.setStock(rs.getInt(COL_STOCK));
        product.setImagePath(rs.getString(COL_IMAGE_PATH));
//        String listItems = rs.getString(COL_LIST_PRODUCT);
//        if(listItems != null) {
//            product.setListProductIds(Stream.of(listItems.split(","))
//                    .map(String::trim)
//                    .map(Integer::parseInt)
//                    .collect(Collectors.toList()));
//        }
        product.setIsAvailable(rs.getInt(COL_IS_ACTIVE) == 1);
        return product;
    }
}
