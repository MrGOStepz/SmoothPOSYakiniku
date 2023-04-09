package com.mrgostepz.smooth.websocket;
import com.mrgostepz.smooth.model.Greeting;
import com.mrgostepz.smooth.model.HelloMessage;
import com.mrgostepz.smooth.model.db.OrderInfo;
import com.mrgostepz.smooth.model.request.OrderRequest;
import com.mrgostepz.smooth.model.response.OrderResponse;
import com.mrgostepz.smooth.service.OrderService;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.util.HtmlUtils;

@RequiredArgsConstructor
@Controller
public class WebSocketController {
    private static final Logger logger = LogManager.getLogger(WebSocketController.class);
    private final OrderService orderService;
    @MessageMapping("/hello")
    @SendTo("/topic/greetings")
    public Greeting greeting(HelloMessage message) throws Exception {
        Thread.sleep(1000); // simulated delay
        return new Greeting("Hello, " + HtmlUtils.htmlEscape(message.getName()) + "!");
    }

    @MessageMapping("/order")
    @SendTo("/topic/ordering")
    public OrderResponse ordering(OrderRequest orderRequest) throws Exception {
        OrderInfo orderInfo = orderService.addOrder(orderRequest);
        OrderResponse orderResponse = new OrderResponse();
        orderResponse.setOrderInfoId(orderInfo.getId());
        orderResponse.setTableName(orderInfo.getTableInfoId());

        logger.info("Order Request: {}", orderRequest.toString());
        return orderRequest;
    }

}