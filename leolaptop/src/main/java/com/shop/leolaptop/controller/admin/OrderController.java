package com.shop.leolaptop.controller.admin;

import com.shop.leolaptop.dto.order.OrderResponse;
import com.shop.leolaptop.service.admin.OrderService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin/orders")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class OrderController {
    OrderService orderService;

    @GetMapping
    public String getOrderPage(Model model) {
        List<OrderResponse> orderList = orderService.getOrderList();
        model.addAttribute("contentPage", "/WEB-INF/view/admin/order/table.jsp");
        model.addAttribute("orderList", orderList);

        return "admin/layout/layout";
    }

    @GetMapping("/{id}")
    public ResponseEntity<OrderResponse> getOrderDetail(@PathVariable long id) {
        OrderResponse order = orderService.getOrderById(id);

        return ResponseEntity.ok(order);
    }

    @GetMapping("/update/{id}")
    public String getUpdateOrderPage(Model model,
                                     @PathVariable("id") long id) {
        OrderResponse order = orderService.getOrderById(id);
        model.addAttribute("contentPage", "/WEB-INF/view/admin/order/update.jsp");
        model.addAttribute("order", order);

        return "admin/layout/layout";
    }

    @PostMapping("/update/{id}")
    public String updateOrder(Model model,
                              @PathVariable("id") long id,
                              @RequestParam("orderStatus") String orderStatus,
                              @RequestParam("paymentStatus") String paymentStatus
    ) {
        orderService.updateOrder(id, orderStatus, paymentStatus);
        model.addAttribute("contentPage", "/WEB-INF/view/admin/order/table.jsp");

        return "redirect:/admin/orders";
    }
}
