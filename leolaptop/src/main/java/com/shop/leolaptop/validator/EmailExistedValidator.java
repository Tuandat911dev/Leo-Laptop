package com.shop.leolaptop.validator;

import com.shop.leolaptop.service.admin.UserService;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;

@RequiredArgsConstructor
@FieldDefaults(makeFinal = true, level = AccessLevel.PRIVATE)
public class EmailExistedValidator implements ConstraintValidator<EmailExistedConstraint, String> {
    UserService userService;

    @Override
    public void initialize(EmailExistedConstraint constraintAnnotation) {
        ConstraintValidator.super.initialize(constraintAnnotation);
    }

    @Override
    public boolean isValid(String email, ConstraintValidatorContext cxt) {
        if (email == null) return true;

        return userService.getUserByEmail(email).isEmpty();
    }
}
