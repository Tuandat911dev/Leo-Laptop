package com.shop.leolaptop.controller.client;

import com.shop.leolaptop.dto.cart.CartResponseDTO;
import com.shop.leolaptop.dto.checkout.CheckoutDTO;
import com.shop.leolaptop.service.client.CartService;
import com.shop.leolaptop.service.client.CheckoutService;
import jakarta.servlet.http.HttpSession;
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
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/checkout")
@RequiredArgsConstructor
@FieldDefaults(makeFinal = true, level = AccessLevel.PRIVATE)
public class CheckoutController {
    CartService cartService;
    CheckoutService checkoutService;

    @GetMapping
    public String getCheckoutPage(Model model, HttpSession session) {
        List<CartResponseDTO> cartList = cartService.getCartList(session);
        CheckoutDTO checkoutDTO = new CheckoutDTO();
        model.addAttribute("contentPage", "/WEB-INF/view/client/page/checkout.jsp");
        model.addAttribute("cartList", cartList);
        model.addAttribute("newOrder", checkoutDTO);

        return "client/layout/clientLayout";
    }

    @PostMapping
    public String createNewOrder(Model model,
                                 HttpSession session,
                                 @ModelAttribute("newOrder") @Valid CheckoutDTO checkoutDTO,
                                 BindingResult bindingResult
    ) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("contentPage", "/WEB-INF/view/client/page/checkout.jsp");
            return "client/layout/clientLayout";
        } else {
            checkoutService.creatNewOrder(checkoutDTO, session);

            return "redirect:/";
        }
    }
}
