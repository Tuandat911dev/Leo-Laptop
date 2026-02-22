package com.shop.leolaptop.dto.order;

import com.shop.leolaptop.constant.ErrorMessage;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ClientOrderUpdate {
    long id;
    @NotBlank(message = ErrorMessage.CHECKOUT_RECEIVER_NAME_NOT_BLANK)
    String receiverName;
    @NotBlank(message = ErrorMessage.CHECKOUT_RECEIVER_ADDRESS_NOT_BLANK)
    String receiverAddress;
    @Pattern(regexp = "^(84|0[35789])[0-9]{8}$",
            message = ErrorMessage.PHONE_INVALID)
    String receiverPhone;
    String orderNotes;
}
