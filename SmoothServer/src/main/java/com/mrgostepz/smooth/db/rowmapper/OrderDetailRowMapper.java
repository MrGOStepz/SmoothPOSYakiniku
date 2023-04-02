package com.mrgostepz.smooth.db.rowmapper;

import com.mrgostepz.smooth.model.db.OrderDetail;
import com.mrgostepz.smooth.model.enumtype.Status;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import static com.mrgostepz.smooth.db.ColumnName.*;

public class OrderDetailRowMapper implements RowMapper<OrderDetail> {
    @Override
    public OrderDetail mapRow(ResultSet rs, int rowNum) throws SQLException {
        OrderDetail orderDetail = new OrderDetail();
        orderDetail.setOrderDetailId(rs.getInt(COL_ID));
        orderDetail.setOrderInfoId(rs.getInt(COL_ORDER_ID));
        orderDetail.setProductId(rs.getInt(COL_PRODUCT_ID));
        orderDetail.setQuantity(rs.getInt(COL_QUANTITY));
        orderDetail.setPrice(rs.getDouble(COL_PRICE));
        orderDetail.setComment(rs.getString(COL_COMMENT));
        orderDetail.setStatus(rs.getString(COL_CURRENT_STATUS));
        orderDetail.setStartedTime(rs.getTimestamp(COL_ORDER_TIME));
        orderDetail.setLastUpdatedTime(rs.getTimestamp(COL_LAST_UPDATED_TIME));
        return orderDetail;
    }
}
