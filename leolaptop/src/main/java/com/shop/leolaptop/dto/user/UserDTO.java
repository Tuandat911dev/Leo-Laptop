package com.shop.leolaptop.dto.user;

import lombok.*;
import lombok.experimental.FieldDefaults;


@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
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
