package com.mrgostepz.smooth.service;

import com.mrgostepz.smooth.db.repository.OrderDetailRepository;
import com.mrgostepz.smooth.db.repository.OrderRepository;
import com.mrgostepz.smooth.exception.InsertRecordException;
import com.mrgostepz.smooth.exception.RecordNotFoundException;
import com.mrgostepz.smooth.model.db.OrderDetail;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class OrderDetailService {

    private static final Logger logger = LogManager.getLogger(OrderDetailService.class);

    private final OrderDetailRepository orderDetailRepository;

    public List<OrderDetail> getAllOrderDetail() {
        List<OrderDetail> orderDetailList = orderDetailRepository.getAll();
        if (orderDetailList == null) {
            throw new RecordNotFoundException("There is no record in orderDetail table.");
        }
        logger.info(orderDetailList);
        return orderDetailRepository.getAll();
    }

    public OrderDetail getOrderById(int id) {
        OrderDetail orderDetail = orderDetailRepository.getById(id);
        if (orderDetail == null) {
            throw new RecordNotFoundException("There is no orderDetail in this id.");
        }
        logger.info("OrderDetail {}", orderDetail);
        return orderDetail;
    }

    public void addOrder(OrderDetail orderDetail) {
        int orderDetailId = orderDetailRepository.add(orderDetail);
        orderDetail.setId(orderDetailId);
        if (orderDetailId > 0) {
            logger.info("Add new orderDetail Successfully: {}", orderDetail);
        } else {
            logger.warn("Cannot add new orderDetail: {}", orderDetail);
            throw new InsertRecordException("Cannot Create");
        }
    }

    public void updateOrder(OrderDetail orderDetail) {
        if (Boolean.TRUE.equals(orderDetailRepository.update(orderDetail))) {
            logger.info("Update orderDetail Successfully: {}", orderDetail);
        } else {
            logger.warn("Cannot Update orderDetail: {}", orderDetail);
        }

    }

    public void deleteOrder(int id) {
        if (Boolean.TRUE.equals(orderDetailRepository.deleteById(id))) {
            logger.info("Delete orderDetail Successfully: {}", id);
        } else {
            logger.warn("Cannot Delete orderDetail: {}", id);
        }
    }

}
