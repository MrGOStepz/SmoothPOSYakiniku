package com.mrgostepz.smooth.model.enumtype;

public enum OrderType {
    DINE_IN("Dine-In"),
    TAKEAWAY("Takeaway"),
    SET("Set"),
    DELIVERY("Delivery");

    private final String value;

    OrderType(String value) {
        this.value = value;
    }

    public String getValue() {
        return this.value;
    }

    public static OrderType fromString(String value) {
        for (OrderType foodType : OrderType.values()) {
            if (foodType.value.equalsIgnoreCase(value)) {
                return foodType;
            }
        }
        return null;
    }
}