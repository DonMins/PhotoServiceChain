package com.photo.dao;

import com.photo.entity.Order;
import com.photo.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderDao extends JpaRepository<Order,Integer> {

    List<Order> findAll();
    Order findById(Long id);
    List<Order> findByUsersField(User user);
}
