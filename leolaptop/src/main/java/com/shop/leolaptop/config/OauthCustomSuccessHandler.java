package com.shop.leolaptop.config;

import com.shop.leolaptop.constant.AuthProvider;
import com.shop.leolaptop.constant.RoleName;
import com.shop.leolaptop.domain.User;
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
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
@FieldDefaults(makeFinal = true, level = AccessLevel.PRIVATE)
@RequiredArgsConstructor
public class OauthCustomSuccessHandler implements AuthenticationSuccessHandler {
    UserService userService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        clearAuthenticationAttributes(request, authentication);
        response.sendRedirect("/");
    }

    private String getTrimmed(OAuth2User user, String key) {
        Object value = user.getAttribute(key);
        return value == null ? null : value.toString().trim();
    }

    private User findCurrentUser(String registrationId, String providerId) {
        AuthProvider provider = AuthProvider.valueOf(registrationId.toUpperCase());

        return userService.getUserByProviderAndProviderId(provider, providerId);
    }

    protected void clearAuthenticationAttributes(HttpServletRequest request, Authentication authentication) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return;
        }

        if (authentication instanceof OAuth2AuthenticationToken) {
            String registrationId = ((OAuth2AuthenticationToken) authentication).getAuthorizedClientRegistrationId();
            OAuth2User user = (OAuth2User) authentication.getPrincipal();
            if ("github".equals(registrationId)) {
                User currentUser = findCurrentUser("github", getTrimmed(user, "id"));
                session.setAttribute("fullName", getTrimmed(user, "login"));
                session.setAttribute("avatar", getTrimmed(user, "avatar_url"));
                session.setAttribute("userId", currentUser.getId());
                session.setAttribute("roleName", RoleName.CLIENT);
            } else if ("google".equals(registrationId)) {
                User currentUser = findCurrentUser("google", getTrimmed(user, "email"));
                session.setAttribute("fullName", getTrimmed(user, "name"));
                session.setAttribute("avatar", getTrimmed(user, "picture"));
                session.setAttribute("userId", currentUser.getId());
                session.setAttribute("roleName", RoleName.CLIENT);
            }
        }

        session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
    }
}
