package com.photo.dao;

import com.photo.entity.Order;
import com.photo.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderDao extends JpaRepository<Order,Integer> {

}
