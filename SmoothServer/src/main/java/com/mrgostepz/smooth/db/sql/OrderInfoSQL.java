package com.mrgostepz.smooth.db.sql;

import static com.mrgostepz.smooth.db.ColumnName.*;
import static com.mrgostepz.smooth.db.TableName.TABLE_ORDER_INFO;

public class OrderInfoSQL {
    public static final String SQL_GET_ALL_ORDER = "SELECT * FROM " + TABLE_ORDER_INFO + ";";
    public static final String SQL_GET_COOK_ORDER = "SELECT * FROM " + TABLE_ORDER_INFO + " WHERE status = 'Cook;";
    public static final String SQL_GET_ORDER_BY_ID = "SELECT * FROM " + TABLE_ORDER_INFO + " WHERE " + COL_ORDER_ID +" = ?;";
    public static final String SQL_GET_ORDER_BY_COLUMN = "SELECT ? FROM " + TABLE_ORDER_INFO + " WHERE ? = ?";
    public static final String SQL_ADD_ORDER = "INSERT INTO " + TABLE_ORDER_INFO + " ("
            + COL_TABLE_INFO_ID + ", "
            + COL_RECEIPT_JSON + ", "
            + COL_ORDER_TYPE + ", "
            + COL_AMOUNT + ", "
            + COL_STATUS + ", "
            + COL_START_TIME + ", "
            + COL_LAST_UPDATED_TIME + ") VALUE(?,?,?,?,?,?,?);";
    public static final String SQL_UPDATE_ORDER = "UPDATE " + TABLE_ORDER_INFO + " SET "
            + COL_TABLE_INFO_ID + " = ?, "
            + COL_RECEIPT_JSON + " = ?, "
            + COL_ORDER_TYPE + ", "
            + COL_AMOUNT + " = ?, "
            + COL_STATUS + " = ?, "
            + COL_START_TIME + " = ?, "
            + COL_LAST_UPDATED_TIME + " = ? WHERE "
            + COL_ORDER_ID + " = ?;";
    public static final String SQL_DELETE_ORDER = "DELETE FROM " + TABLE_ORDER_INFO + " WHERE " + COL_ORDER_ID + " = ?;";
}
