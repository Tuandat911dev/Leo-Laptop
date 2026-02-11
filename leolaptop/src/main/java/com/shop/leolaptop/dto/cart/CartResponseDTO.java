package com.shop.leolaptop.dto.cart;

import lombok.*;
import lombok.experimental.FieldDefaults;

@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CartResponseDTO {
    long productId;
    String productName;
    String productImg;
    double productPrice;
    long quantity;
    double totalPrice;
}
