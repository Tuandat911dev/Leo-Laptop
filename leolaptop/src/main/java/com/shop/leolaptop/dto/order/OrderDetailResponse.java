package com.shop.leolaptop.dto.order;

import com.shop.leolaptop.domain.Product;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderDetailResponse {
    Product product;

    long quantity;
}
