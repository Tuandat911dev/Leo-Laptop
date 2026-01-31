package com.shop.leolaptop.dto.user;

import com.shop.leolaptop.constant.ErrorMessage;
import jakarta.validation.constraints.Pattern;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class UpdateUserDTO {
    long id;
    String email;
    String fullName;
    String address;
    @Pattern(regexp = "^(84|0[35789])[0-9]{8}$",
            message = ErrorMessage.PHONE_INVALID)
    String phone;
    String avatar;
    String roleName;
    long roleId;
}
