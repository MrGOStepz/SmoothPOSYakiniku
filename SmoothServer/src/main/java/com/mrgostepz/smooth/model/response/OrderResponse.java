package com.mrgostepz.smooth.model.response;

import com.mrgostepz.smooth.model.CartItem;
import lombok.Data;

import java.util.List;

@Data
public class OrderResponse {
    private Integer OrderInfoId;
    private String tableName;
    private String status;
    private List<CartItem> items;
}
