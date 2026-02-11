package com.shop.leolaptop.controller.client;

import com.shop.leolaptop.dto.cart.CartResponseDTO;
import com.shop.leolaptop.dto.cart.CartUpdateDTO;
import com.shop.leolaptop.service.client.CartService;
import jakarta.servlet.http.HttpSession;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/cart")
@RequiredArgsConstructor
@FieldDefaults(makeFinal = true, level = AccessLevel.PRIVATE)
public class CartController {
    CartService cartService;

    @GetMapping
    public String getCartPage(Model model, HttpSession session) {
        List<CartResponseDTO> cartList = cartService.getCartList(session);
        model.addAttribute("contentPage", "/WEB-INF/view/client/page/cart.jsp");
        model.addAttribute("cartList", cartList);

        return "client/layout/clientLayout";
    }

    @PostMapping
    public String addToCart(@RequestParam("productId") long productId,
                            @RequestParam("userId") long userId,
                            @RequestParam("quantity") long quantity) {

        cartService.addToCart(productId, userId, quantity);

        return "redirect:/";
    }
}
