package com.mrgostepz.smooth.model.db;

import com.mrgostepz.smooth.model.enumtype.FoodType;
import lombok.Data;

import java.util.List;

@Data
public class Product {
    private Integer id;
    private String name;
    private FoodType foodType;
    private String description;
    private Integer stock;
    private Float price;
    private List<Integer> listProductIds;
    private Boolean isAvailable;
    private Boolean isActive;
}
