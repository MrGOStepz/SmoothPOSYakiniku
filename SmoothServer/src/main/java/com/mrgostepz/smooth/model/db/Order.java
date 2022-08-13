package com.mrgostepz.smooth.model.db;

import java.sql.Date;

import lombok.Data;

@Data
public class Order {
    private Integer id;
    private Integer tableId;
    private String orderDetail;
    private Integer orderTypeId;
    private Integer statusId;
    private Date orderAt;
    private Integer isActive;
}
