package com.mrgostepz.smooth.model.db;

import com.mrgostepz.smooth.model.enumtype.FoodType;
import lombok.Data;

import java.util.List;

@Data
public class Product {
    private Integer id;
    private String name;
    private String description;
    private Double price;
    private FoodType foodType;
    private Integer categoryId;
    private Integer locationPage;
    private Integer locationRow;
    private Integer locationColumn;
    private Integer stock;
    private String imagePath;
    private Boolean isActive;
}
