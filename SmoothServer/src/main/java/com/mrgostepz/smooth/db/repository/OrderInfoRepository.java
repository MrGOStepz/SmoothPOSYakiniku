package com.mrgostepz.smooth.db.repository;

import com.mrgostepz.smooth.model.db.OrderInfo;
import com.mrgostepz.smooth.model.request.OrderUpdateStatus;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderInfoRepository extends CrudRepository<OrderInfo, Integer> {
    List<OrderInfo> getCookOrder();
    Boolean updateOrderStatus(OrderUpdateStatus orderUpdateStatus);
}