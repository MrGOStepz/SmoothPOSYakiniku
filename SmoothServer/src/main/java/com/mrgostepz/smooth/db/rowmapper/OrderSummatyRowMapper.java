package com.mrgostepz.smooth.db.rowmapper;

import com.mrgostepz.smooth.model.db.OrderDetail;
import com.mrgostepz.smooth.model.db.OrderSummary;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import static com.mrgostepz.smooth.db.ColumnName.COL_AMOUNT;
import static com.mrgostepz.smooth.db.ColumnName.COL_COMMENT;
import static com.mrgostepz.smooth.db.ColumnName.COL_LAST_UPDATED_TIME;
import static com.mrgostepz.smooth.db.ColumnName.COL_ORDER_DETAIL_ID;
import static com.mrgostepz.smooth.db.ColumnName.COL_ORDER_INFO_ID;
import static com.mrgostepz.smooth.db.ColumnName.COL_PRICE;
import static com.mrgostepz.smooth.db.ColumnName.COL_PRODUCT_ID;
import static com.mrgostepz.smooth.db.ColumnName.COL_QUANTITY;
import static com.mrgostepz.smooth.db.ColumnName.COL_STARTED_TIME;
import static com.mrgostepz.smooth.db.ColumnName.COL_STATUS;

public class OrderSummatyRowMapper implements RowMapper<OrderSummary> {
    @Override
    public OrderSummary mapRow(ResultSet rs, int rowNum) throws SQLException {
        OrderSummary orderSummary = new OrderSummary();
        orderSummary.setProductId(rs.getInt(COL_PRODUCT_ID));
        orderSummary.setQuantity(rs.getInt(COL_QUANTITY));
        orderSummary.setAmount(rs.getDouble(COL_AMOUNT));
        return orderSummary;
    }
}
