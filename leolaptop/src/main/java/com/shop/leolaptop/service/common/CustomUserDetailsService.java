package com.shop.leolaptop.service.common;

import com.shop.leolaptop.domain.User;
import com.shop.leolaptop.service.admin.UserService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Collections;

@Service
@RequiredArgsConstructor
@FieldDefaults(makeFinal = true, level = AccessLevel.PRIVATE)
public class CustomUserDetailsService implements UserDetailsService {
    UserService userService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User userDb = userService.getUserByEmail(username).orElseThrow(() -> new RuntimeException("User Not Found!"));

        return new org.springframework.security.core.userdetails.User(
                userDb.getEmail(),
                userDb.getPassword(),
                Collections.singletonList(new SimpleGrantedAuthority("ROLE_USER"))
        );
    }
}
