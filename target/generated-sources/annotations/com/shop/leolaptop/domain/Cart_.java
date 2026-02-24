package com.shop.leolaptop.domain;

import jakarta.annotation.Generated;
import jakarta.persistence.metamodel.EntityType;
import jakarta.persistence.metamodel.SetAttribute;
import jakarta.persistence.metamodel.SingularAttribute;
import jakarta.persistence.metamodel.StaticMetamodel;

@StaticMetamodel(Cart.class)
@Generated("org.hibernate.processor.HibernateProcessor")
public abstract class Cart_ {

	public static final String SUM = "sum";
	public static final String CART_DETAILS = "cartDetails";
	public static final String ID = "id";
	public static final String USER = "user";

	
	/**
	 * @see com.shop.leolaptop.domain.Cart#sum
	 **/
	public static volatile SingularAttribute<Cart, Long> sum;
	
	/**
	 * @see com.shop.leolaptop.domain.Cart#cartDetails
	 **/
	public static volatile SetAttribute<Cart, CartDetail> cartDetails;
	
	/**
	 * @see com.shop.leolaptop.domain.Cart#id
	 **/
	public static volatile SingularAttribute<Cart, Long> id;
	
	/**
	 * @see com.shop.leolaptop.domain.Cart
	 **/
	public static volatile EntityType<Cart> class_;
	
	/**
	 * @see com.shop.leolaptop.domain.Cart#user
	 **/
	public static volatile SingularAttribute<Cart, User> user;

}

