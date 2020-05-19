package com.photo.service;

import com.photo.entity.Order;
import com.photo.entity.User;

import java.util.List;

public interface OrderService {
    void save(Order order);

    List<Order> findByUser(User user);

    Order findById(Long id);

    List<Order> findAll();
}
