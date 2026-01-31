package com.shop.leolaptop.dto.product;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ResponseProductDTO {
    long id;
    String name;
    double price;
    String image;
    String detailDesc;
    String shortDesc;
    long quantity;
    long sold;
    String factory;
    String target;
}
