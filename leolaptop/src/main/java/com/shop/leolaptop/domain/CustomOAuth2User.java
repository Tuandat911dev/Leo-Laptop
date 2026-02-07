package com.shop.leolaptop.domain;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.oauth2.core.oidc.OidcIdToken;
import org.springframework.security.oauth2.core.oidc.OidcUserInfo;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.security.oauth2.core.user.OAuth2User;

import java.io.Serializable;
import java.util.Collection;
import java.util.Map;

public class CustomOAuth2User implements OidcUser, Serializable {

    private final OAuth2User oauth2User;

    public CustomOAuth2User(OAuth2User oauth2User) {
        this.oauth2User = oauth2User;
    }

    @Override
    public Map<String, Object> getAttributes() {
        return oauth2User.getAttributes();
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return oauth2User.getAuthorities();
    }

    @Override
    public String getName() {
        return oauth2User.getAttribute("name");
    }

    public String getEmail() {
        return oauth2User.getAttribute("email");
    }

    public String getPicture() {
        return oauth2User.getAttribute("picture");
    }

    @Override
    public Map<String, Object> getClaims() {
        return (oauth2User instanceof OidcUser) ? ((OidcUser) oauth2User).getClaims() : null;
    }

    @Override
    public OidcUserInfo getUserInfo() {
        return (oauth2User instanceof OidcUser) ? ((OidcUser) oauth2User).getUserInfo() : null;
    }

    @Override
    public OidcIdToken getIdToken() {
        return (oauth2User instanceof OidcUser) ? ((OidcUser) oauth2User).getIdToken() : null;
    }
}