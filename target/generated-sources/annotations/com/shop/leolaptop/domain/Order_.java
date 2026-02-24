package com.shop.leolaptop.domain;

import com.shop.leolaptop.constant.OrderStatus;
import com.shop.leolaptop.constant.PaymentMethod;
import com.shop.leolaptop.constant.PaymentStatus;
import jakarta.annotation.Generated;
import jakarta.persistence.metamodel.EntityType;
import jakarta.persistence.metamodel.SingularAttribute;
import jakarta.persistence.metamodel.StaticMetamodel;

@StaticMetamodel(Order.class)
@Generated("org.hibernate.processor.HibernateProcessor")
public abstract class Order_ {

	public static final String RECEIVER_ADDRESS = "receiverAddress";
	public static final String RECEIVER_PHONE = "receiverPhone";
	public static final String TOTAL_PRICE = "totalPrice";
	public static final String RECEIVER_NAME = "receiverName";
	public static final String ORDER_NOTES = "orderNotes";
	public static final String PAYMENT_METHOD = "paymentMethod";
	public static final String ORDER_STATUS = "orderStatus";
	public static final String ID = "id";
	public static final String USER = "user";
	public static final String PAYMENT_STATUS = "paymentStatus";

	
	/**
	 * @see com.shop.leolaptop.domain.Order#receiverAddress
	 **/
	public static volatile SingularAttribute<Order, String> receiverAddress;
	
	/**
	 * @see com.shop.leolaptop.domain.Order#receiverPhone
	 **/
	public static volatile SingularAttribute<Order, String> receiverPhone;
	
	/**
	 * @see com.shop.leolaptop.domain.Order#totalPrice
	 **/
	public static volatile SingularAttribute<Order, Double> totalPrice;
	
	/**
	 * @see com.shop.leolaptop.domain.Order#receiverName
	 **/
	public static volatile SingularAttribute<Order, String> receiverName;
	
	/**
	 * @see com.shop.leolaptop.domain.Order#orderNotes
	 **/
	public static volatile SingularAttribute<Order, String> orderNotes;
	
	/**
	 * @see com.shop.leolaptop.domain.Order#paymentMethod
	 **/
	public static volatile SingularAttribute<Order, PaymentMethod> paymentMethod;
	
	/**
	 * @see com.shop.leolaptop.domain.Order#orderStatus
	 **/
	public static volatile SingularAttribute<Order, OrderStatus> orderStatus;
	
	/**
	 * @see com.shop.leolaptop.domain.Order#id
	 **/
	public static volatile SingularAttribute<Order, Long> id;
	
	/**
	 * @see com.shop.leolaptop.domain.Order
	 **/
	public static volatile EntityType<Order> class_;
	
	/**
	 * @see com.shop.leolaptop.domain.Order#user
	 **/
	public static volatile SingularAttribute<Order, User> user;
	
	/**
	 * @see com.shop.leolaptop.domain.Order#paymentStatus
	 **/
	public static volatile SingularAttribute<Order, PaymentStatus> paymentStatus;

}

