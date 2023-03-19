package com.mrgostepz.smooth.db.sql;

import static com.mrgostepz.smooth.db.ColumnName.*;
import static com.mrgostepz.smooth.db.TableName.TABLE_ORDER;
import static com.mrgostepz.smooth.db.TableName.TABLE_ORDER;

public class OrderSQL {
    public static final String SQL_GET_ALL_ORDER = "SELECT * FROM " + TABLE_ORDER + ";";
    public static final String SQL_GET_ORDER_BY_ID = "SELECT * FROM " + TABLE_ORDER + " WHERE " + COL_ORDER_ID +" = ?;";
    public static final String SQL_GET_ORDER_BY_COLUMN = "SELECT ? FROM " + TABLE_ORDER + " WHERE ? = ?";
    public static final String SQL_ADD_ORDER = "INSERT INTO " + TABLE_ORDER + " ("
            + COL_TABLE_ID + ", "
            + COL_RECEIPT_JSON + ", "
            + COL_AMOUNT + ", "
            + COL_STATUS + ", "
            + COL_START_TIME + ", "
            + COL_LAST_UPDATED_TIME +") VALUE(?,?,?,?,?,?);";
    public static final String SQL_UPDATE_ORDER = "UPDATE " + TABLE_ORDER + " SET "
            + COL_TABLE_ID + " = ?, "
            + COL_RECEIPT_JSON + " = ?, "
            + COL_AMOUNT + " = ?, "
            + COL_STATUS + " = ?, "
            + COL_START_TIME + " = ?, "
            + COL_LAST_UPDATED_TIME + " = ? WHERE "
            + COL_ORDER_ID + " = ?;";
    public static final String SQL_DELETE_ORDER = "DELETE FROM " + TABLE_ORDER + " WHERE " + COL_ORDER_ID + " = ?;";
}
