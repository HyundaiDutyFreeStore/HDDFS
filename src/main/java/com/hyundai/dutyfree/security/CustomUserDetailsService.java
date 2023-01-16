package com.hyundai.dutyfree.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.hyundai.dutyfree.mapper.MemberMapper;
import com.hyundai.dutyfree.security.domain.CustomUser;
import com.hyundai.dutyfree.vo.MemberVO;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService{
	@Autowired
	private MemberMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.warn("UserName: "+username);
		MemberVO vo = mapper.read(username);
		log.warn("mapper에서 가져온 vo"+vo);
		CustomUser member = new CustomUser(vo.getMid(), vo.getMpassword(), getAuth(vo));
		return member;
	}
	
	private static Collection getAuth(MemberVO vo) {
		 Collection authorities = new ArrayList<>();
	        if(vo.getMrole().equals("ROLE_ADMIN")){
	            authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
	        }else{
	            authorities.add(new SimpleGrantedAuthority("ROLE_MEMBER"));
	        }
	        return authorities;
	}

}
