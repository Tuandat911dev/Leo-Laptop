package com.shop.leolaptop.controller;

import com.shop.leolaptop.domain.User;
import com.shop.leolaptop.service.UserService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Mod;
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
        return "admin/user/create";
    }

    @PostMapping("/create")
    public String createUser(@ModelAttribute("newUser")User user) {
        User newUser = userService.createUser(user);
        return "redirect:/admin/users";
    }

//    @GetMapping("/{email}")
//    public String getUserByEmail(@PathVariable String email) {
//        User user = userService.getUserByEmail(email);
//        System.out.println(user.toString());
//        return "admin/user/table";
//    }

    @GetMapping("/{id}")
    @ResponseBody
    public ResponseEntity<User> getUserDetail(@PathVariable Long id) {
        User user = userService.getUserById(id);
        return ResponseEntity.ok(user);
    }

    @GetMapping
    public String getAllUser(Model model) {
        List<User> user = userService.getAllUser();
        model.addAttribute("userList", user);
        return "admin/user/table";
    }

    @GetMapping("/update/{id}")
    public String getUpdateUserPage(@PathVariable long id, Model model) {
        User currentUser = userService.getUserById(id);
        model.addAttribute("currentUser", currentUser);
        return "admin/user/update";
    }

    @PostMapping("/update/{id}")
    public String updateUser(@PathVariable long id, @ModelAttribute("currentUser")User user) {
        userService.updateUser(id, user);
        return "redirect:/admin/users";
    }
}
