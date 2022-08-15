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
        tableCurrentState.setId(rs.getInt(COL_ID));
        tableCurrentState.setName(rs.getString(COL_NAME));
        tableCurrentState.setOrderId(rs.getInt(COL_ORDER_ID));
        tableCurrentState.setStatus(Status.fromString(rs.getString(COL_STATUS)));
        return tableCurrentState;
    }
}
