package com.mrgostepz.smooth.websocket;
import com.mrgostepz.smooth.model.Greeting;
import com.mrgostepz.smooth.model.HelloMessage;
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
    @SendTo("/topic/order")
    public KetchenOrder order(HelloMessage message) throws Exception {
        return
    }
}
