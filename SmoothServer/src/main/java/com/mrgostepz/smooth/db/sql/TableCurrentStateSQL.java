package com.mrgostepz.smooth.db.sql;

import static com.mrgostepz.smooth.db.ColumnName.COL_ID;
import static com.mrgostepz.smooth.db.ColumnName.COL_NAME;
import static com.mrgostepz.smooth.db.ColumnName.COL_ORDER_ID;
import static com.mrgostepz.smooth.db.ColumnName.COL_STATUS;
import static com.mrgostepz.smooth.db.TableName.TABLE_TABLE_CURRENT_STATE;

public class TableCurrentStateSQL {
    public static final String SQL_GET_ALL_TABLE_CURRENT_STATE = "SELECT * FROM " + TABLE_TABLE_CURRENT_STATE + ";";
    public static final String SQL_GET_TABLE_CURRENT_STATE_BY_ID = "SELECT * FROM " + TABLE_TABLE_CURRENT_STATE + " WHERE " + COL_ID + " = ?;";
    public static final String SQL_GET_TABLE_CURRENT_STATE_BY_COLUMN = "SELECT ? FROM " + TABLE_TABLE_CURRENT_STATE + " WHERE ? = ?";
    public static final String SQL_ADD_TABLE_CURRENT_STATE = "INSERT INTO " + TABLE_TABLE_CURRENT_STATE + " ("
            + COL_ID + ", "
            + COL_NAME + ", "
            + COL_STATUS + ", "
            + COL_ORDER_ID + ") VALUE(?,?,?,?);";
    public static final String SQL_UPDATE_TABLE_CURRENT_STATE = "UPDATE " + TABLE_TABLE_CURRENT_STATE + " SET "
            + COL_ID + " = ?, "
            + COL_NAME + " = ?, "
            + COL_STATUS + " = ?, "
            + COL_ORDER_ID + " = ? WHERE "
            + COL_ID + " = ?;";
    public static final String SQL_DELETE_TABLE_CURRENT_STATE = "DELETE FROM " + TABLE_TABLE_CURRENT_STATE + " WHERE " + COL_ID + " = ?;";
}
