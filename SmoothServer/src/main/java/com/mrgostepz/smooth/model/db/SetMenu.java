package com.mrgostepz.smooth.model.db;

import lombok.Data;

@Data
public class SetMenu {
    private Integer id;
    private String name;
    private String listProduct;
    private String description;
    private Integer stock;
    private Double price;
    private Integer isAvailable;
    private Integer isActive;
}
