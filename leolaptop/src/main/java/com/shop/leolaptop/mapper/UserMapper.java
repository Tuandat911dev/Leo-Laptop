package com.shop.leolaptop.mapper;

import com.shop.leolaptop.domain.User;
import com.shop.leolaptop.dto.UserDTO;
import org.springframework.stereotype.Component;

@Component
public class UserMapper {
    public static UserDTO toUserDTO(User user) {
        return UserDTO.builder()
                .email(user.getEmail())
                .roleId(user.getRole().getId())
                .roleName(user.getRole().getName())
                .phone(user.getPhone())
                .address(user.getAddress())
                .fullName(user.getFullName())
                .avatar(user.getAvatar())
                .id(user.getId())
                .build();
    }
}
