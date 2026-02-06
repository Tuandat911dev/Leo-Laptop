package com.shop.leolaptop.controller.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorPageController {
    @GetMapping("/not-found")
    public String getNotFoundPage() {
        return "client/auth/notFound";
    }

    @GetMapping("/access-deny")
    public String getAccessDenyPage() {
        return "client/auth/accessDeny";
    }
}
