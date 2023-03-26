package com.mrgostepz.smooth.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mrgostepz.smooth.model.db.OrderMenu;
import com.mrgostepz.smooth.model.db.Product;
import com.mrgostepz.smooth.model.enumtype.FoodType;
import com.mrgostepz.smooth.model.enumtype.OrderType;
import com.mrgostepz.smooth.model.enumtype.Status;
import com.mrgostepz.smooth.model.request.OrderRequest;
import com.mrgostepz.smooth.service.OrderService;
import com.mrgostepz.smooth.until.SmoothUtil;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import static com.mrgostepz.smooth.model.constraint.JsonKey.AMOUNT;
import static com.mrgostepz.smooth.model.constraint.JsonKey.DESCRIPTION;
import static com.mrgostepz.smooth.model.constraint.JsonKey.FOOD_TYPE;
import static com.mrgostepz.smooth.model.constraint.JsonKey.ID;
import static com.mrgostepz.smooth.model.constraint.JsonKey.IS_ACTIVE;
import static com.mrgostepz.smooth.model.constraint.JsonKey.IS_AVAILABLE;
import static com.mrgostepz.smooth.model.constraint.JsonKey.LIST_PRODUCT;
import static com.mrgostepz.smooth.model.constraint.JsonKey.NAME;
import static com.mrgostepz.smooth.model.constraint.JsonKey.ORDER_DETAIL;
import static com.mrgostepz.smooth.model.constraint.JsonKey.ORDER_TYPE;
import static com.mrgostepz.smooth.model.constraint.JsonKey.PRICE;
import static com.mrgostepz.smooth.model.constraint.JsonKey.START_TIME;
import static com.mrgostepz.smooth.model.constraint.JsonKey.STATUS;
import static com.mrgostepz.smooth.model.constraint.JsonKey.STOCK;
import static com.mrgostepz.smooth.model.constraint.JsonKey.TABLE_ID;

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
        OrderMenu orderMenu = (OrderMenu) SmoothUtil.convertJsonToObject(jsonReq, OrderMenu.class);
        orderService.add(orderMenu);
        return new ResponseEntity<>(String.format("Add new order successfully: %s", orderMenu.toString()), HttpStatus.CREATED);
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

//    private OrderMenu convertJsonToOrder(String json){
//        try {
//            ObjectMapper mapper = new ObjectMapper();
//            Map<String, Object> map = mapper.readValue(json, Map.class);
//            OrderMenu orderMenu = new OrderMenu();
//            orderMenu.setId((Integer) map.get(ID));
//            orderMenu.setTableId((Integer) map.get(TABLE_ID));
//            orderMenu.setOrderDetail((String) map.get(ORDER_DETAIL));
//            orderMenu.setOrderType(OrderType.fromString((String) map.get(ORDER_TYPE)));
//            orderMenu.setStatus(Status.fromString((String) map.get(STATUS)));
//            orderMenu.setAmount((Double) map.get(AMOUNT));
//            orderMenu.setStartTime((Date) map.get(START_TIME));
//            return orderMenu;
//        } catch (Exception ex) {
//            logger.error(ex.getMessage());
//            return null;
//        }
//    }


}
