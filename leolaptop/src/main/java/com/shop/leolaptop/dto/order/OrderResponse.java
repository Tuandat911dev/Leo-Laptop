package com.shop.leolaptop.dto.order;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderResponse {
    long id;
    double totalPrice;
    String paymentMethod;
    String paymentStatus;
    String orderStatus;
    String receiverName;
    String receiverAddress;
    String receiverPhone;
    String orderNotes;
    List<OrderDetailResponse> orderDetails;
}
