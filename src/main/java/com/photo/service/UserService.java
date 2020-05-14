package com.photo.service;
import com.photo.entity.User;

/**
 * interface UserService
 *
 * @author Zdornov Maxim
 * @version 1.0
 */

public interface UserService {
    void save(User user);
    User findByUsername(String username);
}
