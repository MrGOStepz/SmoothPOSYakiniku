package com.mrgostepz.smooth.model.db;

import com.mrgostepz.smooth.model.enumtype.Status;
import lombok.Data;

@Data
public class TableCurrentState {
    private Integer tableCurrentStateId;
    private Integer tableId;
    private Integer orderId;
    private String status;
}
