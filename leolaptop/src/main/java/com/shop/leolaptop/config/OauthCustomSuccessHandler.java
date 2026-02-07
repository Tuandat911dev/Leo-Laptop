package com.shop.leolaptop.config;

import com.shop.leolaptop.constant.AuthProvider;
import com.shop.leolaptop.constant.RoleName;
import com.shop.leolaptop.domain.CustomOAuth2User;
import com.shop.leolaptop.service.admin.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;

@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequiredArgsConstructor
@Component
public class OauthCustomSuccessHandler implements AuthenticationSuccessHandler {
    UserService userService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        Object principal = authentication.getPrincipal();

        if (principal instanceof CustomOAuth2User oauthUser) {
            String email = oauthUser.getEmail();
            String name = oauthUser.getName();
            String avatar = oauthUser.getPicture();

            OAuth2AuthenticationToken authToken = (OAuth2AuthenticationToken) authentication;

            AuthProvider provider = AuthProvider.valueOf(
                    authToken.getAuthorizedClientRegistrationId().toUpperCase()
            );

            userService.processOAuthPostLogin(email, name, provider, avatar);

            clearAuthenticationAttributes(request, authentication, name, avatar);
        }

        response.sendRedirect("/");
    }

    protected void clearAuthenticationAttributes(HttpServletRequest request, Authentication authentication,
                                                 String name, String avatar) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return;
        }
        session.setAttribute("fullName", name);
        session.setAttribute("avatar", avatar);
        session.setAttribute("roleName", RoleName.CLIENT);

        session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
    }
}
