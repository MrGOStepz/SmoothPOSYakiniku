package com.mrgostepz.smooth.controller;

public class MessageController {
    @Controller
    public class MarketDataRSocketController {

        private final MarketDataRepository marketDataRepository;

        public MarketDataRSocketController(MarketDataRepository marketDataRepository) {
            this.marketDataRepository = marketDataRepository;
        }

        @MessageMapping("currentMarketData")
        public Mono<MarketData> currentMarketData(MarketDataRequest marketDataRequest) {
            return marketDataRepository.getOne(marketDataRequest.getStock());
        }
    }
}
