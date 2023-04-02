package com.mrgostepz.smooth.model.db;

import lombok.Data;

@Data
public class TableCurrentState {
    private Integer id;
    private Integer tableInfoId;
    private Integer orderInfoId;
    private String status;
}
