package com.mrgostepz.smooth.model.db;

import com.mrgostepz.smooth.model.enumtype.Status;
import lombok.Data;

import java.sql.Date;

@Data
public class OrderDetail {
    private Integer orderDetailId;
    private Integer orderId;
    private Integer productId;
    private Integer quantity;
    private Double price;
    private String comment;
    private Status status;
    private Date orderTime;
    private Date lastUpdatedTime;
}
