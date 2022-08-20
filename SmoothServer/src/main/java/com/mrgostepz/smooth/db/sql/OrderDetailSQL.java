package com.mrgostepz.smooth.db.sql;

import static com.mrgostepz.smooth.db.ColumnName.*;
import static com.mrgostepz.smooth.db.TableName.TABLE_ORDER_DETAIL;

public class OrderDetailSQL {
    public static final String SQL_GET_ALL_ORDER_DETAIL = "SELECT * FROM " + TABLE_ORDER_DETAIL + ";";
    public static final String SQL_GET_ORDER_DETAIL_BY_ID = "SELECT * FROM " + TABLE_ORDER_DETAIL + " WHERE " + COL_ID +" = ?;";
    public static final String SQL_GET_ORDER_DETAIL_BY_COLUMN = "SELECT ? FROM " + TABLE_ORDER_DETAIL + " WHERE ? = ?";
    public static final String SQL_ADD_ORDER_DETAIL = "INSERT INTO " + TABLE_ORDER_DETAIL + " ("
            + COL_PRODUCT_ID + ", "
            + COL_ORDER_ID + ", "
            + COL_STATUS + ", "
            + COL_QUALITY + ", "
            + COL_PRICE + ", "
            + COL_COMMENT + ", "
            + COL_IS_ACTIVE +") VALUE(?,?,?,?,?,?,?);";
    public static final String SQL_UPDATE_ORDER_DETAIL = "UPDATE " + TABLE_ORDER_DETAIL + " SET "
            + COL_PRODUCT_ID + " = ?, "
            + COL_ORDER_ID + " = ?, "
            + COL_STATUS + " = ?, "
            + COL_QUALITY + " = ?, "
            + COL_PRICE + " = ?, "
            + COL_COMMENT + " = ?, "
            + COL_IS_ACTIVE + " = ? WHERE "
            + COL_ID + " = ?;";
    public static final String SQL_DELETE_ORDER_DETAIL = "DELETE FROM " + TABLE_ORDER_DETAIL + " WHERE " + COL_ID + " = ?;";
}