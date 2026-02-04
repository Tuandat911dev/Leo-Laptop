package com.shop.leolaptop.dto.user;

import com.shop.leolaptop.constant.ErrorMessage;
import com.shop.leolaptop.validator.EmailExistedConstraint;
import com.shop.leolaptop.validator.FieldsValueMatch;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
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
@FieldsValueMatch.List({
        @FieldsValueMatch(
                field = "password",
                fieldMatch = "rePassword",
                message = ErrorMessage.RE_PASSWORD_NOT_MATCH
        )
})
public class RegisterDTO {
    @Email(message = ErrorMessage.EMAIL_INVALID,
            regexp = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$")
    @EmailExistedConstraint(message = ErrorMessage.EMAIL_EXISTED)
    @NotEmpty(message = ErrorMessage.FIELD_EMPTY)
    String email;
    @NotEmpty(message = ErrorMessage.FIELD_EMPTY)
    String fullName;
    @NotEmpty(message = ErrorMessage.FIELD_EMPTY)
    String address;
    @Pattern(regexp = "^(84|0[35789])[0-9]{8}$",
            message = ErrorMessage.PHONE_INVALID)
    @NotEmpty(message = ErrorMessage.FIELD_EMPTY)
    String phone;
    @Size(min = 8, message = ErrorMessage.PASSWORD_INVALID)
    @NotEmpty(message = ErrorMessage.FIELD_EMPTY)
    String password;
    @NotEmpty(message = ErrorMessage.FIELD_EMPTY)
    String rePassword;
}
