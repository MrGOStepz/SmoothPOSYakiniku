package com.mrgostepz.smooth.model.response;

import com.mrgostepz.smooth.model.db.OrderDetail;
import com.mrgostepz.smooth.model.db.OrderInfo;
import com.mrgostepz.smooth.model.db.OrderSummary;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class OrderDetailInfoResponse {
   private List<OrderInfo> orderInfoList = new ArrayList<>();
   private List<OrderDetail> orderDetailList = new ArrayList<>();
}
