package com.mrgostepz.smooth.db.repository;

import com.mrgostepz.smooth.model.db.OrderDetail;
import org.springframework.stereotype.Repository;


@Repository
public interface OrderDetailRepository extends CrudRepository<OrderDetail, Integer> {

}