package com.shop.leolaptop.domain.specification;

import com.shop.leolaptop.constant.QueryOperator;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@Builder
public class Filter {
    String field;
    QueryOperator operator;
    String value;
    List<String> values;
}
