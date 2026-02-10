package com.shop.leolaptop.service.client;

import com.shop.leolaptop.domain.Cart;
import com.shop.leolaptop.domain.CartDetail;
import com.shop.leolaptop.domain.Product;
import com.shop.leolaptop.domain.User;
import com.shop.leolaptop.repository.CartDetailRepository;
import com.shop.leolaptop.repository.CartRepository;
import com.shop.leolaptop.repository.ProductRepository;
import com.shop.leolaptop.repository.UserRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

@FieldDefaults(makeFinal = true, level = AccessLevel.PRIVATE)
@RequiredArgsConstructor
@Service
public class CartService {
    CartRepository cartRepository;
    CartDetailRepository cartDetailRepository;
    UserRepository userRepository;
    ProductRepository productRepository;

    private Cart getCartByUser(long userId) {
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
        Cart currentCart = this.getCartByUser(userId);
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
}
