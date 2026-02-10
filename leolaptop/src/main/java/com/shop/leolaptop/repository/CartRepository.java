package com.shop.leolaptop.repository;

import com.shop.leolaptop.domain.Cart;
import com.shop.leolaptop.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long> {
    Boolean existsByUser(User user);

    Cart getCartByUser(User user);
}
