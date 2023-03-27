package com.mrgostepz.smooth.model.db;

import com.mrgostepz.smooth.model.enumtype.Status;
import lombok.Data;

import java.sql.Date;

@Data
public class OrderDetail {
    private Integer orderDetailId;
    private Integer orderId;
    private Integer productId;
    private String productName;
    private Integer quantity;
    private Double price;
    private String comment;
    private String status;
    private Date orderTime;
    private Date lastUpdatedTime;
}
