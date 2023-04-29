package com.mrgostepz.smooth.model;

import lombok.Data;

@Data
public class CartItem {
    private int productId;
    private int popupDetailId;
    private String name;
    private String description;
    private int quantity;
    private double price;
    private String comment;
}
