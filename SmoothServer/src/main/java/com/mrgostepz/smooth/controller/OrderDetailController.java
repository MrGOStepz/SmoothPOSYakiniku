package com.mrgostepz.smooth.controller;

import com.mrgostepz.smooth.model.db.OrderDetail;
import com.mrgostepz.smooth.service.OrderDetailService;
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
@RequestMapping(path = "api/v1/orderdetail")
class OrderDetailController {

    private static final Logger logger = LogManager.getLogger(OrderDetailController.class);

    private final OrderDetailService orderDetailService;


    @GetMapping(path = "/all")
    @ResponseBody
    public ResponseEntity<List<OrderDetail>> getAllOrder() {
        return new ResponseEntity<>(orderDetailService.getAllOrderDetail(), HttpStatus.OK);
    }

    @GetMapping(path = "/{id}")
    @ResponseBody
    public ResponseEntity<OrderDetail> getOrderById(@PathVariable int id) {
        OrderDetail orderDetail = orderDetailService.getOrderById(id);
        return new ResponseEntity<>(orderDetail, HttpStatus.OK);
    }

    @PostMapping(path = "/add")
    @ResponseBody
    public ResponseEntity<String> addNewOrder(@RequestBody String jsonReq) {
        OrderDetail orderDetail = (OrderDetail) SmoothUtil.convertJsonToObject(jsonReq, OrderDetail.class);
        orderDetailService.addOrder(orderDetail);
        return new ResponseEntity<>(String.format("Add new order detail successfully: %s", orderDetail.toString()), HttpStatus.CREATED);
    }

    @PutMapping(path = "/update")
    public String updateOrder(@RequestBody String jsonReq) {
        OrderDetail order = (OrderDetail) SmoothUtil.convertJsonToObject(jsonReq, OrderDetail.class);
        orderDetailService.updateOrder(order);
        return String.format("Update Order: %s completed.", order);
    }

    @DeleteMapping("/{id}")
    public String deleteOrder(@PathVariable int id) {
        orderDetailService.deleteOrder(id);
        return String.format("Delete Order Id: %d completed.", id);
    }

//    private OrderDetail convertJsonToOrder(String json){
//        try {
//            ObjectMapper mapper = new ObjectMapper();
//            Map<String, Object> map = mapper.readValue(json, Map.class);
//            OrderDetail orderMenu = new OrderDetail();
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
