package com.mrgostepz.smooth.model.db;

import com.mrgostepz.smooth.model.enumtype.Status;
import lombok.Data;

@Data
public class TableCurrentState {
    private Integer id;
    private String name;
    private Integer orderId;
    private Status status;
    private Integer isActive;
}
