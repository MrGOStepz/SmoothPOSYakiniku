package com.mrgostepz.smooth.db.rowmapper;

import com.mrgostepz.smooth.model.db.TableInfo;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import static com.mrgostepz.smooth.db.ColumnName.COL_NAME;
import static com.mrgostepz.smooth.db.ColumnName.COL_TABLE_INFO_ID;

public class TableInfoMapper implements RowMapper<TableInfo> {
    @Override
    public TableInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
        TableInfo tableInfo = new TableInfo();
        tableInfo.setTableInfoId(rs.getInt(COL_TABLE_INFO_ID));
        tableInfo.setName(rs.getString(COL_NAME));
        return tableInfo;
    }
}
