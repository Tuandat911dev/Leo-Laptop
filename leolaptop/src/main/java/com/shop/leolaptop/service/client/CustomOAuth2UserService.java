package com.shop.leolaptop.service.client;

import com.shop.leolaptop.constant.AuthProvider;
import com.shop.leolaptop.domain.User;
import com.shop.leolaptop.service.admin.UserService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;

@Service
@FieldDefaults(makeFinal = true, level = AccessLevel.PRIVATE)
@RequiredArgsConstructor
public class CustomOAuth2UserService implements OAuth2UserService<OAuth2UserRequest, OAuth2User> {
    UserService userService;
    DefaultOAuth2UserService delegate = new DefaultOAuth2UserService();

    @Override
    public OAuth2User loadUser(OAuth2UserRequest request) throws OAuth2AuthenticationException {
        OAuth2User oauth2User = delegate.loadUser(request);
        String registrationId = request.getClientRegistration().getRegistrationId();
        Map<String, Object> attributes = oauth2User.getAttributes();

        String userIdentifier = null;
        String fullName = "";
        String avatar = "";
        if ("google".equals(registrationId)) {
            userIdentifier = (String) attributes.get("email");
            fullName = (String) attributes.get("name");
            avatar = (String) attributes.get("picture");
        } else if ("github".equals(registrationId)) {
            userIdentifier = ((Integer) attributes.get("id")).toString();
            fullName = (String) attributes.get("login");
            avatar = (String) attributes.get("avatar_url");
        }

        AuthProvider provider = AuthProvider.valueOf(registrationId.toUpperCase());
        User oauthUser = userService.processOAuthPostLogin(fullName, provider, userIdentifier, avatar);
        Set authorities = new HashSet<>();
        authorities.addAll(oauth2User.getAuthorities());
        authorities.add(new SimpleGrantedAuthority("ROLE_CLIENT"));

        String userNameAttributeName = request.getClientRegistration().getProviderDetails().getUserInfoEndpoint().getUserNameAttributeName();
        if (userNameAttributeName == null) {
            userNameAttributeName = "name";
        }

        return new DefaultOAuth2User(
                authorities,
                attributes,
                userNameAttributeName
        );
    }
}
