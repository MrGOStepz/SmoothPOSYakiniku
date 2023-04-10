package com.mrgostepz.smooth.model.response;

import com.mrgostepz.smooth.model.CartItem;
import com.mrgostepz.smooth.model.TableInfo;
import lombok.Data;

import java.util.List;

@Data
public class OrderResponse {
    private Integer orderInfoId;
    private TableInfo tableInfo;
    private String status;
    private List<CartItem> items;
}
