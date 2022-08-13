package com.mrgostepz.smooth.model.db;

import lombok.Data;

@Data
public class OrderDetail {
    private Integer id;
    private Integer productId;
    private Integer orderId;
    private String statusId;
    private Integer productQuality;
    private Double price;
    private String comment;
    private Integer isActive;
}
