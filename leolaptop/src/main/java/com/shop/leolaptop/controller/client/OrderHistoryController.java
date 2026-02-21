package com.shop.leolaptop.controller.client;

import com.shop.leolaptop.dto.order.OrderResponse;
import com.shop.leolaptop.service.admin.OrderService;
import jakarta.servlet.http.HttpSession;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
    public String getHistoryDetailPage(Model model,
                                       @PathVariable("id") long id) {
        OrderResponse order = orderService.getOrderById(id);
        model.addAttribute("contentPage", "/WEB-INF/view/client/page/historyDetail.jsp");
        model.addAttribute("order", order);

        return "client/layout/clientLayout";
    }

    @PostMapping("/cancel/{id}")
    public String cancelOrder(Model model,
                              @PathVariable("id") long id) {
        orderService.updateOrder(id, "CANCELLED");

        return "redirect:/history";
    }
}
