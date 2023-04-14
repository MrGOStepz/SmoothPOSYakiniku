package com.mrgostepz.smooth.model.request;

import lombok.Data;

@Data
public class OrderUpdateStatus {
    private int orderInfoId;
    private String status;
}
