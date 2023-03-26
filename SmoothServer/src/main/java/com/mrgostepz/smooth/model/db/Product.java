package com.mrgostepz.smooth.model.db;

import lombok.Data;

@Data
public class Product {
    private Integer id;
    private String name;
    private String description;
    private Double price;
    private String foodType;
    private Integer categoryId;
    private Integer locationPage;
    private Integer locationRow;
    private Integer locationColumn;
    private Integer stock;
    private String imagePath;
    private Boolean isAvailable;
}
