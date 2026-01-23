package com.shop.leolaptop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {

    @RequestMapping("/home")
    public String homeView() {
        return "home";
    }

    @RequestMapping("/product")
    public String productView() {
        return "product-view";
    }
}
