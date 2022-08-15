package com.mrgostepz.smooth.model.db;

import java.sql.Date;

import com.mrgostepz.smooth.model.enumtype.OrderType;
import com.mrgostepz.smooth.model.enumtype.Status;
import lombok.Data;

@Data
public class OrderMenu {
    private Integer id;
    private Integer tableId;
    private String orderDetail;
    private OrderType orderType;
    private Status status;
    private Double amount;
    private Date startTime;
}
