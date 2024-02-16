package kr.liw.service;

import kr.liw.domain.UserVO;

public interface UserService {

	public UserVO get(String email);
	
	public void register(UserVO user);
	
	public void registerAuth(String email);
	
	public boolean modify(UserVO user);
	
	public boolean remove(Long usernumber);
	
	public int checkDuplicateEmail(String email);
	
	public int checkDuplicateNickname(String nickname);
	
	public boolean login(String email, String inputPassword);
}
