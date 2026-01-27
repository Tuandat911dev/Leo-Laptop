package com.shop.leolaptop.controller.admin;

import com.shop.leolaptop.domain.User;
import com.shop.leolaptop.service.UserService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin/users")
@RequiredArgsConstructor
@FieldDefaults(makeFinal = true, level = AccessLevel.PRIVATE)
public class UserController {
    UserService userService;

    @GetMapping("/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        model.addAttribute("contentPage", "/WEB-INF/view/admin/user/create.jsp");
        return "/admin/layout/layout";
    }

    @PostMapping("/create")
    public String createUser(@ModelAttribute("newUser")User user) {
        User newUser = userService.createUser(user);
        return "redirect:/admin/users";
    }

    @GetMapping("/{id}")
    @ResponseBody
    public ResponseEntity<User> getUserDetail(@PathVariable Long id) {
        User user = userService.getUserById(id);
        return ResponseEntity.ok(user);
    }

    @GetMapping
    public String getUserPage(Model model) {
        model.addAttribute("contentPage", "/WEB-INF/view/admin/user/table.jsp");
        List<User> user = userService.getAllUser();
        model.addAttribute("userList", user);
        return "/admin/layout/layout";
    }

    @GetMapping("/update/{id}")
    public String getUpdateUserPage(@PathVariable long id, Model model) {
        User currentUser = userService.getUserById(id);
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("contentPage", "/WEB-INF/view/admin/user/update.jsp");
        return "/admin/layout/layout";
    }

    @PostMapping("/update/{id}")
    public String updateUser(@PathVariable long id, @ModelAttribute("currentUser")User user) {
        userService.updateUser(id, user);
        return "redirect:/admin/users";
    }

    @DeleteMapping("/delete/{id}")
    @ResponseBody
    public ResponseEntity<String> deleteUser(@PathVariable long id) {
        userService.deleteUser(id);
        return ResponseEntity.ok("deleted");
    }
}
