package com.mrgostepz.smooth.model.db;

import lombok.Data;

@Data
public class OrderSummary {
    private Integer productId;
    private Integer popupDetailId;
    private Integer quantity;
    private Double amount;
}
