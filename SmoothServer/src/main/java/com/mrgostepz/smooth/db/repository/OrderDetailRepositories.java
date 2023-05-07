package com.mrgostepz.smooth.db.repository;

import com.mrgostepz.smooth.model.db.OrderDetail;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderDetailRepositories extends CrudRepositories<OrderDetail, Integer> {
    List<OrderDetail> getOrderDetailByOrderInfoId(int id);
    Boolean updateOrderDetailByQuantity(int id,int quantity, Double price);
}