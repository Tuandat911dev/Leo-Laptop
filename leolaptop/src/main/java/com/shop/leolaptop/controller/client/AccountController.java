package com.shop.leolaptop.controller.client;

import com.shop.leolaptop.dto.user.UpdateUserDTO;
import com.shop.leolaptop.dto.user.UserDTO;
import com.shop.leolaptop.service.admin.UserService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/account")
@RequiredArgsConstructor
@FieldDefaults(makeFinal = true, level = AccessLevel.PRIVATE)
public class AccountController {
    UserService userService;

    @GetMapping
    public String getAccountManagePage(Model model,
                                       HttpSession session) {
        long userId = (Long) session.getAttribute("userId");
        UserDTO user = userService.getUserById(userId);

        model.addAttribute("contentPage", "/WEB-INF/view/client/page/accountManage.jsp");
        model.addAttribute("user", user);

        return "client/layout/clientLayout";
    }

    @PostMapping("/update-info")
    public String updateAccount(Model model,
                                HttpSession session,
                                @ModelAttribute("user") @Valid UpdateUserDTO request,
                                BindingResult bindingResult,
                                @RequestParam("avatarFile") MultipartFile avatar) {

        if (bindingResult.hasErrors()) {
            model.addAttribute("contentPage", "/WEB-INF/view/client/page/accountManage.jsp");
            return "client/layout/clientLayout";
        } else {
            userService.clientUpdateInfo(session, request, avatar);
            return "redirect:/";
        }
    }
}
