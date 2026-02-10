package com.shop.leolaptop.domain;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.Set;

@Entity
@FieldDefaults(level = AccessLevel.PRIVATE)
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
public class Cart {
    @Id
    long id;

    @OneToOne(optional = false, fetch = FetchType.LAZY)
    @MapsId
    User user;

    long sum;

    @OneToMany(mappedBy = "cart")
    Set<CartDetail> cartDetails;
}
