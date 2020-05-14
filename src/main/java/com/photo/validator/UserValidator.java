package com.photo.validator;
import com.photo.entity.User;
import com.photo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * This class checks that the user data entered is correct.
 *
 * @author Zdornov Maxim
 * @version 1.0
 */

@Component
public class UserValidator {

    @Autowired
    private UserService userService;

    public Boolean validate(Object o, Model model) {
        User user = (User) o;
        boolean flag = true;
        if (user.getUsername().length() < 4 || user.getUsername().length() > 32) {
            model.addAttribute("username", "Имя пользователя должно быть от 4 до 32 символов.");
            flag = false;
        }

        if (userService.findByUsername(user.getUsername()) != null) {
            model.addAttribute("username", "Имя пользователя уже существует");
            flag = false;
        }
        if (userService.findByEmail(user.getEmail()) != null) {
            model.addAttribute("email", "Email уже существует");
            flag = false;
        }

        if (user.getPassword().length() < 4 || user.getPassword().length() > 32) {
            model.addAttribute("password", "Пароль должен содержать более 4 символов.");
            flag = false;
        }

        if (!user.getConfirmPassword().equals(user.getPassword())) {
            model.addAttribute("confirmPassword", "Пароли должны совпадать.");
            flag = false;
        }
        return flag;
    }
}
