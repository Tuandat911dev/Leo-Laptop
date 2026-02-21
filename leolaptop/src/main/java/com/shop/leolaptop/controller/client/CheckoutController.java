package com.shop.leolaptop.controller.client;

import com.shop.leolaptop.constant.PaymentMethod;
import com.shop.leolaptop.domain.Order;
import com.shop.leolaptop.dto.cart.CartResponseDTO;
import com.shop.leolaptop.dto.checkout.CheckoutDTO;
import com.shop.leolaptop.service.client.CartService;
import com.shop.leolaptop.service.client.CheckoutService;
import com.shop.leolaptop.service.client.VNPayService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Mod;
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
    VNPayService vnPayService;

    @GetMapping("/success")
    public String getOrderSuccessPage(Model model) {
        model.addAttribute("contentPage", "/WEB-INF/view/client/page/orderSuccess.jsp");

        return "client/layout/clientLayout";
    }

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
            Order newOrder = checkoutService.creatNewOrder(checkoutDTO, session);
            PaymentMethod paymentMethod = PaymentMethod.valueOf(checkoutDTO.getPaymentMethod());
            if (paymentMethod == PaymentMethod.VNPAY) {
                String baseUrl = "http://localhost:8080";
                String vnpayUrl = vnPayService.createOrder(
                        (int) newOrder.getTotalPrice(),
                        Long.toString(newOrder.getId()),
                        baseUrl);

                return "redirect:" + vnpayUrl;
            }

            return "redirect:/checkout/success";
        }
    }

    @GetMapping("/vnpay-payment")
    public String GetMapping(HttpServletRequest request, Model model) {
        int paymentStatus = vnPayService.orderReturn(request);

        String orderInfo = request.getParameter("vnp_OrderInfo");
        String paymentTime = request.getParameter("vnp_PayDate");
        String transactionId = request.getParameter("vnp_TransactionNo");
        String totalPrice = request.getParameter("vnp_Amount");

        model.addAttribute("orderId", orderInfo);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("paymentTime", paymentTime);
        model.addAttribute("transactionId", transactionId);

        if (paymentStatus == 1) {
            model.addAttribute("contentPage", "/WEB-INF/view/client/page/paymentSuccess.jsp");
        } else {
            model.addAttribute("contentPage", "/WEB-INF/view/client/page/paymentFail.jsp");
        }
        checkoutService.updatePaymentOrder(Long.parseLong(orderInfo), paymentStatus);

        return "client/layout/clientLayout";
    }
}
