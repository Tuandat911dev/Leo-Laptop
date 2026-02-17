package com.shop.leolaptop.domain;

import com.shop.leolaptop.constant.OrderStatus;
import com.shop.leolaptop.constant.PaymentMethod;
import com.shop.leolaptop.constant.PaymentStatus;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Data
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@Entity
@Table(name = "orders")
@Builder
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    long id;
    double totalPrice;

    @ManyToOne
    @JoinColumn(name = "user_id")
    User user;

    @Enumerated(EnumType.STRING)
    @Builder.Default
    PaymentMethod paymentMethod = PaymentMethod.COD;

    @Enumerated(EnumType.STRING)
    @Builder.Default
    PaymentStatus paymentStatus = PaymentStatus.UN_PAID;

    @Enumerated(EnumType.STRING)
    @Builder.Default
    OrderStatus orderStatus = OrderStatus.PENDING;

    String receiverName;
    String receiverAddress;
    String receiverPhone;
    String orderNotes;
}

