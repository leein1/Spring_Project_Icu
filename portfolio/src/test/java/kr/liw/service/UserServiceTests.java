package kr.liw.service;

import static org.junit.Assert.assertNotNull;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.liw.domain.UserVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserServiceTests {

	@Setter(onMethod_ = @Autowired)
	private UserService service;
	
	//@Test
	public void testExist() {
		
		log.info("---------------" +service);
		assertNotNull(service);
	}
		
	//@Test
	public void testGet() {
		log.info(service.get("leeinwon@test.com"));
	}
	
	//@Test
	public void testRegister() throws ParseException {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
		Date date = dateFormat.parse("1991.01.01");
		
		UserVO user = new UserVO();
		user.setEmail("test4@test.com");
		user.setPassword("test4");	
		user.setNickname("test4");
		user.setName("test4");
		user.setBirth(date);
		user.setTel("010-1234-1234");
		user.setAddress1("test4");
		user.setAddress2("test4");
		
		service.register(user);
		log.info("----------------------------register result : " +user);
	}
	
	//@Test
	public void testModify() throws ParseException {
		UserVO user = service.get("leeinwon@test.com");
		
		if(user == null) {
			return;
		}
		
		user.setNickname("modify3");
		log.info("----------------------------register result : " + service.modify(user));
		
	}
	
	//@Test
	public void testRemove() {
		log.info("----------------------------delete result : " + service.remove(3l));
	}
	
	//@Test
	public void testDuplicateEmail() {
		log.info("----------------------------duplicate email result : " + service.checkDuplicateEmail("test@test.com"));
	}
	
	//@Test
	public void testDuplicateNickname() {
		log.info("----------------------------duplicate nickname result : " + service.checkDuplicateNickname("test"));
	}
	
	@Test
	public void testLogin() {
		log.info("----------------------------login result : " + service.login("leeinwontest@test.com", "leeinwon"));
	}
	
}
