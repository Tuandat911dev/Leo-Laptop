package com.shop.leolaptop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/dashboard")
public class DashboardController {
    @GetMapping
    public String getDashboardPage(Model model) {
        model.addAttribute("contentPage", "/WEB-INF/view/admin/dashboard/show.jsp");
        return "/admin/layout/layout";
    }
}
