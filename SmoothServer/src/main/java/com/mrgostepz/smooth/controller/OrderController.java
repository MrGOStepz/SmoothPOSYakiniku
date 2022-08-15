package com.mrgostepz.smooth.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.mrgostepz.smooth.model.db.OrderMenu;
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
    public ResponseEntity<List<OrderMenu>> getAllOrder() {
        return new ResponseEntity<>(orderService.getAllOrder(), HttpStatus.OK);
    }

    @GetMapping(path = "/{id}")
    @ResponseBody
    public ResponseEntity<OrderMenu> getOrderById(@PathVariable int id) {
        OrderMenu order = orderService.getOrderById(id);
        return new ResponseEntity<>(order, HttpStatus.OK);
    }

    @PostMapping(path = "/add")
    @ResponseBody
    public ResponseEntity<String> addNewOrder(@RequestBody String jsonReq) {
        OrderMenu order = (OrderMenu) SmoothUtil.convertJsonToObject(jsonReq, OrderMenu.class);
        orderService.addOrder(order);
        return new ResponseEntity<>(String.format("Add new order successfully: %s", order.toString()), HttpStatus.CREATED);
    }

    @PutMapping(path = "/update")
    public String updateOrder(@RequestBody String jsonReq) {
        OrderMenu order = (OrderMenu) SmoothUtil.convertJsonToObject(jsonReq, OrderMenu.class);
        orderService.updateOrder(order);
        return String.format("Update Order: %s completed.", order);
    }

    @DeleteMapping("/{id}")
    public String deleteOrder(@PathVariable int id) {
        orderService.deleteOrder(id);
        return String.format("Delete Order Id: %d completed.", id);
    }



}
