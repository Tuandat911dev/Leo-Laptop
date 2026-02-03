package com.shop.leolaptop.dto.product;

import com.shop.leolaptop.constant.ErrorMessage;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class RequestProductDTO {
    @NotEmpty(message = ErrorMessage.NAME_NOT_EMPTY)
    String name;
    @Min(0)
    double price;
    @NotEmpty(message = ErrorMessage.DESC_NOT_EMPTY)
    String detailDesc;
    @NotEmpty(message = ErrorMessage.DESC_NOT_EMPTY)
    String shortDesc;
    @Min(0)
    long quantity;
    @Min(0)
    long sold;
    @NotEmpty(message = ErrorMessage.FACTORY_NOT_EMPTY)
    String factory;
    @NotEmpty(message = ErrorMessage.TARGET_NOT_EMPTY)
    String target;
}
