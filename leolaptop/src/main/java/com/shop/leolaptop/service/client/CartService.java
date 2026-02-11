package com.shop.leolaptop.service.client;

import com.shop.leolaptop.domain.Cart;
import com.shop.leolaptop.domain.CartDetail;
import com.shop.leolaptop.domain.Product;
import com.shop.leolaptop.domain.User;
import com.shop.leolaptop.dto.cart.CartResponseDTO;
import com.shop.leolaptop.dto.cart.CartUpdateDTO;
import com.shop.leolaptop.repository.CartDetailRepository;
import com.shop.leolaptop.repository.CartRepository;
import com.shop.leolaptop.repository.ProductRepository;
import com.shop.leolaptop.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@FieldDefaults(makeFinal = true, level = AccessLevel.PRIVATE)
@RequiredArgsConstructor
@Service
public class CartService {
    CartRepository cartRepository;
    CartDetailRepository cartDetailRepository;
    UserRepository userRepository;
    ProductRepository productRepository;

    private Cart getCartByUserId(long userId) {
        User user = userRepository.findById(userId).orElseThrow(() -> new RuntimeException("User Not Found!"));
        if (!cartRepository.existsByUser(user)) {
            Cart newCart = Cart.builder()
                    .sum(1)
                    .user(user)
                    .build();

            return cartRepository.save(newCart);
        } else {
            return cartRepository.getCartByUser(user);
        }
    }

    public void addToCart(long productId, long userId, long quantity) {
        Cart currentCart = this.getCartByUserId(userId);
        Product product = productRepository.findById(productId).orElseThrow(() -> new RuntimeException("Product Not " +
                "Found!"));

        if (cartDetailRepository.existsByProductAndCart(product, currentCart)) {
            CartDetail currentCartDetail = cartDetailRepository.getCartDetailByProductAndCart(product, currentCart);
            currentCartDetail.setQuantity(currentCartDetail.getQuantity() + quantity);
            currentCartDetail.setPrice(currentCartDetail.getPrice() + quantity * product.getPrice());
            cartDetailRepository.save(currentCartDetail);
        } else {
            CartDetail newCartDetail = CartDetail.builder()
                    .cart(currentCart)
                    .product(product)
                    .quantity(quantity)
                    .price(product.getPrice() * quantity)
                    .build();

            cartDetailRepository.save(newCartDetail);
        }
    }

    public List<CartResponseDTO> getCartList(HttpSession session) {
        long userId = (Long) session.getAttribute("userId");
        Cart currentCart = this.getCartByUserId(userId);
        List<CartResponseDTO> cartList = new ArrayList<>();
        List<CartDetail> cartDetailList = cartDetailRepository.getCartDetailByCart(currentCart);

        for (CartDetail item : cartDetailList) {
            CartResponseDTO cartResponseDTO = CartResponseDTO.builder()
                    .productId(item.getProduct().getId())
                    .productImg(item.getProduct().getImage())
                    .productName(item.getProduct().getName())
                    .productPrice(item.getProduct().getPrice())
                    .quantity(item.getQuantity())
                    .totalPrice(item.getPrice())
                    .build();

            cartList.add(cartResponseDTO);
        }

        return cartList;
    }

    public void updateCart(CartUpdateDTO request, HttpSession session) {
        long userId = (Long) session.getAttribute("userId");
        Cart currentCart = this.getCartByUserId(userId);
        Product product = productRepository.findById(request.getProductId()).orElseThrow(() -> new RuntimeException("Product Not " +
                "Found!"));

        CartDetail cartDetail = cartDetailRepository.getCartDetailByProductAndCart(product, currentCart);
        cartDetail.setQuantity(request.getQuantity());
        cartDetail.setPrice(request.getQuantity() * product.getPrice());
        cartDetailRepository.save(cartDetail);
    }
}
