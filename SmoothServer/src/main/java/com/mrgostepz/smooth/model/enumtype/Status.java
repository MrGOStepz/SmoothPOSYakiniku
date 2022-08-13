package com.mrgostepz.smooth.model.enumtype;

public enum Status {
    VACANT("Vacant"),
    EATING("Eating"),
    COOK("Cook"),
    PAID("Paid"),
    CLEANING("Cleaning"),
    DONE("Done");

    private final String value;

    Status(String value) {
        this.value = value;
    }

    public String getValue() {
        return this.value;
    }

    public static Status fromString(String value) {
        for (Status status : Status.values()) {
            if (status.value.equalsIgnoreCase(value)) {
                return status;
            }
        }
        return null;
    }
}
