package com.mrgostepz.smooth.model.response;

import com.mrgostepz.smooth.model.CartItem;
import lombok.Data;

import java.util.List;

@Data
public class OrderResponse {
    private Integer orderInfoId;
    private String tableName;
    private List<CartItem> items;
}
