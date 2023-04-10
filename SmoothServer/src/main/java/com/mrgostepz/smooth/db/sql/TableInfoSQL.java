package com.mrgostepz.smooth.db.sql;

import static com.mrgostepz.smooth.db.ColumnName.*;
import static com.mrgostepz.smooth.db.TableName.TABLE_TABLE_INFO;

public class TableInfoSQL {
    public static final String SQL_GET_ALL_TABLE_INFO = "SELECT * FROM " + TABLE_TABLE_INFO + ";";
    public static final String SQL_GET_TABLE_INFO_BY_ID = "SELECT * FROM " + TABLE_TABLE_INFO + " WHERE " + COL_TABLE_INFO_ID + " = ?;";
    public static final String SQL_GET_TABLE_INFO_BY_COLUMN = "SELECT ? FROM " + TABLE_TABLE_INFO + " WHERE ? = ?";
    public static final String SQL_ADD_TABLE_INFO = "INSERT INTO " + TABLE_TABLE_INFO + " ("
            + COL_TABLE_INFO_ID + ", "
            + COL_NAME + ") VALUE(?,?);";
    public static final String SQL_UPDATE_TABLE_INFO = "UPDATE " + TABLE_TABLE_INFO + " SET "
            + COL_TABLE_INFO_ID + " = ?, "
            + COL_NAME + " = ? WHERE "
            + COL_TABLE_INFO_ID + " = ?;";
    public static final String SQL_DELETE_TABLE_INFO = "DELETE FROM " + TABLE_TABLE_INFO + " WHERE " + COL_TABLE_INFO_ID + " = ?;";
}
