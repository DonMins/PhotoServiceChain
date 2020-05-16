package com.photo.controllers;

import com.photo.entity.User;
import com.photo.service.SecurityService;
import com.photo.service.UserService;
import com.photo.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.awt.*;
import java.io.*;
import java.util.List;

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

    @Autowired
    private UserDetailsService userDetailsService;


    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());
        return "orderPrint";
    }


    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, Model model) throws UnsupportedEncodingException {
        if (!userValidator.validate(userForm, model)) {
            model.addAttribute("errorReg", "Ошибка регистрации");
            return "start";
        }
        userService.save(userForm);
        securityService.autoLogin(userForm.getUsername(), userForm.getConfirmPassword());

        model.addAttribute("success", "Регистрация прошла успешно");
        return "start";
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

    @RequestMapping(value = "/users")
    public String users(Model model) {
        List<User> userList = userService.findAll();

        model.addAttribute("users", userList);

        return "users";
    }

    @RequestMapping(value = "/orderPrint")
    public String orderPrint(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.findByUsername(auth.getName());
        model.addAttribute("name", user.getName());
        model.addAttribute("surname", user.getSurname());
        model.addAttribute("patronymic", user.getPatronymic());
        model.addAttribute("phone", user.getPhone());
        model.addAttribute("email", user.getEmail());
        return "orderPrint";
    }

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public String upload(@ModelAttribute("userForm") User userForm, Model model,
                         @RequestParam(value = "total", required = false) String total,
                         @RequestParam(value = "sizePhoto", required = false) String sizePhoto,
                         @RequestParam(value = "typePhoto", required = false) String typePhoto,
                         @RequestParam(value = "comment", required = false) String comment,
                         @RequestParam(value = "photo", required = false) List<MultipartFile> file) {
        File downloadDirectory = new File("C:\\USERS_PHOTO");
        if (!downloadDirectory.exists()) {
            downloadDirectory.mkdir();
        }
        file.forEach(x -> {
            if (!x.isEmpty()) {
                byte[] bytes = new byte[0];
                try {
                    bytes = x.getBytes();

                    FileOutputStream writer = new FileOutputStream("C:\\USERS_PHOTO\\" + userForm.getEmail() + x.getOriginalFilename(), false);
                    writer.write(bytes);
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        });
        return "redirect:/start";
    }

}
