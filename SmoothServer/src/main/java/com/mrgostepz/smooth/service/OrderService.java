package com.mrgostepz.smooth.service;

import com.mrgostepz.smooth.db.repository.OrderDetailRepository;
import com.mrgostepz.smooth.db.repository.OrderRepository;
import com.mrgostepz.smooth.exception.InsertRecordException;
import com.mrgostepz.smooth.exception.RecordNotFoundException;
import com.mrgostepz.smooth.model.CartItem;
import com.mrgostepz.smooth.model.ReceiptInfo;
import com.mrgostepz.smooth.model.db.OrderDetail;
import com.mrgostepz.smooth.model.db.OrderInfo;
import com.mrgostepz.smooth.model.enumtype.OrderType;
import com.mrgostepz.smooth.model.enumtype.Status;
import com.mrgostepz.smooth.model.request.OrderRequest;
import com.mrgostepz.smooth.model.response.OrderResponse;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class OrderService {

    private static final Logger logger = LogManager.getLogger(OrderService.class);

    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;
    private final OrderDetailService orderDetailService;

    public List<OrderInfo> getAllOrder() {
        List<OrderInfo> orderList = orderRepository.getAll();
        if (orderList == null) {
            throw new RecordNotFoundException("There is no record in order table.");
        }
        logger.info(orderList);
        return orderList;
    }

    public List<OrderInfo> getCookOrder() {
        List<OrderInfo> orderList = orderRepository.getCookOrder();
        if (orderList == null) {
            throw new RecordNotFoundException("There is no record in order table.");
        }
        logger.info(orderList);
        return orderList;
    }

    public OrderInfo getOrderById(int id) {
        OrderInfo order = orderRepository.getById(id);
        if (order == null) {
            throw new RecordNotFoundException("There is no order in this id.");
        }
        logger.info("OrderMenu {}", order);
        return order;
    }

    public OrderInfo addOrder(OrderRequest orderRequest) {
        List<OrderDetail> orderDetailList = generateOrderDetail(orderRequest);
        OrderInfo orderInfo = generateOrderMenu(orderDetailList, orderRequest.getTableName());

        int orderId = orderRepository.add(orderInfo);
        for (OrderDetail order : orderDetailList) {
            order.setOrderInfoId(orderId);
            orderDetailRepository.add(order);
        }

        orderInfo.setId(orderId);
        if (orderId > 0) {
            logger.info("Add new order Successfully: {}", orderInfo);
        } else {
            logger.warn("Cannot add new order: {}", orderInfo);
            throw new InsertRecordException("Cannot Create");
        }
        return orderInfo;
    }

    public List<OrderResponse> orderResult(OrderRequest orderRequest) {
        try {
            List<OrderInfo> orderInfoList;
            List<OrderResponse> orderResponseList = new ArrayList<>();
            List<OrderDetail> orderDetailList = new ArrayList<>();
            OrderResponse orderResponse;
            orderInfoList = orderRepository.getCookOrder();

            for (int i = 0; i < orderInfoList.size(); i++) {
                orderDetailList = new ArrayList<>();
                orderDetailList = orderDetailRepository.getOrderDetailByOrderInfoId(orderInfoList.get(i).getId());
                List<CartItem> cartItemList = new ArrayList<>();
                for (int j = 0; j < orderDetailList.size(); j++) {
                    CartItem cartItem = new CartItem();
                    cartItem.setProductId(orderDetailList.get(j).getProductId());
                    cartItem.setName(orderDetailList.get(j).getProductName());
                    cartItem.setQuantity(orderDetailList.get(j).getQuantity());
                    cartItem.setPrice(orderDetailList.get(j).getPrice());
                    cartItem.setComment(orderDetailList.get(j).getComment());
                    cartItemList.add(cartItem);
                }

            }
            for (OrderInfo orderinfo : orderInfoList) {
                orderResponse = new OrderResponse();
                orderResponse.setOrderInfoId(orderinfo.getId());
                orderResponse.setTableName(orderinfo.getTableName());
                orderResponse.setItems();
                orderResponseList.add(orderResponse);
            }
        } catch (Exception ex) {
            return null;
        }
    }

    private List<OrderDetail> generateOrderDetail(OrderRequest orderRequest) {
        List<OrderDetail> orderDetailList = new ArrayList<>();
        Timestamp dateTimeNow = new Timestamp(System.currentTimeMillis());
        for (CartItem cartItem : orderRequest.getCartItems()) {
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setProductId(cartItem.getProductId());
            orderDetail.setProductName(cartItem.getName());
            orderDetail.setQuantity(cartItem.getQuantity());
            orderDetail.setComment(cartItem.getComment());
            orderDetail.setPrice(cartItem.getPrice());
            orderDetail.setStatus(Status.COOK.getValueString());
            orderDetail.setStartedTime(dateTimeNow);
            orderDetail.setLastUpdatedTime(dateTimeNow);
            orderDetailList.add(orderDetail);
        }
        return orderDetailList;
    }

    private OrderInfo generateOrderMenu(List<OrderDetail> orderDetails, String tableName) {
        OrderInfo order = new OrderInfo();
        ReceiptInfo receiptInfo = new ReceiptInfo();
        Double amount = 0.0;
        Timestamp dateTimeNow = new Timestamp(System.currentTimeMillis());
        receiptInfo.setOrderDetails(orderDetails);
        order.setTableName(tableName);
        order.setOrderType(OrderType.DINE_IN.getValueString());
        order.setStatus(Status.COOK.getValueString());
        order.setReceiptJson(receiptInfo.toString());
        order.setStartedTime(dateTimeNow);
        order.setLastUpdatedTime(dateTimeNow);
        for (OrderDetail orderDetail : orderDetails) {
            amount += orderDetail.getPrice();
        }

        order.setAmount(amount);
        return order;
    }

    public void add(OrderInfo order) {
        int orderId = orderRepository.add(order);
        order.setId(orderId);
        if (orderId > 0) {
            logger.info("Add new order Successfully: {}", order);
        } else {
            logger.warn("Cannot add new order: {}", order);
            throw new InsertRecordException("Cannot Create");
        }
    }

    public void updateOrder(OrderInfo order) {
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
