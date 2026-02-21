package com.shop.leolaptop.service.admin;

import com.shop.leolaptop.constant.OrderStatus;
import com.shop.leolaptop.constant.PaymentStatus;
import com.shop.leolaptop.domain.Order;
import com.shop.leolaptop.domain.OrderDetail;
import com.shop.leolaptop.domain.User;
import com.shop.leolaptop.dto.order.OrderDetailResponse;
import com.shop.leolaptop.dto.order.OrderResponse;
import com.shop.leolaptop.repository.OrderDetailRepository;
import com.shop.leolaptop.repository.OrderRepository;
import com.shop.leolaptop.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
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
    UserRepository userRepository;

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
                .receiverAddress(currentOrder.getReceiverAddress())
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

    public List<OrderResponse> getOrderByUser(HttpSession session) {
        long userId = (Long) session.getAttribute("userId");
        List<OrderResponse> orderList = new ArrayList<>();
        User currentUser = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User Not Found"));

        List<Order> orders = orderRepository.findAllByUser(currentUser);
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

    public void updateOrder(long orderId, String status, String paymentStatus) {
        Order currentOrder = orderRepository.findById(orderId)
                .orElseThrow(() -> new RuntimeException("Order Not Found"));

        currentOrder.setOrderStatus(OrderStatus.valueOf(status));
        currentOrder.setPaymentStatus(PaymentStatus.valueOf(paymentStatus));
        orderRepository.save(currentOrder);
    }
}
