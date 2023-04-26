package com.mrgostepz.smooth.service;

import com.mrgostepz.smooth.db.repository.OrderDetailRepository;
import com.mrgostepz.smooth.db.repository.OrderInfoRepository;
import com.mrgostepz.smooth.exception.InsertRecordException;
import com.mrgostepz.smooth.exception.RecordNotFoundException;
import com.mrgostepz.smooth.model.CartItem;
import com.mrgostepz.smooth.model.ReceiptInfo;
import com.mrgostepz.smooth.model.db.OrderDetail;
import com.mrgostepz.smooth.model.db.OrderInfo;
import com.mrgostepz.smooth.model.db.Product;
import com.mrgostepz.smooth.model.enumtype.OrderType;
import com.mrgostepz.smooth.model.enumtype.Status;
import com.mrgostepz.smooth.model.request.OrderRequest;
import com.mrgostepz.smooth.model.request.OrderUpdateStatus;
import com.mrgostepz.smooth.model.response.OrderDetailInfoResponse;
import com.mrgostepz.smooth.model.response.OrderResponse;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
@RequiredArgsConstructor
public class OrderService {

    private static final Logger logger = LogManager.getLogger(OrderService.class);

    private final OrderInfoRepository orderInfoRepository;
    private final OrderDetailRepository orderDetailRepository;
    private final ProductService productService;

    public List<OrderInfo> getAllOrder() {
        List<OrderInfo> orderList = orderInfoRepository.getAll();
        if (orderList == null) {
            throw new RecordNotFoundException("There is no record in order table.");
        }
        logger.info(orderList);
        return orderList;
    }

    public OrderDetailInfoResponse getOrderSummary() {
        List<OrderDetail> orderDetailList = orderInfoRepository.getOrderDetailByDay();
        OrderDetailInfoResponse orderResponse = new OrderDetailInfoResponse();
        if (orderDetailList == null) {
            throw new RecordNotFoundException("There is no record in order table.");
        }

        orderResponse.setOrderDetailList(orderDetailList);
        logger.info(orderDetailList);
        return orderResponse;
    }

    public List<OrderInfo> getCookOrder() {
        List<OrderInfo> orderList = orderInfoRepository.getCookOrder();
        if (orderList == null) {
            throw new RecordNotFoundException("There is no record in order table.");
        }
        logger.info(orderList);
        return orderList;
    }

    public OrderInfo getOrderById(int id) {
        OrderInfo order = orderInfoRepository.getById(id);
        if (order == null) {
            throw new RecordNotFoundException("There is no order in this id.");
        }
        logger.info("OrderMenu {}", order);
        return order;
    }

    public OrderInfo addOrder(OrderRequest orderRequest) {
        List<OrderDetail> orderDetailList = generateOrderDetail(orderRequest);
        OrderInfo orderInfo = generateOrderMenu(orderDetailList, orderRequest.getTableName());

        int orderId = orderInfoRepository.add(orderInfo);
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

    public List<OrderResponse> getListOrderCook() {
        try {
            List<OrderInfo> orderInfoList;
            List<OrderResponse> orderResponseList = new ArrayList<>();
            List<OrderDetail> orderDetailList;
            OrderResponse orderResponse;
            orderInfoList = orderInfoRepository.getCookOrder();
            for (OrderInfo orderInfo : orderInfoList) {
                orderDetailList = orderDetailRepository.getOrderDetailByOrderInfoId(orderInfo.getId());
                List<CartItem> cartItemList = new ArrayList<>();
                orderResponse = new OrderResponse();
                orderResponse.setOrderInfoId(orderInfo.getId());
                orderResponse.setTableName(orderInfo.getTableName());
                for (OrderDetail orderDetail : orderDetailList) {
                    CartItem cartItem = new CartItem();
                    Product tempProduct = productService.getProductByCache(orderDetail.getProductId());
                    orderDetail.setProductName(tempProduct.getName());
                    cartItem.setProductId(orderDetail.getProductId());
                    cartItem.setName(orderDetail.getProductName());
                    cartItem.setQuantity(orderDetail.getQuantity());
                    cartItem.setPrice(orderDetail.getPrice());
                    cartItem.setComment(orderDetail.getComment());
                    cartItemList.add(cartItem);
                }
                orderResponse.setItems(cartItemList);
                orderResponseList.add(orderResponse);
            }
            return orderResponseList;

        } catch (Exception ex) {
            return new ArrayList<>();
        }
    }

    public OrderDetailInfoResponse getListOrderByTableName(String tableName) {
        try{
            List<OrderInfo> orderInfoList = orderInfoRepository.getOrderInfoByTableName(tableName);

            Set<Integer> idList = new HashSet<>();
            for (int i = 0; i < orderInfoList.size(); i++) {
                idList.add(orderInfoList.get(i).getId());
            }

            List<OrderDetail> orderDetailList = orderInfoRepository.getOrderByTableName(tableName, idList);
            OrderDetailInfoResponse orderResponse = new OrderDetailInfoResponse();
            orderResponse.setOrderInfoList(orderInfoList);
            orderResponse.setOrderDetailList(orderDetailList);
            return orderResponse;
        } catch (Exception ex) {
            return new OrderDetailInfoResponse();
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
        int orderId = orderInfoRepository.add(order);
        order.setId(orderId);
        if (orderId > 0) {
            logger.info("Add new order Successfully: {}", order);
        } else {
            logger.warn("Cannot add new order: {}", order);
            throw new InsertRecordException("Cannot Create");
        }
    }

    public void updateOrder(OrderInfo order) {
        if (Boolean.TRUE.equals(orderInfoRepository.update(order))) {
            logger.info("Update order Successfully: {}", order);
        } else {
            logger.warn("Cannot Update order: {}", order);
        }

    }

    public void updateOrderStatus(OrderUpdateStatus orderUpdateStatus) {
        if (Boolean.TRUE.equals(orderInfoRepository.updateOrderStatus(orderUpdateStatus))) {
            logger.info("Update order status Successfully: {}", orderUpdateStatus);
        } else {
            logger.warn("Cannot Update order status: {}", orderUpdateStatus);
        }
    }

    public void deleteOrder(int id) {
        if (Boolean.TRUE.equals(orderInfoRepository.deleteById(id))) {
            logger.info("Delete order Successfully: {}", id);
        } else {
            logger.warn("Cannot Delete order: {}", id);
        }
    }

}
