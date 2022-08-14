package com.mrgostepz.smooth.db.rowmapper;

import com.mrgostepz.smooth.model.db.Order;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import static com.mrgostepz.smooth.db.ColumnName.*;

public class OrderRowMapper implements RowMapper<Order> {
    @Override
    public Order mapRow(ResultSet rs, int rowNum) throws SQLException {
        Order order = new Order();
        order.setId(rs.getInt(COL_ID));
        order.setOrderDetail(rs.getInt(COL_ORDER_DETAIL_ID));
        order.setIsActive(rs.getInt(COL_IS_ACTIVE));
    }
}
