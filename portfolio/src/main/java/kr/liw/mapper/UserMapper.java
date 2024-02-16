package kr.liw.mapper;

import java.util.List;


import kr.liw.domain.UserVO;

public interface UserMapper {

	public List<UserVO> getList();
	
	public UserVO read(String email);
	
	public void insert(UserVO user);
	
	public void insertAuth(String email);
	
	public int update(UserVO user);
	
	public int delete(Long usernumber);
	
	public int checkEmail(String email);
	
	public int checkNickname(String nickname);
	
	
}
