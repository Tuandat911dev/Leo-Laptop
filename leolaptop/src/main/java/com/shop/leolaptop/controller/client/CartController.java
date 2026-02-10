package com.shop.leolaptop.controller.client;

import com.shop.leolaptop.service.client.CartService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/cart")
@RequiredArgsConstructor
@FieldDefaults(makeFinal = true, level = AccessLevel.PRIVATE)
public class CartController {
    CartService cartService;

    @PostMapping
    public String addToCart(@RequestParam("productId") long productId,
                            @RequestParam("userId") long userId,
                            @RequestParam("quantity") long quantity) {

        cartService.addToCart(productId, userId, quantity);

        return "redirect:/";
    }
}
