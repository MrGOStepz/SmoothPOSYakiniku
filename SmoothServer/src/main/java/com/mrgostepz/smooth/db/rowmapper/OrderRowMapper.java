package com.mrgostepz.smooth.db.rowmapper;

import com.mrgostepz.smooth.model.db.OrderMenu;
import com.mrgostepz.smooth.model.enumtype.OrderType;
import com.mrgostepz.smooth.model.enumtype.Status;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import static com.mrgostepz.smooth.db.ColumnName.*;

public class OrderRowMapper implements RowMapper<OrderMenu> {
    @Override
    public OrderMenu mapRow(ResultSet rs, int rowNum) throws SQLException {
        OrderMenu order = new OrderMenu();
        order.setId(rs.getInt(COL_ID));
        order.setTableId(rs.getInt(COL_TABLE_ID));
        order.setReceiptJson(rs.getString(COL_RECEIPT_JSON));
        order.setStatus(Status.fromString(rs.getString(COL_STATUS)));
        order.setOrderType(OrderType.fromString(rs.getString(COL_ORDER_TYPE)));
        order.setAmount(rs.getDouble(COL_AMOUNT));
        order.setStartTime(rs.getDate(COL_START_TIME));
        order.setLastUpdatedTime(rs.getDate(COL_LAST_UPDATED_TIME));
        return order;
    }
}
