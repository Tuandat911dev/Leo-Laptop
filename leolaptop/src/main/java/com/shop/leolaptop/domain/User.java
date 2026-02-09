package com.shop.leolaptop.domain;

import com.shop.leolaptop.constant.AuthProvider;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@Entity
@Table(name = "users")
@Builder
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    long id;
    @Column(unique = true)
    String email;
    String password;
    String fullName;
    String address;
    @Column(unique = true, length = 11)
    String phone;
    String avatar;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "role_id")
    Role role;

    @Builder.Default
    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    Set<Order> orders = new HashSet<>();

    @Enumerated(EnumType.STRING)
    @Builder.Default
    AuthProvider provider = AuthProvider.LOCAL;

    String providerId;
}
