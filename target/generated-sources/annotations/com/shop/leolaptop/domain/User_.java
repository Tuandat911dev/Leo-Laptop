package com.shop.leolaptop.domain;

import com.shop.leolaptop.constant.AuthProvider;
import jakarta.annotation.Generated;
import jakarta.persistence.metamodel.EntityType;
import jakarta.persistence.metamodel.SetAttribute;
import jakarta.persistence.metamodel.SingularAttribute;
import jakarta.persistence.metamodel.StaticMetamodel;

@StaticMetamodel(User.class)
@Generated("org.hibernate.processor.HibernateProcessor")
public abstract class User_ {

	public static final String PASSWORD = "password";
	public static final String ADDRESS = "address";
	public static final String ROLE = "role";
	public static final String PHONE = "phone";
	public static final String PROVIDER = "provider";
	public static final String PROVIDER_ID = "providerId";
	public static final String FULL_NAME = "fullName";
	public static final String ORDERS = "orders";
	public static final String ID = "id";
	public static final String AVATAR = "avatar";
	public static final String EMAIL = "email";

	
	/**
	 * @see com.shop.leolaptop.domain.User#password
	 **/
	public static volatile SingularAttribute<User, String> password;
	
	/**
	 * @see com.shop.leolaptop.domain.User#address
	 **/
	public static volatile SingularAttribute<User, String> address;
	
	/**
	 * @see com.shop.leolaptop.domain.User#role
	 **/
	public static volatile SingularAttribute<User, Role> role;
	
	/**
	 * @see com.shop.leolaptop.domain.User#phone
	 **/
	public static volatile SingularAttribute<User, String> phone;
	
	/**
	 * @see com.shop.leolaptop.domain.User#provider
	 **/
	public static volatile SingularAttribute<User, AuthProvider> provider;
	
	/**
	 * @see com.shop.leolaptop.domain.User#providerId
	 **/
	public static volatile SingularAttribute<User, String> providerId;
	
	/**
	 * @see com.shop.leolaptop.domain.User#fullName
	 **/
	public static volatile SingularAttribute<User, String> fullName;
	
	/**
	 * @see com.shop.leolaptop.domain.User#orders
	 **/
	public static volatile SetAttribute<User, Order> orders;
	
	/**
	 * @see com.shop.leolaptop.domain.User#id
	 **/
	public static volatile SingularAttribute<User, Long> id;
	
	/**
	 * @see com.shop.leolaptop.domain.User#avatar
	 **/
	public static volatile SingularAttribute<User, String> avatar;
	
	/**
	 * @see com.shop.leolaptop.domain.User
	 **/
	public static volatile EntityType<User> class_;
	
	/**
	 * @see com.shop.leolaptop.domain.User#email
	 **/
	public static volatile SingularAttribute<User, String> email;

}

