package com.mrgostepz.smooth.db.repository;

import com.mrgostepz.smooth.model.db.OrderMenu;
import org.springframework.stereotype.Repository;


@Repository
public interface OrderRepository extends CrudRepository<OrderMenu, Integer> {

}