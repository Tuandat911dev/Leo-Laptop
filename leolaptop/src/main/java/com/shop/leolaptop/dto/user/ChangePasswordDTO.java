package com.shop.leolaptop.dto.user;

import com.shop.leolaptop.constant.ErrorMessage;
import com.shop.leolaptop.validator.FieldsValueMatch;
import jakarta.validation.constraints.NotEmpty;
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
public class ChangePasswordDTO {
    @NotEmpty(message = ErrorMessage.FIELD_EMPTY)
    String oldPassword;
    @NotEmpty(message = ErrorMessage.FIELD_EMPTY)
    String password;
    @NotEmpty(message = ErrorMessage.FIELD_EMPTY)
    String rePassword;
}
