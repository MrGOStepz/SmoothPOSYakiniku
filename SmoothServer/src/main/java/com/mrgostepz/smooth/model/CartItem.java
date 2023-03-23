package com.mrgostepz.smooth.model;

import lombok.Data;

@Data
public class CartItem {
    private int productId;
    private String name;
    private int quantity;
    private double price;
    private String comment;
}
