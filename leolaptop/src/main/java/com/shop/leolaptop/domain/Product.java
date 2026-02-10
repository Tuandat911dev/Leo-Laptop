package com.shop.leolaptop.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.PositiveOrZero;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Data
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@Entity
@Table(name = "products")
@Builder
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    long id;
    String name;
    @PositiveOrZero
    double price;
    String image;
    String detailDesc;
    String shortDesc;
    @PositiveOrZero
    long quantity;
    @PositiveOrZero
    long sold;
    String factory;
    String target;
}
