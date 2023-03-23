package com.mrgostepz.smooth.model.request;

import com.mrgostepz.smooth.model.CartItem;
import lombok.Data;

import java.util.List;

@Data
public class OrderRequest {
    private Integer tableId;
    private List<CartItem> cartItems;
}
