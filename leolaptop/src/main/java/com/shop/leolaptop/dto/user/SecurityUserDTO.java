package com.shop.leolaptop.dto.user;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class SecurityUserDTO {
    long id;
    String email;
    String password;
    String fullName;
    String avatar;
    String roleName;
}
