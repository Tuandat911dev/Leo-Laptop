package com.shop.leolaptop.controller.client;

import com.shop.leolaptop.dto.user.CreateUserDTO;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
@FieldDefaults(makeFinal = true, level = AccessLevel.PRIVATE)
public class AuthClientController {
    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        CreateUserDTO newUser = new CreateUserDTO();
        model.addAttribute("newUser", newUser);
        return "/client/auth/register";
    }

    @GetMapping("/login")
    public String getLoginPage(Model model) {
        CreateUserDTO loginUser = new CreateUserDTO();
        model.addAttribute("loginUser", loginUser);
        return "/client/auth/login";
    }
}
