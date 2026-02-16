package com.shop.leolaptop.service.client;

import com.shop.leolaptop.constant.PaymentMethod;
import com.shop.leolaptop.constant.PaymentStatus;
import com.shop.leolaptop.domain.*;
import com.shop.leolaptop.domain.custom_id.OrderDetailId;
import com.shop.leolaptop.dto.checkout.CheckoutDTO;
import com.shop.leolaptop.repository.CartDetailRepository;
import com.shop.leolaptop.repository.OrderDetailRepository;
import com.shop.leolaptop.repository.OrderRepository;
import com.shop.leolaptop.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequiredArgsConstructor
public class CheckoutService {
    CartService cartService;
    OrderRepository orderRepository;
    CartDetailRepository cartDetailRepository;
    UserRepository userRepository;
    OrderDetailRepository orderDetailRepository;
    VNPayService vnPayService;

    double SHIPPING_FEE = 30000;

    public Order creatNewOrder(CheckoutDTO checkoutDTO, HttpSession session) {
        long userId = (Long) session.getAttribute("userId");
        User currentUser = userRepository.findById(userId).orElseThrow(() -> new RuntimeException("User Not Found!"));
        PaymentMethod paymentMethod = PaymentMethod.valueOf(checkoutDTO.getPaymentMethod());

        Cart currentCart = cartService.getCartByUserId(userId);
        List<CartDetail> cartDetailList = cartDetailRepository.getCartDetailByCart(currentCart);

        Order order = Order.builder().receiverName(checkoutDTO.getReceiverName()).receiverAddress(checkoutDTO.getReceiverAddress()).receiverPhone(checkoutDTO.getReceiverPhone()).orderNotes(checkoutDTO.getOrderNotes()).paymentMethod(paymentMethod).user(currentUser).build();

        Order newOrder = orderRepository.save(order);

        double totalBill = SHIPPING_FEE;
        for (CartDetail item : cartDetailList) {
            totalBill += item.getPrice();
            OrderDetailId orderDetailId = new OrderDetailId(newOrder.getId(), item.getProduct().getId());
            OrderDetail orderDetail = OrderDetail.builder().id(orderDetailId).order(newOrder).product(item.getProduct()).quantity(item.getQuantity()).build();

            orderDetailRepository.save(orderDetail);
        }

        newOrder.setTotalPrice(totalBill);
        orderRepository.save(newOrder);
        cartService.deleteAllCart(currentCart);

        return newOrder;
    }

    public void updatePaymentOrder(long orderId, int paymentStatus) {
        Order currentOrder = orderRepository.findById(orderId).orElseThrow(() -> new RuntimeException("Order Not Found!"));
        if (paymentStatus == 1) {
            currentOrder.setPaymentStatus(PaymentStatus.PAID);

        } else {
            currentOrder.setPaymentMethod(PaymentMethod.COD);
        }

        orderRepository.save(currentOrder);
    }
}
