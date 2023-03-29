package com.mrgostepz.smooth.model.db;

import java.sql.Date;
import java.sql.Timestamp;

import com.mrgostepz.smooth.model.enumtype.OrderType;
import com.mrgostepz.smooth.model.enumtype.Status;
import lombok.Data;

@Data
public class OrderMenu {
    private Integer id;
    private Integer tableId;
    private String receiptJson;
    private String status;
    private String orderType;
    private Double amount;
    private Timestamp startTime;
    private Timestamp lastUpdatedTime;
}
