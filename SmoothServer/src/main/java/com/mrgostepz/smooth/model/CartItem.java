package com.mrgostepz.smooth.model;

import lombok.Data;

@Data
public class CartItem {
    private int id;
    private String title;
    private String description;
    private double price;
    private int quantity;
}
