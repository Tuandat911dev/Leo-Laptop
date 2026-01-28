package com.shop.leolaptop.service.admin;

import com.shop.leolaptop.domain.User;
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

    public User createUser(User user) {
        return userRepository.save(user);
    }

    public void updateUser(long id, User user) {
        User currentUser = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found!"));

        currentUser.setAddress(user.getAddress());
        currentUser.setPhone(user.getPhone());
        currentUser.setFullName(user.getFullName());

        userRepository.save(currentUser);
    }

    public User getUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public User getUserById(long id) {
        return userRepository.findById(id).orElseThrow(() -> new RuntimeException("User not found!"));
    }

    public List<User> getAllUser() {
        return userRepository.findAll();
    }

    public void deleteUser(long id) {
        User currentUser = getUserById(id);
        userRepository.delete(currentUser);
    }
}
