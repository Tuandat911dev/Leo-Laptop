package com.shop.leolaptop.domain;

import com.shop.leolaptop.domain.custom_id.OrderDetailId;
import jakarta.annotation.Generated;
import jakarta.persistence.metamodel.EntityType;
import jakarta.persistence.metamodel.SingularAttribute;
import jakarta.persistence.metamodel.StaticMetamodel;

@StaticMetamodel(OrderDetail.class)
@Generated("org.hibernate.processor.HibernateProcessor")
public abstract class OrderDetail_ {

	public static final String PRODUCT = "product";
	public static final String QUANTITY = "quantity";
	public static final String ID = "id";
	public static final String ORDER = "order";

	
	/**
	 * @see com.shop.leolaptop.domain.OrderDetail#product
	 **/
	public static volatile SingularAttribute<OrderDetail, Product> product;
	
	/**
	 * @see com.shop.leolaptop.domain.OrderDetail#quantity
	 **/
	public static volatile SingularAttribute<OrderDetail, Long> quantity;
	
	/**
	 * @see com.shop.leolaptop.domain.OrderDetail#id
	 **/
	public static volatile SingularAttribute<OrderDetail, OrderDetailId> id;
	
	/**
	 * @see com.shop.leolaptop.domain.OrderDetail
	 **/
	public static volatile EntityType<OrderDetail> class_;
	
	/**
	 * @see com.shop.leolaptop.domain.OrderDetail#order
	 **/
	public static volatile SingularAttribute<OrderDetail, Order> order;

}

