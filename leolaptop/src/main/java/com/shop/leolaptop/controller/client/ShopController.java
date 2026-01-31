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
@RequestMapping("/shop")
public class ShopController {

    @GetMapping
    public String getShopPage(Model model) {
        model.addAttribute("contentPage", "/WEB-INF/view/client/page/shop.jsp");

        return "/client/layout/clientLayout";
    }
}
