package com.shop.leolaptop.controller.client;

import com.shop.leolaptop.dto.cart.CartResponseDTO;
import com.shop.leolaptop.service.client.CartService;
import jakarta.servlet.http.HttpSession;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/checkout")
@RequiredArgsConstructor
@FieldDefaults(makeFinal = true, level = AccessLevel.PRIVATE)
public class CheckoutController {
    CartService cartService;

    @GetMapping
    public String getCheckoutPage(Model model, HttpSession session) {
        List<CartResponseDTO> cartList = cartService.getCartList(session);
        model.addAttribute("contentPage", "/WEB-INF/view/client/page/checkout.jsp");
        model.addAttribute("cartList", cartList);

        return "client/layout/clientLayout";
    }
}
