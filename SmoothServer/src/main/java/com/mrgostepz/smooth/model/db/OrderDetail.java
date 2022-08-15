package com.mrgostepz.smooth.model.db;

import com.mrgostepz.smooth.model.enumtype.Status;
import lombok.Data;

@Data
public class OrderDetail {
    private Integer id;
    private Integer productId;
    private Integer orderId;
    private Status status;
    private Integer Quality;
    private Float price;
    private String comment;
    private Boolean isActive;
}
