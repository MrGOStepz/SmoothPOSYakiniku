package com.mrgostepz.pos.rsockettesting;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.messaging.rsocket.RSocketRequester;
import org.springframework.messaging.rsocket.RSocketStrategies;

@SpringBootApplication
public class RSocketTestingApplication {

    public static void main(String[] args) {
        SpringApplication.run(RSocketTestingApplication.class, args);
    }



}
