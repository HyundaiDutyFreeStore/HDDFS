package com.hyundai.dutyfree.security.domain;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
/**
 * CustomUser
 * 
 * @author 김가희
 * @since 01.17
 * 
 *        
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.17    김가희                        최초 생성
 *        
 */
public class CustomUser extends User{
	private static final long serialVersionUID = 1L;
	
	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}

}
