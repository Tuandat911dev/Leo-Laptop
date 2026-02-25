package com.shop.leolaptop.dto.product;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.Optional;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ProductCriteriaDTO {
    Optional<String> page;
    Optional<String> name;
    Optional<String> minPrice;
    Optional<String> maxPrice;
    Optional<String> factory;
    Optional<String> price;
}
