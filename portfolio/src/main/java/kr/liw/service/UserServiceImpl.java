package kr.liw.service;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

import kr.liw.domain.UserVO;
import kr.liw.mapper.UserMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService{

	private UserMapper mapper;
	
	@Override
	public UserVO get(String email) {
		log.info("-------------------- get " + email + "--------------------");
		
		UserVO user = mapper.read(email);
		
		String formattedIntroduce = user.getIntroduce().replaceAll("\n","<br>");
		user.setIntroduce(formattedIntroduce);
		
		return user;
	}

	@Override
	public void register(UserVO user) {
		log.info("-------------------- register " + user + " --------------------");
		
		//사용자가 입력한 비밀번호 암호화. jbCrypt 사용
		String cryptPwd = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
		user.setPassword(cryptPwd);
		
		mapper.insert(user);
	}
	
	@Override
	public void registerAuth(String email) {
		log.info("-------------------- register Auth " + email + " --------------------");
		
		mapper.insertAuth(email);
	}

	@Override
	public boolean modify(UserVO user) {
		log.info("-------------------- modify " + user + " --------------------");
		return mapper.update(user) == 1;
	}

	@Override
	public boolean remove(Long usernumber) {
		log.info("-------------------- remove " + usernumber + " --------------------");
		return mapper.delete(usernumber) == 1;
	}

	@Override
	public int checkDuplicateEmail(String email) {
		log.info("-------------------- checkDuplicateEmail " + email + " --------------------");
		return mapper.checkEmail(email);
	}

	@Override
	public int checkDuplicateNickname(String nickname) {
		log.info("-------------------- checkDuplicateNickname " + nickname + " --------------------");
		return mapper.checkNickname(nickname);
	}

	@Override
	public boolean login(String email, String inputPassword) {
		log.info("-------------------- login " + email + " / " + inputPassword + " --------------------");
		UserVO user = mapper.read(email);
		
		String password = user.getPassword();

		boolean isPasswordMatch = BCrypt.checkpw(inputPassword,password);
		
		
		return isPasswordMatch;
	}

	
}
