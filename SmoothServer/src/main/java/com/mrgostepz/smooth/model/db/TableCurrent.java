package com.mrgostepz.smooth.model.db;

import lombok.Data;

@Data
public class TableCurrent {
    private Integer id;
    private String name;
    private Integer orderId;
    private Integer statusId;
    private Integer isActive;
}
