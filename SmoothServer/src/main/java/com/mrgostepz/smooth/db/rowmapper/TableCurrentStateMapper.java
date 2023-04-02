package com.mrgostepz.smooth.db.rowmapper;

import com.mrgostepz.smooth.model.db.TableCurrentState;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import static com.mrgostepz.smooth.db.ColumnName.*;

public class TableCurrentStateMapper implements RowMapper<TableCurrentState> {
    @Override
    public TableCurrentState mapRow(ResultSet rs, int rowNum) throws SQLException {
        TableCurrentState tableCurrentState = new TableCurrentState();
        tableCurrentState.setId(rs.getInt(COL_TABLE_CURRENT_STATE_ID));
        tableCurrentState.setTableInfoId(rs.getInt(COL_TABLE_INFO_ID));
        tableCurrentState.setOrderInfoId(rs.getInt(COL_ORDER_ID));
        tableCurrentState.setStatus(rs.getString(COL_CURRENT_STATUS));
        return tableCurrentState;
    }
}
