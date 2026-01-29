package com.shop.leolaptop.dto;

import com.shop.leolaptop.domain.Role;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.HashMap;
import java.util.Map;


@Getter
@Setter
@Builder
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class UserDTO {
    long id;
    String email;
    String fullName;
    String address;
    String phone;
    String avatar;
    String roleName;
    long roleId;
}
