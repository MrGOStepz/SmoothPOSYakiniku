package com.mrgostepz.smooth.db.repository;

import com.mrgostepz.smooth.model.db.Order;
import org.springframework.stereotype.Repository;


@Repository
public interface OrderRepository extends CrudRepository<Order, Integer> {

}