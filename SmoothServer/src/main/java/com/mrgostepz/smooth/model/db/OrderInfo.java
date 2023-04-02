package com.mrgostepz.smooth.model.db;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class OrderInfo {
    private Integer id;
    private Integer tableInfoId;
    private String receiptJson;
    private String status;
    private String orderType;
    private Double amount;
    private Timestamp startedTime;
    private Timestamp lastUpdatedTime;
}
