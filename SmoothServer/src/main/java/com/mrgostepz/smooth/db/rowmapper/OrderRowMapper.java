package com.mrgostepz.smooth.db.rowmapper;

import com.mrgostepz.smooth.model.db.OrderInfo;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import static com.mrgostepz.smooth.db.ColumnName.*;

public class OrderRowMapper implements RowMapper<OrderInfo> {
    @Override
    public OrderInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
        OrderInfo order = new OrderInfo();
        order.setId(rs.getInt(COL_ID));
        order.setTableName(rs.getString(COL_TABLE_SECTION_NAME));
        order.setReceiptJson(rs.getString(COL_RECEIPT_JSON));
        order.setStatus(rs.getString(COL_STATUS));
        order.setOrderType(rs.getString(COL_ORDER_TYPE));
        order.setAmount(rs.getDouble(COL_AMOUNT));
        order.setStartedTime(rs.getTimestamp(COL_STARTED_TIME));
        order.setLastUpdatedTime(rs.getTimestamp(COL_LAST_UPDATED_TIME));
        return order;
    }
}
