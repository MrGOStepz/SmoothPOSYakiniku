package com.mrgostepz.smooth.model.response;

import com.mrgostepz.smooth.model.db.OrderSummary;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class OrderSummaryResponse {
      private List<OrderSummary> orderSummaries = new ArrayList<>();
}
