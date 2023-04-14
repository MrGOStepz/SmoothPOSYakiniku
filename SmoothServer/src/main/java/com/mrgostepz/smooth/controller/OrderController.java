package com.mrgostepz.smooth.controller;

import com.mrgostepz.smooth.model.db.OrderInfo;
import com.mrgostepz.smooth.model.request.OrderRequest;
import com.mrgostepz.smooth.model.request.OrderUpdateStatus;
import com.mrgostepz.smooth.model.response.OrderResponse;
import com.mrgostepz.smooth.service.OrderService;
import com.mrgostepz.smooth.until.SmoothUtil;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

//https://mkyong.com/spring-boot/spring-rest-error-handling-example/
//http://localhost:8080/spring-mvc-basics/foos?id=abc
// @RequestParam means it is a parameter from the GET or POST request

@RestController
@RequiredArgsConstructor
@RequestMapping(path = "api/v1/order")
class OrderController {

    private static final Logger logger = LogManager.getLogger(OrderController.class);

    private final OrderService orderService;

    @GetMapping(path = "/all")
    @ResponseBody
    public ResponseEntity<List<OrderInfo>> getAllOrder() {
        return new ResponseEntity<>(orderService.getAllOrder(), HttpStatus.OK);
    }

    @GetMapping(path = "/cook")
    @ResponseBody
    public ResponseEntity<List<OrderResponse>> getCookOrder() {
        return new ResponseEntity<>(orderService.getListOrderCook(), HttpStatus.OK);
    }

    @GetMapping(path = "/{id}")
    @ResponseBody
    public ResponseEntity<OrderInfo> getOrderById(@PathVariable int id) {
        OrderInfo order = orderService.getOrderById(id);
        return new ResponseEntity<>(order, HttpStatus.OK);
    }

    @PostMapping(path = "/order")
    @ResponseBody
    public ResponseEntity<String> addNewOrder(@RequestBody String jsonReq) {
        OrderRequest orderRequest = (OrderRequest) SmoothUtil.convertJsonToObject(jsonReq, OrderRequest.class);
        orderService.addOrder(orderRequest);
        return new ResponseEntity<>(String.format("Add new order successfully: %s", orderRequest.toString()), HttpStatus.CREATED);
    }

    @PostMapping(path = "/add")
    @ResponseBody
    public ResponseEntity<String> add(@RequestBody String jsonReq) {
        OrderInfo orderInfo = (OrderInfo) SmoothUtil.convertJsonToObject(jsonReq, OrderInfo.class);
        orderService.add(orderInfo);
        return new ResponseEntity<>(String.format("Add new order successfully: %s", orderInfo.toString()), HttpStatus.CREATED);
    }

    @PutMapping(path = "/update")
    public String updateOrder(@RequestBody String jsonReq) {
        OrderInfo order = (OrderInfo) SmoothUtil.convertJsonToObject(jsonReq, OrderInfo.class);
        orderService.updateOrder(order);
        return String.format("Update Order: %s completed.", order);
    }

    @PutMapping(path = "/update/status")
    public String updateOrderDone(@RequestBody String jsonReq) {
        OrderUpdateStatus orderDone = (OrderUpdateStatus) SmoothUtil.convertJsonToObject(jsonReq, OrderUpdateStatus.class);
        orderService.updateOrderStatus(orderDone);
        return String.format("Update Order: %s completed.", orderDone);
    }

    @DeleteMapping("/{id}")
    public String deleteOrder(@PathVariable int id) {
        orderService.deleteOrder(id);
        return String.format("Delete Order Id: %d completed.", id);
    }

}
