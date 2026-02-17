package com.shop.leolaptop.service.admin;

import com.shop.leolaptop.domain.Order;
import com.shop.leolaptop.domain.OrderDetail;
import com.shop.leolaptop.dto.order.OrderDetailResponse;
import com.shop.leolaptop.dto.order.OrderResponse;
import com.shop.leolaptop.repository.OrderDetailRepository;
import com.shop.leolaptop.repository.OrderRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class OrderService {
    OrderRepository orderRepository;
    OrderDetailRepository orderDetailRepository;

    private OrderResponse getOrderResponse(Order currentOrder) {
        List<OrderDetailResponse> orderDetailResponses = new ArrayList<>();
        List<OrderDetail> orderDetails = orderDetailRepository.findAllByOrder(currentOrder);
        for (OrderDetail orderDetail : orderDetails) {
            OrderDetailResponse o = OrderDetailResponse.builder()
                    .product(orderDetail.getProduct())
                    .quantity(orderDetail.getQuantity())
                    .build();

            orderDetailResponses.add(o);
        }

        return OrderResponse.builder()
                .id(currentOrder.getId())
                .totalPrice(currentOrder.getTotalPrice())
                .paymentMethod(String.valueOf(currentOrder.getPaymentMethod()))
                .paymentStatus(String.valueOf(currentOrder.getPaymentStatus()))
                .orderStatus(String.valueOf(currentOrder.getOrderStatus()))
                .receiverName(currentOrder.getReceiverName())
                .receiverPhone(currentOrder.getReceiverPhone())
                .orderNotes(currentOrder.getOrderNotes())
                .orderDetails(orderDetailResponses)
                .build();
    }

    public List<OrderResponse> getOrderList() {
        List<OrderResponse> orderList = new ArrayList<>();
        List<Order> orders = orderRepository.findAll();

        for (Order item : orders) {
            orderList.add(getOrderResponse(item));
        }

        return orderList;
    }

    public OrderResponse getOrderById(long orderId) {
        Order currentOrder = orderRepository.findById(orderId)
                .orElseThrow(() -> new RuntimeException("Order Not Found"));

        return getOrderResponse(currentOrder);
    }
}
