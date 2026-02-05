package com.shop.leolaptop.service.common;

import com.shop.leolaptop.dto.user.SecurityUserDTO;
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
        SecurityUserDTO userDb = userService.getUserToAuthenticate(username);

        return new org.springframework.security.core.userdetails.User(
                userDb.getEmail(),
                userDb.getPassword(),
                Collections.singletonList(new SimpleGrantedAuthority("ROLE_" + userDb.getRoleName()))
        );
    }
}
