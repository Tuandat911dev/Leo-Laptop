package com.shop.leolaptop.service.admin;

import com.shop.leolaptop.domain.Role;
import com.shop.leolaptop.repository.RoleRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(makeFinal = true, level = AccessLevel.PRIVATE)
public class RoleService {
    RoleRepository roleRepository;

    public List<Role> getAllRole() {
        return roleRepository.findAll();
    }
}
