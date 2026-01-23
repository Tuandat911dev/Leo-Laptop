package com.shop.leolaptop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/user")
public class UserController {

    @GetMapping
    public String getCreateUserPage() {
        return "admin/user/create";
    }
}
