package com.mrgostepz.smooth.db.rowmapper;

import com.mrgostepz.smooth.model.db.OrderDetail;
import com.mrgostepz.smooth.model.enumtype.Status;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import static com.mrgostepz.smooth.db.ColumnName.*;

public class OrderDetailMapper implements RowMapper<OrderDetail> {
    @Override
    public OrderDetail mapRow(ResultSet rs, int rowNum) throws SQLException {
        OrderDetail orderDetail = new OrderDetail();
        orderDetail.setId(rs.getInt(COL_ID));
        orderDetail.setProductId(rs.getInt(COL_PRODUCT_ID));
        orderDetail.setOrderId(rs.getInt(COL_ORDER_ID));
        orderDetail.setStatus(Status.fromString(rs.getString(COL_STATUS)));
        return orderDetail;
    }
}
