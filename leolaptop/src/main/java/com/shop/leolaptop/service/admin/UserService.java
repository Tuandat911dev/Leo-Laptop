package com.shop.leolaptop.service.admin;

import com.shop.leolaptop.domain.Role;
import com.shop.leolaptop.domain.User;
import com.shop.leolaptop.dto.UserDTO;
import com.shop.leolaptop.mapper.UserMapper;
import com.shop.leolaptop.repository.RoleRepository;
import com.shop.leolaptop.repository.UserRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(makeFinal = true, level = AccessLevel.PRIVATE)
public class UserService {
    UserRepository userRepository;
    RoleRepository roleRepository;

    public User createUser(User user) {
        return userRepository.save(user);
    }

    public void updateUser(long id, UserDTO user) {
        User currentUser = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found!"));

        Role currentRole = roleRepository.findById(user.getRoleId())
                .orElseThrow(() -> new RuntimeException("Role Not Found!"));

        currentUser.setAddress(user.getAddress());
        currentUser.setPhone(user.getPhone());
        currentUser.setFullName(user.getFullName());
        currentUser.setRole(currentRole);

        userRepository.save(currentUser);
    }

    public User getUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public UserDTO getUserById(long id) {
        User user = userRepository.findById(id).orElseThrow(() -> new RuntimeException("User Not Found!"));

        return UserMapper.toUserDTO(user);
    }

    public List<User> getAllUser() {
        return userRepository.findAll();
    }

    public void deleteUser(long id) {
        User currentUser = userRepository.findById(id).orElseThrow(() -> new RuntimeException("User Not Found!"));
        userRepository.delete(currentUser);
    }
}
