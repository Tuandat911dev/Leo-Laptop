package com.shop.leolaptop.dto.checkout;

import com.shop.leolaptop.constant.ErrorMessage;
import com.shop.leolaptop.constant.PaymentMethod;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.*;
import lombok.experimental.FieldDefaults;

@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CheckoutDTO {
    @NotBlank(message = ErrorMessage.CHECKOUT_RECEIVER_NAME_NOT_BLANK)
    String receiverName;

    @NotBlank(message = ErrorMessage.CHECKOUT_RECEIVER_ADDRESS_NOT_BLANK)
    String receiverAddress;

    @NotBlank(message = ErrorMessage.CHECKOUT_RECEIVER_PHONE_NOT_BLANK)
    @Pattern(regexp = "^(84|0[35789])[0-9]{8}$",
            message = ErrorMessage.PHONE_INVALID)
    String receiverPhone;

    String orderNotes;

    @NotBlank(message = ErrorMessage.CHECKOUT_PAYMENT_METHOD_NOT_BLANK)
    String paymentMethod;
}
