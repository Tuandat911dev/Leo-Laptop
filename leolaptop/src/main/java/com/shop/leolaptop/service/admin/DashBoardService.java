package com.shop.leolaptop.service.admin;

import com.shop.leolaptop.constant.RoleName;
import com.shop.leolaptop.domain.Role;
import com.shop.leolaptop.repository.OrderRepository;
import com.shop.leolaptop.repository.ProductRepository;
import com.shop.leolaptop.repository.RoleRepository;
import com.shop.leolaptop.repository.UserRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@FieldDefaults(makeFinal = true, level = AccessLevel.PRIVATE)
public class DashBoardService {
    OrderRepository orderRepository;
    ProductRepository productRepository;
    UserRepository userRepository;
    RoleRepository roleRepository;

    public long countOrders() {
        return orderRepository.count();
    }

    public long countProducts() {
        return productRepository.count();
    }

    public long countAdmins() {
        Role adminRole = roleRepository.findRoleByName(RoleName.ADMIN)
                .orElseThrow(() -> new RuntimeException("Role Not Found"));
        return userRepository.countByRole(adminRole);
    }

    public long countClients() {
        Role clientRole = roleRepository.findRoleByName(RoleName.CLIENT)
                .orElseThrow(() -> new RuntimeException("Role Not Found"));
        return userRepository.countByRole(clientRole);
    }
}
