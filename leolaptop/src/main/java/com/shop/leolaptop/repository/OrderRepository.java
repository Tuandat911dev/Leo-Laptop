package com.shop.leolaptop.repository;

import com.shop.leolaptop.domain.Order;
import com.shop.leolaptop.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    List<Order> findAllByUser(User user);
}
