package com.shop.leolaptop.controller.client;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@FieldDefaults(makeFinal = true, level = AccessLevel.PRIVATE)
@RequestMapping("/product")
public class ProductDetailController {
    @GetMapping("/{productId}")
    public String getProductDetailPage(@PathVariable("productId") long productId, Model model) {
        model.addAttribute("contentPage", "/WEB-INF/view/client/page/productDetail.jsp");

        return "/client/layout/clientLayout";
    }
}
