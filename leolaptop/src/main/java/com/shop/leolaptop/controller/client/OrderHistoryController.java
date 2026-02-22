package com.shop.leolaptop.controller.client;

import com.shop.leolaptop.constant.OrderStatus;
import com.shop.leolaptop.constant.PaymentStatus;
import com.shop.leolaptop.dto.order.ClientOrderUpdate;
import com.shop.leolaptop.dto.order.OrderResponse;
import com.shop.leolaptop.service.admin.OrderService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.nio.file.AccessDeniedException;
import java.util.List;

@RequestMapping("/history")
@FieldDefaults(makeFinal = true, level = AccessLevel.PRIVATE)
@RequiredArgsConstructor
@Controller
public class OrderHistoryController {
    OrderService orderService;

    @GetMapping
    public String getHistoryPage(Model model, HttpSession session) {
        List<OrderResponse> orderList = orderService.getOrderByUser(session);
        model.addAttribute("contentPage", "/WEB-INF/view/client/page/history.jsp");
        model.addAttribute("orders", orderList);

        return "client/layout/clientLayout";
    }

    @GetMapping("/detail/{id}")
    public String getHistoryDetailPage(Model model, @PathVariable("id") long id) {
        OrderResponse order = orderService.getOrderById(id);
        model.addAttribute("contentPage", "/WEB-INF/view/client/page/historyDetail.jsp");
        model.addAttribute("order", order);

        return "client/layout/clientLayout";
    }

    @PostMapping("/cancel/{id}")
    public String cancelOrder(@PathVariable("id") long id) {
        orderService.updateOrder(id, String.valueOf(OrderStatus.CANCELLED), String.valueOf(PaymentStatus.UN_PAID));

        return "redirect:/history";
    }

    @GetMapping("/edit/{id}")
    public String getEditOrderPage(Model model, @PathVariable("id") long id) {
        OrderResponse currentOrder = orderService.getOrderById(id);
        ClientOrderUpdate order = ClientOrderUpdate.builder().id(currentOrder.getId()).receiverName(currentOrder.getReceiverName()).receiverAddress(currentOrder.getReceiverAddress()).receiverPhone(currentOrder.getReceiverPhone()).orderNotes(currentOrder.getOrderNotes()).build();

        model.addAttribute("contentPage", "/WEB-INF/view/client/page/editOrder.jsp");
        model.addAttribute("order", order);

        return "client/layout/clientLayout";
    }

    @PostMapping("/edit/{id}")
    public String editOrder(Model model, @PathVariable("id") long id, @ModelAttribute("order") @Valid ClientOrderUpdate order, BindingResult bindingResult, HttpSession session) throws AccessDeniedException {
        if (bindingResult.hasErrors()) {
            model.addAttribute("contentPage", "/WEB-INF/view/client/page/editOrder.jsp");
            return "client/layout/clientLayout";
        } else {
            orderService.clientUpdateOrderInfo(id, session, order);
        }

        return "redirect:/history";
    }
}
