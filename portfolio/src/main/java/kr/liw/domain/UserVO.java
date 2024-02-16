package kr.liw.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class UserVO {

	private Long usernumber;
	
	private String email;
	
	private String password;
	
	private String nickname;
	
	private String name;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth;
	
	private String tel;
	
	private String address1;
	
	private String address2;
	
	private Date createdate;
	
	private String gid;
	
	private String introduce;
	
	private String instagram;
	
	private List<AuthVO> authList;
	
}
