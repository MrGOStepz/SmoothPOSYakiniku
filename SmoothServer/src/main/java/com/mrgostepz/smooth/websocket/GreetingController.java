package com.mrgostepz.smooth.websocket;
import com.mrgostepz.smooth.model.Greeting;
import com.mrgostepz.smooth.model.HelloMessage;
import com.mrgostepz.smooth.model.request.CartRequest;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.util.HtmlUtils;

@Controller
public class GreetingController {


    @MessageMapping("/hello")
    @SendTo("/topic/greetings")
    public Greeting greeting(HelloMessage message) throws Exception {
        Thread.sleep(1000); // simulated delay
        return new Greeting("Hello, " + HtmlUtils.htmlEscape(message.getName()) + "!");
    }

    @MessageMapping("/order")
    @SendTo("/topic/ordering")
    public CartRequest ordering(CartRequest cartRequest) throws Exception {

        return cartRequest;
    }
//    public OrderMessage ordering(OrderMessage orderMessage) throws Exception {
//        return orderMessage;
//    }
}
