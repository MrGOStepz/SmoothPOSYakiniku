package com.mrgostepz.smooth.db.sql;

import static com.mrgostepz.smooth.db.ColumnName.COL_NAME;
import static com.mrgostepz.smooth.db.ColumnName.COL_CATEGORY_ID;
import static com.mrgostepz.smooth.db.TableName.TABLE_CATEGORY_INFO;

public class CategoryInfoSQL {
    public static final String SQL_GET_ALL_CATEGORY_INFO = "SELECT * FROM " + TABLE_CATEGORY_INFO + ";";
    public static final String SQL_GET_CATEGORY_INFO_BY_ID = "SELECT * FROM " + TABLE_CATEGORY_INFO + " WHERE " + COL_CATEGORY_ID + " = ?;";
    public static final String SQL_GET_CATEGORY_INFO_BY_COLUMN = "SELECT ? FROM " + TABLE_CATEGORY_INFO + " WHERE ? = ?";
    public static final String SQL_ADD_CATEGORY_INFO = "INSERT INTO " + TABLE_CATEGORY_INFO + " ("
            + COL_NAME + ") VALUE(?);";
    public static final String SQL_UPDATE_CATEGORY_INFO = "UPDATE " + TABLE_CATEGORY_INFO + " SET "
            + COL_CATEGORY_ID + " = ?, "
            + COL_NAME + " = ? WHERE "
            + COL_CATEGORY_ID + " = ?;";
    public static final String SQL_DELETE_CATEGORY_INFO = "DELETE FROM " + TABLE_CATEGORY_INFO + " WHERE " + COL_CATEGORY_ID + " = ?;";
}
