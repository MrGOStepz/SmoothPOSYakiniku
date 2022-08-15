package com.mrgostepz.smooth.db.rowmapper;

import com.mrgostepz.smooth.model.db.OrderMenu;
import com.mrgostepz.smooth.model.enumtype.OrderType;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import static com.mrgostepz.smooth.db.ColumnName.*;

public class OrderRowMapper implements RowMapper<OrderMenu> {
    @Override
    public OrderMenu mapRow(ResultSet rs, int rowNum) throws SQLException {
        OrderMenu order = new OrderMenu();
        order.setId(rs.getInt(COL_ID));
        order.setOrderDetail(rs.getString(COL_ORDER_DETAIL));
        order.setTableId(rs.getInt(COL_TABLE_ID));
        order.setOrderType(OrderType.fromString(rs.getString(COL_ORDER_TYPE)));
        order.setStartTime(rs.getDate(COL_ORDER_AT));
        return order;
    }
}
