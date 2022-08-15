package com.mrgostepz.smooth.model.enumtype;

public enum FoodType {
    APPETIZER("appetizer", 1),
    MAIN("main", 2),
    SET("set", 3),
    BEVERAGE("beverage", 4),
    DESSERT("dessert", 5);

    private final String valueString;
    private final Integer valueInt;

    FoodType(String valueString, Integer valueInt) {
        this.valueString = valueString;
        this.valueInt = valueInt;
    }

    public String getValueString() {
        return this.valueString;
    }
    public Integer getValueInt() {
        return this.valueInt;
    }

    public static FoodType fromString(String value) {
        for (FoodType foodType : FoodType.values()) {
            if (foodType.valueString.equalsIgnoreCase(value)) {
                return foodType;
            }
        }
        return null;
    }

    public static FoodType fromInt(Integer value) {
        for (FoodType foodType : FoodType.values()) {
            if (foodType.valueInt.intValue() == value) {
                return foodType;
            }
        }
        return null;
    }
}