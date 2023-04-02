package com.mrgostepz.smooth.db.repository;

import com.mrgostepz.smooth.model.db.OrderInfo;
import org.springframework.stereotype.Repository;


@Repository
public interface OrderRepository extends CrudRepository<OrderInfo, Integer> {

}