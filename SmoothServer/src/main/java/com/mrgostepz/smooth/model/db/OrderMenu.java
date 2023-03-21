package com.mrgostepz.smooth.model.db;

import java.sql.Date;

import com.mrgostepz.smooth.model.enumtype.OrderType;
import com.mrgostepz.smooth.model.enumtype.Status;
import lombok.Data;

@Data
public class OrderMenu {
    private Integer id;
    private Integer tableId;
    private String receiptJson;
    private Status status;
    private OrderType orderType;
    private Double amount;
    private Date startTime;
    private Date lastUpdatedTime;
}
