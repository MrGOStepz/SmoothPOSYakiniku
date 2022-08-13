package com.mrgostepz.smooth.model.enumtype;

public enum FoodType {
    APPETIZER("appetizer"),
    MAIN("main"),
    BEVERAGE("beverage"),
    DESSERT("dessert");

    private final String value;

    FoodType(String value) {
        this.value = value;
    }

    public String getValue() {
        return this.value;
    }

    public static FoodType fromString(String value) {
        for (FoodType foodType : FoodType.values()) {
            if (foodType.value.equalsIgnoreCase(value)) {
                return foodType;
            }
        }
        return null;
    }
}