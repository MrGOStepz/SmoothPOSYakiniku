package com.mrgostepz.smooth.db.sql;

import static com.mrgostepz.smooth.db.ColumnName.*;
import static com.mrgostepz.smooth.db.TableName.TABLE_PRODUCT;

public class ProductSQL {
    public static final String SQL_GET_ALL_PRODUCT = "SELECT * FROM " + TABLE_PRODUCT + ";";
    public static final String SQL_GET_PRODUCT_BY_ID = "SELECT * FROM " + TABLE_PRODUCT + " WHERE " + COL_PRODUCT_ID + " = ?;";
    public static final String SQL_GET_PRODUCT_BY_COLUMN = "SELECT ? FROM " + TABLE_PRODUCT + " WHERE ? = ?";
    public static final String SQL_ADD_PRODUCT = "INSERT INTO " + TABLE_PRODUCT + " ("
            + COL_NAME + ", "
            + COL_DESCRIPTION + ", "
            + COL_PRICE + ", "
            + COL_FOOD_TYPE + ", "
            + COL_CATEGORY_INFO_ID + ", "
            + COL_POPUP_INFO_ID + ", "
            + COL_LOCATION_PAGE + ", "
            + COL_LOCATION_ROW + ", "
            + COL_LOCATION_COLUMN + ", "
            + COL_STOCK + ", "
            + COL_IMAGE_PATH + ", "
            + COL_IS_AVAILABLE + ") VALUE(?,?,?,?,?,?,?,?,?,?,?,?);";
    public static final String SQL_UPDATE_PRODUCT = "UPDATE " + TABLE_PRODUCT + " SET "
            + COL_NAME + " = ?, "
            + COL_DESCRIPTION + " = ?, "
            + COL_PRICE + " = ?, "
            + COL_FOOD_TYPE + " = ?, "
            + COL_CATEGORY_INFO_ID + " = ?, "
            + COL_POPUP_INFO_ID + " = ?, "
            + COL_LOCATION_PAGE + " = ?, "
            + COL_LOCATION_ROW + " = ?, "
            + COL_LOCATION_COLUMN + " = ?, "
            + COL_IMAGE_PATH + " = ?, "
            + COL_STOCK + " = ?, "
            + COL_IS_AVAILABLE + " = ? WHERE "
            + COL_PRODUCT_ID + " = ?;";
    public static final String SQL_DELETE_PRODUCT = "DELETE FROM " + TABLE_PRODUCT + " WHERE " + COL_PRODUCT_ID + " = ?;";
}
