package com.shop.leolaptop.controller.client;

import com.shop.leolaptop.domain.User;
import com.shop.leolaptop.dto.user.CreateUserDTO;
import com.shop.leolaptop.dto.user.RegisterDTO;
import com.shop.leolaptop.service.admin.UserService;
import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
@FieldDefaults(makeFinal = true, level = AccessLevel.PRIVATE)
public class AuthClientController {
    UserService userService;

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        RegisterDTO newUser = new RegisterDTO();
        model.addAttribute("newUser", newUser);
        return "/client/auth/register";
    }

    @PostMapping("/register")
    public String registerNewAccount(@ModelAttribute("newUser") @Valid RegisterDTO registerDTO,
                                     BindingResult bindingResult) {
        if(bindingResult.hasErrors()) {
            return "/client/auth/register";
        } else {
           User user = userService.registerNewClient(registerDTO);
           return "redirect:/login";
        }
    }

    @GetMapping("/login")
    public String getLoginPage(Model model) {
        CreateUserDTO loginUser = new CreateUserDTO();
        model.addAttribute("loginUser", loginUser);
        return "/client/auth/login";
    }
}
