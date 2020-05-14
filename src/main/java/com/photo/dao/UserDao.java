package com.photo.dao;

import com.photo.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserDao extends JpaRepository<User,Integer> {

    User findByUsername(String username);
    User findByEmail(String email);
}