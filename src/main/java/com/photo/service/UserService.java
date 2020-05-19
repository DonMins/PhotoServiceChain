package com.photo.service;

import com.photo.entity.User;

import java.util.List;

/**
 * interface UserService
 *
 * @author Zdornov Maxim
 * @version 1.0
 */

public interface UserService {
    void save(User user);

    User findByUsername(String username);

    User findByEmail(String email);

    List<User> findAll();
}
