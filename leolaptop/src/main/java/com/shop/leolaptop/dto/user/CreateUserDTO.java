package com.shop.leolaptop.dto.user;

import com.shop.leolaptop.constant.ErrorMessage;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class CreateUserDTO {
    @Email(message = ErrorMessage.EMAIL_INVALID,
            regexp = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$")
    String email;
    String fullName;
    String address;
    @Pattern(regexp = "^(84|0[35789])[0-9]{8}$",
            message = ErrorMessage.PHONE_INVALID)
    String phone;
    @Size(min = 8, message = ErrorMessage.PASSWORD_INVALID)
    String password;
    long roleId;
}
