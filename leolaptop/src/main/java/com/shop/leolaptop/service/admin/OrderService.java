package com.shop.leolaptop.service.admin;

import com.shop.leolaptop.constant.ErrorMessage;
import com.shop.leolaptop.constant.OrderStatus;
import com.shop.leolaptop.constant.PaymentStatus;
import com.shop.leolaptop.domain.Order;
import com.shop.leolaptop.domain.OrderDetail;
import com.shop.leolaptop.domain.User;
import com.shop.leolaptop.dto.order.ClientOrderUpdate;
import com.shop.leolaptop.dto.order.OrderDetailResponse;
import com.shop.leolaptop.dto.order.OrderResponse;
import com.shop.leolaptop.repository.OrderDetailRepository;
import com.shop.leolaptop.repository.OrderRepository;
import com.shop.leolaptop.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.nio.file.AccessDeniedException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class OrderService {
    OrderRepository orderRepository;
    OrderDetailRepository orderDetailRepository;
    UserRepository userRepository;

    public OrderResponse getOrderResponse(Order currentOrder) {
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

    public Page<Order> getOrderWithPagination(int page) {
        PageRequest pageRequest = PageRequest.of(page, 5);

        return orderRepository.findAll(pageRequest);
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

    public void clientUpdateOrderInfo(long orderId,
                                      HttpSession session,
                                      ClientOrderUpdate request) throws AccessDeniedException {
        long userId = (Long) session.getAttribute("userId");
        Order currentOrder = orderRepository.findById(orderId)
                .orElseThrow(() -> new RuntimeException("Order Not Found"));
        User currentUser = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User Not Found"));

        if (Objects.equals(currentUser, currentOrder.getUser())) {
            currentOrder.setReceiverName(request.getReceiverName());
            currentOrder.setReceiverAddress(request.getReceiverAddress());
            currentOrder.setReceiverPhone(request.getReceiverPhone());
            currentOrder.setOrderNotes(request.getOrderNotes());

            orderRepository.save(currentOrder);
        } else {
            throw new AccessDeniedException(ErrorMessage.ORDER_ACCESS_DENIED);
        }
    }
}
