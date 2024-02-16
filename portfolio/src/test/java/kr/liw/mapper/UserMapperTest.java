package kr.liw.mapper;

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
public class UserMapperTest {

	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;
	
	//@Test
	public void testMapper() {
		assertNotNull(mapper);
		log.info("-----------------------------------------");
		log.info(mapper);
		log.info("-----------------------------------------");
	}
	
	//@Test
	public void testGetList() {
		log.info("-----------------------------------------");
		mapper.getList().forEach(user -> log.info("*****************" + user ));
		log.info("-----------------------------------------");
	}
	
	//@Test
	public void testRead() {
		UserVO user = new UserVO();
		user = mapper.read("leeinwon@test.com");
		log.info("-----------------------------------------");
		log.info(user);
		log.info("-----------------------------------------");
	}

	
	//@Test
	public void testInsert() throws ParseException {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
		Date date = dateFormat.parse("1991.01.01");
		
		
		UserVO user = new UserVO();
		user.setEmail("test8@test.com");
		user.setPassword("test2");
		user.setNickname("test2");
		user.setName("test2");
		user.setBirth(date);
		user.setTel("010-1234-1234");
		
		mapper.insert(user);
		log.info(user);
	}
	
	//@Test
	public void testUpdate() throws ParseException {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
		Date date = dateFormat.parse("2000.01.01");
		
		UserVO user = new UserVO();
		user.setUsernumber(1l);
		user.setNickname("modi test2");
		user.setName("modi test2");
		user.setBirth(date);
		user.setTel("010-1111-1111");
		user.setAddress1("modi 대구시 달서구");
		user.setAddress2("modi 상인동");
		
		int count = mapper.update(user);
		log.info("-----------------------------------------");
		log.info("update result : " + count);
		log.info("-----------------------------------------");
	}
	
	//@Test
	public void testDelete() {
		int count = mapper.delete(1l);
		log.info("-----------------------------------------");
		log.info("delete result : " + count);
		log.info("-----------------------------------------");
	}
	
	//@Test
	public void testCheckEmail() {
		int count = mapper.checkEmail("test@test.com");
		log.info("-----------------------------------------");
		log.info("checkEmail result : " + count);
		log.info("-----------------------------------------");
	}
	
	//@Test
	public void testCheckNickname() {
		int count = mapper.checkNickname("test2");
		log.info("-----------------------------------------");
		log.info("checkNickname result : " + count);
		log.info("-----------------------------------------");
	}
	
	
//	로그인 관련 테스트 xml 새로 쓴 내용 
	
	@Test
	public void testRead2() {
		UserVO vo = mapper.read("leeinwon@test.com");
		log.info(vo);
		
		vo.getAuthList().forEach(authVO -> log.info(authVO));
	}
}
