package com.mrgostepz.smooth.db.sql;

import static com.mrgostepz.smooth.db.ColumnName.*;
import static com.mrgostepz.smooth.db.TableName.TABLE_ORDER;
import static com.mrgostepz.smooth.db.TableName.TABLE_ORDER;

public class OrderSQL {
    public static final String SQL_GET_ALL_ORDER = "SELECT * FROM " + TABLE_ORDER + ";";
    public static final String SQL_GET_ORDER_BY_ID = "SELECT * FROM " + TABLE_ORDER + " WHERE " + COL_ID +" = ?;";
    public static final String SQL_GET_ORDER_BY_COLUMN = "SELECT ? FROM " + TABLE_ORDER + " WHERE ? = ?";
    public static final String SQL_ADD_ORDER = "INSERT INTO " + TABLE_ORDER + " ("
            + COL_TABLE_ID + ", "
            + COL_ORDER_DETAIL + ", "
            + COL_AMOUNT + ", "
            + COL_START_TIME + ", "
            + COL_STATUS_ID + ", "
            + COL_ORDER_TYPE_ID +") VALUE(?,?,?,?,?,?);";
    public static final String SQL_UPDATE_ORDER = "UPDATE " + TABLE_ORDER + " SET "
            + COL_TABLE_ID + " = ?, "
            + COL_ORDER_DETAIL + " = ?, "
            + COL_AMOUNT + " = ?, "
            + COL_START_TIME + " = ?, "
            + COL_STATUS_ID + " = ?, "
            + COL_ORDER_TYPE_ID + " = ? WHERE "
            + COL_ID + " = ?;";
    public static final String SQL_DELETE_ORDER = "DELETE FROM " + TABLE_ORDER + " WHERE " + COL_ID + " = ?;";
}
