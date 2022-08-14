package com.mrgostepz.smooth.db.dao;

import com.mrgostepz.smooth.db.repository.OrderRepository;
import com.mrgostepz.smooth.model.db.Order;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class OrderDAO implements OrderRepository {
    @Override
    public List<Order> getAll() {
        return null;
    }

    @Override
    public Order getById(Integer id) {
        return null;
    }

    @Override
    public Integer add(Order order) {
        return null;
    }

    @Override
    public Boolean update(Order order) {
        return null;
    }

    @Override
    public Boolean deleteById(Integer id) {
        return null;
    }
}
