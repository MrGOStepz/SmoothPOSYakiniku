package com.mrgostepz.smooth.db.repository;

import com.mrgostepz.smooth.model.db.OrderDetail;
import com.mrgostepz.smooth.model.db.OrderInfo;
import com.mrgostepz.smooth.model.db.OrderSummary;
import com.mrgostepz.smooth.model.request.OrderUpdateStatus;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Set;

@Repository
public interface OrderInfoRepositories extends CrudRepositories<OrderInfo, Integer> {
    List<OrderInfo> getCookOrder();
    List<OrderDetail> getOrderByTableName(String tableName, Set<Integer> idList);
    List<OrderSummary> getOrderDetailByDay();
    List<OrderInfo> getOrderInfoByTableName(String tableName);
    Boolean updateOrderStatus(OrderUpdateStatus orderUpdateStatus);
}