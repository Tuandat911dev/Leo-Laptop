package com.shop.leolaptop.domain.custom_id;

import jakarta.annotation.Generated;
import jakarta.persistence.metamodel.EmbeddableType;
import jakarta.persistence.metamodel.SingularAttribute;
import jakarta.persistence.metamodel.StaticMetamodel;

@StaticMetamodel(OrderDetailId.class)
@Generated("org.hibernate.processor.HibernateProcessor")
public abstract class OrderDetailId_ {

	public static final String PRODUCT_ID = "productId";
	public static final String ORDER_ID = "orderId";

	
	/**
	 * @see com.shop.leolaptop.domain.custom_id.OrderDetailId#productId
	 **/
	public static volatile SingularAttribute<OrderDetailId, Long> productId;
	
	/**
	 * @see com.shop.leolaptop.domain.custom_id.OrderDetailId#orderId
	 **/
	public static volatile SingularAttribute<OrderDetailId, Long> orderId;
	
	/**
	 * @see com.shop.leolaptop.domain.custom_id.OrderDetailId
	 **/
	public static volatile EmbeddableType<OrderDetailId> class_;

}

