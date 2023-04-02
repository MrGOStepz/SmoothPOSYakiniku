package com.mrgostepz.smooth.model.db;

import lombok.Data;

import java.sql.Date;
import java.sql.Timestamp;

@Data
public class OrderDetail {
    private Integer orderDetailId;
    private Integer orderInfoId;
    private Integer productId;
    private String productName;
    private Integer quantity;
    private Double price;
    private String comment;
    private String status;
    private Timestamp startedTime;
    private Timestamp  lastUpdatedTime;
}
