package com.shop.leolaptop.controller.client;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@FieldDefaults(makeFinal = true, level = AccessLevel.PRIVATE)
@RequestMapping("/")
public class HomeController {

    @GetMapping
    public String getHomePage(Model model) {
        model.addAttribute("contentPage", "/WEB-INF/view/client/page/home.jsp");

        return "/client/layout/clientLayout";
    }
}
