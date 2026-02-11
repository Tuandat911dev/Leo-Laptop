package com.shop.leolaptop.repository;

import com.shop.leolaptop.domain.Cart;
import com.shop.leolaptop.domain.CartDetail;
import com.shop.leolaptop.domain.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {
    Boolean existsByProductAndCart(Product product, Cart cart);
    CartDetail getCartDetailByProductAndCart(Product product, Cart cart);
    List<CartDetail> getCartDetailByCart(Cart cart);
}
