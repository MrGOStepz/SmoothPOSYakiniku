package com.mrgostepz.smooth.db.sql;

import static com.mrgostepz.smooth.db.ColumnName.COL_DESCRIPTION;
import static com.mrgostepz.smooth.db.ColumnName.COL_FOOD_TYPE;
import static com.mrgostepz.smooth.db.ColumnName.COL_ID;
import static com.mrgostepz.smooth.db.ColumnName.COL_IS_AVAILABLE;
import static com.mrgostepz.smooth.db.ColumnName.COL_LIST_PRODUCT;
import static com.mrgostepz.smooth.db.ColumnName.COL_NAME;
import static com.mrgostepz.smooth.db.ColumnName.COL_PRICE;
import static com.mrgostepz.smooth.db.ColumnName.COL_IS_ACTIVE;
import static com.mrgostepz.smooth.db.ColumnName.COL_STOCK;
import static com.mrgostepz.smooth.db.TableName.TABLE_PRODUCT;

public class ProductSQL {
    public static final String SQL_GET_ALL_PRODUCT = "SELECT * FROM " + TABLE_PRODUCT + ";";
    public static final String SQL_GET_PRODUCT_BY_ID = "SELECT * FROM " + TABLE_PRODUCT + " WHERE " + COL_ID +" = ?;";
    public static final String SQL_GET_PRODUCT_BY_COLUMN = "SELECT ? FROM " + TABLE_PRODUCT + " WHERE ? = ?";
    public static final String SQL_ADD_PRODUCT = "INSERT INTO " + TABLE_PRODUCT + " ("
            + COL_NAME + ", "
            + COL_DESCRIPTION + ", "
            + COL_IS_AVAILABLE + ", "
            + COL_STOCK + ", "
            + COL_PRICE + ", "
            + COL_FOOD_TYPE + ", "
            + COL_LIST_PRODUCT + ", "
            + COL_IS_ACTIVE +") VALUE(?,?,?,?,?,?,?,?);";
    public static final String SQL_UPDATE_PRODUCT = "UPDATE " + TABLE_PRODUCT + " SET "
            + COL_NAME + " = ?, "
            + COL_DESCRIPTION + " = ?, "
            + COL_IS_AVAILABLE + " = ?, "
            + COL_STOCK + " = ?, "
            + COL_PRICE + " = ?, "
            + COL_FOOD_TYPE + " = ?, "
            + COL_LIST_PRODUCT + " = ?, "
            + COL_IS_ACTIVE + " = ? WHERE "
            + COL_ID + " = ?;";
    public static final String SQL_DELETE_PRODUCT = "DELETE FROM " + TABLE_PRODUCT + " WHERE " + COL_ID + " = ?;";
}
