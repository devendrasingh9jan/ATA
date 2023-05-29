package com.travel.ata.model;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class UserDetailsImpl implements UserDetails {
	
	
	private static final long serialVersionUID = 1L;

	private User user;
	
	public UserDetailsImpl(User user) {
		
		super();
		this.user=user;
		
		
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		
		
		List<GrantedAuthority> grantedAuthorities=new ArrayList<GrantedAuthority>();
		grantedAuthorities.add(new SimpleGrantedAuthority(this.user.getAuthority()));
		System.out.println("inside details impl "+grantedAuthorities.get(0).getAuthority());
		return grantedAuthorities;
	}

	@Override
	public String getPassword() {
		
		return this.user.getPassword();
	}

	@Override
	public String getUsername() {
		
		return this.user.getUsername();
	}

	@Override
	public boolean isAccountNonExpired() {
		
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		
		return true;
	}

	@Override
	public boolean isEnabled() {
		
		return true;
	}
	
	 public User getUserDetails() {
	        return user;
	    }

}
