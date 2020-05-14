package com.photo.controllers;

import com.photo.entity.User;
import com.photo.service.SecurityService;
import com.photo.service.UserService;
import com.photo.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.support.BindingAwareModelMap;
import org.springframework.web.bind.annotation.*;

import java.io.UnsupportedEncodingException;

/**
 * @author Zdornov Maxim
 * @version 1.0
 */
@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;


    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());
        return "registration";
    }


    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, Model model) throws UnsupportedEncodingException {
        if (!userValidator.validate(userForm, model)) {
            model.addAttribute("errorReg", "Ошибка регистрации");
            return "start";
        }
        userService.save(userForm);
        return "redirect:/start";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null) {
            model.addAttribute("error", "Имя пользователя или пароль неверны");
        }
        else if (logout != null) {
            model.addAttribute("message", "Вышли успешно");
            return "redirect:/start";
        }
        else {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            User user = userService.findByUsername(auth.getName());
            model.addAttribute("userLogin", user.getUsername());
        }
        return "start";
    }

    @RequestMapping(value = {"/", "/start"}, method = RequestMethod.GET)
    public String startPage(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.findByUsername(auth.getName());
        if (user!=null){
            model.addAttribute("userLogin", user.getUsername());
        }
        return "start";
    }

}
