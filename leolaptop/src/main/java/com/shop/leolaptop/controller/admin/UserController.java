package com.shop.leolaptop.controller.admin;

import com.shop.leolaptop.domain.Role;
import com.shop.leolaptop.domain.User;
import com.shop.leolaptop.dto.user.CreateUserDTO;
import com.shop.leolaptop.dto.user.UpdateUserDTO;
import com.shop.leolaptop.dto.user.UserDTO;
import com.shop.leolaptop.mapper.UserMapper;
import com.shop.leolaptop.service.admin.RoleService;
import com.shop.leolaptop.service.admin.UserService;
import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
@RequestMapping("/admin/users")
@RequiredArgsConstructor
@FieldDefaults(makeFinal = true, level = AccessLevel.PRIVATE)
public class UserController {
    UserService userService;
    RoleService roleService;

    @GetMapping("/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new CreateUserDTO());
        List<Role> roles = roleService.getAllRole();
        model.addAttribute("contentPage", "/WEB-INF/view/admin/user/create.jsp");
        model.addAttribute("roles", roles);
        return "/admin/layout/layout";
    }

    @PostMapping("/create")
    public String createUser(@ModelAttribute("newUser") @Valid CreateUserDTO createUserDTO,
                             BindingResult bindingResult,
                             @RequestParam("avatar") MultipartFile avatar, Model model) {
        if (bindingResult.hasErrors()) {
            List<Role> roles = roleService.getAllRole();
            model.addAttribute("contentPage", "/WEB-INF/view/admin/user/create.jsp");
            model.addAttribute("roles", roles);
            return "/admin/layout/layout";
        } else {
            User newUser = userService.createUser(createUserDTO, avatar);
            return "redirect:/admin/users";
        }
    }

    @GetMapping("/{id}")
    @ResponseBody
    public ResponseEntity<UserDTO> getUserDetail(@PathVariable Long id) {
        return ResponseEntity.ok(userService.getUserById(id));
    }

    @GetMapping
    public String getUserPage(Model model) {
        model.addAttribute("contentPage", "/WEB-INF/view/admin/user/table.jsp");
        List<User> users = userService.getAllUser();
        List<UserDTO> listUserDTO = users.stream()
                .map(UserMapper::toUserDTO)
                .toList();
        model.addAttribute("userList", listUserDTO);

        return "/admin/layout/layout";
    }

    @GetMapping("/update/{id}")
    public String getUpdateUserPage(@PathVariable long id, Model model) {
        UserDTO user = userService.getUserById(id);
        UpdateUserDTO currentUser = UserMapper.userDtoToUpdateUserDto(user);
        List<Role> roles = roleService.getAllRole();
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("roles", roles);
        model.addAttribute("contentPage", "/WEB-INF/view/admin/user/update.jsp");
        return "/admin/layout/layout";
    }

    @PostMapping("/update/{id}")
    public String updateUser(@PathVariable long id,
                             @ModelAttribute("currentUser") @Valid UpdateUserDTO user,
                             BindingResult bindingResult,
                             @RequestParam("avatarFile") MultipartFile avatarFile,
                             Model model) {
        if (bindingResult.hasErrors()) {
            List<Role> roles = roleService.getAllRole();
            UserDTO currentUser = userService.getUserById(id);
            model.addAttribute("contentPage", "/WEB-INF/view/admin/user/update.jsp");
            model.addAttribute("roles", roles);
            user.setAvatar(currentUser.getAvatar());
            model.addAttribute("currentUser", user);
            return "/admin/layout/layout";
        } else {
            userService.updateUser(id, user, avatarFile);
            return "redirect:/admin/users";
        }
    }

    @DeleteMapping("/delete/{id}")
    @ResponseBody
    public ResponseEntity<String> deleteUser(@PathVariable long id) {
        userService.deleteUser(id);
        return ResponseEntity.ok("deleted");
    }
}
