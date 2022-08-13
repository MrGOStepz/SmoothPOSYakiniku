package com.mrgostepz.smooth.db.sql;

import static com.mrgostepz.smooth.db.ColumnName.COL_ORDER_TYPE_ID;
import static com.mrgostepz.smooth.db.ColumnName.COL_ORDER_TYPE_NAME;
import static com.mrgostepz.smooth.db.TableName.TABLE_ORDER_TYPE;

public class OrderTypeSQL {
    public static final String SQL_GET_ALL_ORDER_TYPE = "SELECT * FROM " + TABLE_ORDER_TYPE + ";";
    public static final String SQL_ADD_ORDER_TYPE = "INSERT INTO " + TABLE_ORDER_TYPE + " (" + COL_ORDER_TYPE_NAME + ") VALUE(?);";
    public static final String SQL_UPDATE_ORDER_TYPE = "UPDATE " + TABLE_ORDER_TYPE + " SET(" + COL_ORDER_TYPE_NAME + " = ?) WHERE " + COL_ORDER_TYPE_ID + " = ?;";
    public static final String SQL_DELETE_ORDER_TYPE = "DELETE FROM " + TABLE_ORDER_TYPE + " WHERE " + COL_ORDER_TYPE_ID + "} = ?;";
}
