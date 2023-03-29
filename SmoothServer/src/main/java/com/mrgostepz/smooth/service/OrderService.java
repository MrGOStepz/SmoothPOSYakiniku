package com.mrgostepz.smooth.service;

import com.mrgostepz.smooth.db.repository.OrderRepository;
import com.mrgostepz.smooth.exception.InsertRecordException;
import com.mrgostepz.smooth.exception.RecordNotFoundException;
import com.mrgostepz.smooth.model.CartItem;
import com.mrgostepz.smooth.model.ReceiptInfo;
import com.mrgostepz.smooth.model.db.OrderDetail;
import com.mrgostepz.smooth.model.db.OrderMenu;
import com.mrgostepz.smooth.model.enumtype.OrderType;
import com.mrgostepz.smooth.model.enumtype.Status;
import com.mrgostepz.smooth.model.request.OrderRequest;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import static com.fasterxml.jackson.databind.type.LogicalType.DateTime;

@Service
@RequiredArgsConstructor
public class OrderService {

    private static final Logger logger = LogManager.getLogger(OrderService.class);

    private final OrderRepository orderRepository;
    private final OrderDetailService orderDetailService;

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

    public void addOrder(OrderRequest orderRequest) {
        List<OrderDetail> orderDetail = generateOrderDetail(orderRequest);
        OrderMenu orderMenu = generateOrderMenu(orderDetail, orderRequest.getTableId());

        int orderId = orderRepository.add(orderMenu);

        orderMenu.setId(orderId);
        if (orderId > 0) {
            logger.info("Add new order Successfully: {}", orderMenu);
        } else {
            logger.warn("Cannot add new order: {}", orderMenu);
            throw new InsertRecordException("Cannot Create");
        }
    }

    private List<OrderDetail> generateOrderDetail(OrderRequest orderRequest) {
        List<OrderDetail> orderDetailList = new ArrayList<>();
        Date dateTimeNow = new Date(System.currentTimeMillis());
        for(CartItem cartItem: orderRequest.getCartItems()) {
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setProductId(cartItem.getProductId());
            orderDetail.setProductName(cartItem.getName());
            orderDetail.setQuantity(cartItem.getQuantity());
            orderDetail.setComment(cartItem.getComment());
            orderDetail.setPrice(cartItem.getPrice());
            orderDetail.setStatus(Status.COOK.getValueString());
            orderDetail.setOrderTime(dateTimeNow);
            orderDetail.setLastUpdatedTime(dateTimeNow);
            orderDetailList.add(orderDetail);
        }
        return orderDetailList;
    }
    private OrderMenu generateOrderMenu(List<OrderDetail> orderDetails, int tableId)  {
        OrderMenu order = new OrderMenu();
        ReceiptInfo receiptInfo = new ReceiptInfo();
        Double amount = 0.0;
        Timestamp dateTimeNow = new Timestamp(System.currentTimeMillis());
        receiptInfo.setOrderDetails(orderDetails);
        order.setTableId(tableId);
        order.setOrderType(OrderType.DINE_IN.getValueString());
        order.setStatus(Status.COOK.getValueString());
        order.setReceiptJson(receiptInfo.toString());
        order.setStartTime(dateTimeNow);
        order.setLastUpdatedTime(dateTimeNow);
        for(OrderDetail orderDetail: orderDetails) {
            amount += orderDetail.getPrice();
        }

        order.setAmount(amount);
        return order;
    }
    public void add(OrderMenu order) {
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
