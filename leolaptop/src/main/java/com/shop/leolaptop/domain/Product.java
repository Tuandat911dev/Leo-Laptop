package com.shop.leolaptop.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.Size;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;

import java.util.HashSet;
import java.util.Set;

@Data
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@Entity
@Table(name = "products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    long id;
    String name;
    @Size(min = 0)
    double price;
    String image;
    String detailDesc;
    String shortDesc;
    @Size(min = 0)
    long quantity;
    @Size(min = 0)
    long sold;
    String factory;
    String target;

    @OneToMany(mappedBy = "product")
    Set<OrderDetail> orderDetails = new HashSet<>();
}
