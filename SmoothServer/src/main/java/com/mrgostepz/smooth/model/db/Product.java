package com.mrgostepz.smooth.model.db;

import lombok.Data;

import java.util.List;

@Data
public class Product {
    private Integer id;
    private String name;
    private String foodType;
    private String description;
    private Integer stock;
    private Double price;
    private List<Integer> listProductIds;
    private Integer isAvailable;
    private Integer isActive;
}
