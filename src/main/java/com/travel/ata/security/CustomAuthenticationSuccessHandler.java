package com.travel.ata.security;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collection;

public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException, IOException {
        // Get the authorities (roles) of the authenticated user
        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        
        // Check if the user has the "USER_ADMIN" role
        boolean isAdmin = authorities.stream()
                .anyMatch(authority -> authority.getAuthority().equals("ROLE_ADMIN"));
        
        if (isAdmin) {
            response.sendRedirect("/vehicle/all");
        } else {
            throw new IllegalArgumentException("This application is for ADMIN");
            //response.sendRedirect("/passenger/vehicle/all");
        }
    }
}
