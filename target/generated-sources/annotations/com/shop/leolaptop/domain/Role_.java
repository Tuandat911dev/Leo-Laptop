package com.shop.leolaptop.domain;

import jakarta.annotation.Generated;
import jakarta.persistence.metamodel.EntityType;
import jakarta.persistence.metamodel.SetAttribute;
import jakarta.persistence.metamodel.SingularAttribute;
import jakarta.persistence.metamodel.StaticMetamodel;

@StaticMetamodel(Role.class)
@Generated("org.hibernate.processor.HibernateProcessor")
public abstract class Role_ {

	public static final String NAME = "name";
	public static final String DESCRIPTION = "description";
	public static final String ID = "id";
	public static final String USERS = "users";

	
	/**
	 * @see com.shop.leolaptop.domain.Role#name
	 **/
	public static volatile SingularAttribute<Role, String> name;
	
	/**
	 * @see com.shop.leolaptop.domain.Role#description
	 **/
	public static volatile SingularAttribute<Role, String> description;
	
	/**
	 * @see com.shop.leolaptop.domain.Role#id
	 **/
	public static volatile SingularAttribute<Role, Long> id;
	
	/**
	 * @see com.shop.leolaptop.domain.Role
	 **/
	public static volatile EntityType<Role> class_;
	
	/**
	 * @see com.shop.leolaptop.domain.Role#users
	 **/
	public static volatile SetAttribute<Role, User> users;

}

