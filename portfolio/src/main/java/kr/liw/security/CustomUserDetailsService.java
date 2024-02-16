package kr.liw.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.liw.domain.UserVO;
import kr.liw.mapper.UserMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService{

	@Setter(onMethod_ = @Autowired)
	private UserMapper userMapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		log.warn("Load User By userName : " + username);
		
		//userName means email
		UserVO vo = userMapper.read(username);
		
		log.warn("queried by user mapper : " + vo);
		
		return vo == null ? null : new CustomUser(vo);
	}
	
	
}
