package com.shop.leolaptop.validator;

import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.*;

@Documented
@Constraint(validatedBy = EmailExistedValidator.class)
@Target( { ElementType.METHOD, ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
public @interface EmailExistedConstraint {
    String message() default "Email existed!";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}
