package com.mrgostepz.smooth.service;

import com.mrgostepz.smooth.db.repository.OrderRepository;
import com.mrgostepz.smooth.db.repository.OrderRepository;
import com.mrgostepz.smooth.exception.InsertRecordException;
import com.mrgostepz.smooth.exception.RecordNotFoundException;
import com.mrgostepz.smooth.model.db.OrderMenu;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class OrderService {

    private static final Logger logger = LogManager.getLogger(OrderService.class);

    private final OrderRepository orderRepository;

    public List<OrderMenu> getAllOrder() {
        List<OrderMenu> orderList = orderRepository.getAll();
        if (orderList == null) {
            throw new RecordNotFoundException("There is no record in order table.");
        }
        logger.info(orderList);
        return orderRepository.getAll();
    }

    public OrderMenu getOrderById(int id) {
        OrderMenu order = orderRepository.getById(id);
        if (order == null) {
            throw new RecordNotFoundException("There is no order in this id.");
        }
        logger.info("OrderMenu {}", order);
        return order;
    }

    public void addOrder(OrderMenu order) {
        int orderId = orderRepository.add(order);
        order.setId(orderId);
        if (orderId > 0) {
            logger.info("Add new order Successfully: {}", order);
        } else {
            logger.warn("Cannot add new order: {}", order);
            throw new InsertRecordException("Cannot Create");
        }
    }

    public void updateOrder(OrderMenu order) {
        if (Boolean.TRUE.equals(orderRepository.update(order))) {
            logger.info("Update order Successfully: {}", order);
        } else {
            logger.warn("Cannot Update order: {}", order);
        }

    }

    public void deleteOrder(int id) {
        if (Boolean.TRUE.equals(orderRepository.deleteById(id))) {
            logger.info("Delete order Successfully: {}", id);
        } else {
            logger.warn("Cannot Delete order: {}", id);
        }
    }

}
