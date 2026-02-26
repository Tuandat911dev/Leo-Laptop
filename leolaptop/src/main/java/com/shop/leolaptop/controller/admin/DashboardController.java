package com.shop.leolaptop.controller.admin;

import com.shop.leolaptop.service.admin.DashBoardService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/dashboard")
@RequiredArgsConstructor
@FieldDefaults(makeFinal = true, level = AccessLevel.PRIVATE)
public class DashboardController {
    DashBoardService dashboardService;

    @GetMapping
    public String getDashboardPage(Model model) {
        model.addAttribute("contentPage", "/WEB-INF/view/admin/dashboard/show.jsp");
        model.addAttribute("totalOrders", dashboardService.countOrders());
        model.addAttribute("totalProducts", dashboardService.countProducts());
        model.addAttribute("totalCustomers", dashboardService.countClients());
        model.addAttribute("totalAdmins", dashboardService.countAdmins());

        return "admin/layout/layout";
    }
}
