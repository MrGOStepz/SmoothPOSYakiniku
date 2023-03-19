package com.mrgostepz.smooth.db.sql;

import static com.mrgostepz.smooth.db.ColumnName.*;
import static com.mrgostepz.smooth.db.TableName.TABLE_TABLE_DETAIL;

public class TableDetailSQL {
    public static final String SQL_GET_ALL_TABLE_DETAIL = "SELECT * FROM " + TABLE_TABLE_DETAIL + ";";
    public static final String SQL_GET_TABLE_DETAIL_BY_ID = "SELECT * FROM " + TABLE_TABLE_DETAIL + " WHERE " + COL_TABLE_ID + " = ?;";
    public static final String SQL_GET_TABLE_DETAIL_BY_COLUMN = "SELECT ? FROM " + TABLE_TABLE_DETAIL + " WHERE ? = ?";
    public static final String SQL_ADD_TABLE_DETAIL = "INSERT INTO " + TABLE_TABLE_DETAIL + " ("
            + COL_TABLE_ID + ", "
            + COL_NAME + ") VALUE(?,?);";
    public static final String SQL_UPDATE_TABLE_DETAIL = "UPDATE " + TABLE_TABLE_DETAIL + " SET "
            + COL_TABLE_ID + " = ?, "
            + COL_NAME + " = ? WHERE "
            + COL_TABLE_ID + " = ?;";
    public static final String SQL_DELETE_TABLE_DETAIL = "DELETE FROM " + TABLE_TABLE_DETAIL + " WHERE " + COL_TABLE_ID + " = ?;";
}
