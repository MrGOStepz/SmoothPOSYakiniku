package com.mrgostepz.smooth.db.rowmapper;

import com.mrgostepz.smooth.model.db.TableCurrentState;
import com.mrgostepz.smooth.model.enumtype.Status;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import static com.mrgostepz.smooth.db.ColumnName.*;

public class TableCurrentStateMapper implements RowMapper<TableCurrentState> {
    @Override
    public TableCurrentState mapRow(ResultSet rs, int rowNum) throws SQLException {
        TableCurrentState tableCurrentState = new TableCurrentState();
        tableCurrentState.setTableCurrentStateId(rs.getInt(COL_TABLE_CURRENT_STATE_ID));
        tableCurrentState.setTableId(rs.getInt(COL_TABLE_ID));
        tableCurrentState.setOrderId(rs.getInt(COL_ORDER_ID));
        tableCurrentState.setStatus(rs.getString(COL_CURRENT_STATUS));
        return tableCurrentState;
    }
}
