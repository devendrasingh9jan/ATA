package com.travel.ata.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Lazy;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    UserDetailsService userDetailsService;

    @Autowired
    public SecurityConfig(@Lazy UserDetailsService userDetailsService) {
        this.userDetailsService = userDetailsService;
    }

    @Bean
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }


    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
    }
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public AuthenticationSuccessHandler customAuthenticationSuccessHandler() {
        return new CustomAuthenticationSuccessHandler();
    }


    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http.cors().configure(http);
        http.csrf().disable();
        http
                .authorizeRequests()
                .antMatchers("/","/public/**", "/resources/**","/resources/public/**").permitAll()
                .antMatchers("/registration").permitAll()
                .antMatchers("/register").permitAll()
                .antMatchers("/forgetPassword/**").permitAll()
                .antMatchers("/changePassword/**").permitAll()
                .antMatchers("/changed").permitAll()
                .antMatchers(HttpMethod.POST,"/vehicle/create").hasAuthority("ROLE_ADMIN")
                .antMatchers(HttpMethod.GET,"/vehicle/create").hasAuthority("ROLE_ADMIN")
                .antMatchers(HttpMethod.POST,"/vehicle/save").hasAuthority("ROLE_ADMIN")
                .antMatchers(HttpMethod.GET,"/vehicle/all").hasAuthority("ROLE_ADMIN")
                .antMatchers(HttpMethod.DELETE,"/vehicle/delete").hasAuthority("ROLE_ADMIN")
                .antMatchers(HttpMethod.GET,"/passenger/vehicle/all").hasAuthority("ROLE_USER")
                .antMatchers(HttpMethod.GET,"/passenger/book/vehicle").hasAuthority("ROLE_USER")
                .antMatchers(HttpMethod.POST,"/payment/pay").hasAuthority("ROLE_USER")
                .antMatchers(HttpMethod.GET,"/passenger/status").hasAuthority("ROLE_USER")
                .antMatchers(HttpMethod.GET,"/passenger/cancel/booking").hasAuthority("ROLE_USER")
                .antMatchers(HttpMethod.GET,"/passenger/booking/receipt").hasAuthority("ROLE_USER")
                .anyRequest().authenticated()
                .and()
                .formLogin().loginPage("/login").permitAll()
                //.loginProcessingUrl("/authenticate").defaultSuccessUrl("/home")
                .loginProcessingUrl("/authenticate")
                .successHandler(customAuthenticationSuccessHandler())
                .failureUrl("/loginError")
                .and().logout().logoutUrl("/logout").logoutSuccessUrl("/afterlogout").invalidateHttpSession(true).deleteCookies("JSESSIONID").permitAll();

    }

}
