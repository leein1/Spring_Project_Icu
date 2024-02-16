package kr.liw.service;

import static org.junit.Assert.assertNotNull;

import java.text.ParseException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.liw.domain.Criteria;
import kr.liw.domain.PhotoBoardVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class PhotoBoardServiceTests {

	@Setter(onMethod_ = @Autowired)
	private PhotoBoardService service;
	private Criteria cri;
	//@Test
	public void testExist() {
		
		log.info("---------------" +service);
		assertNotNull(service);
	}
	
	@Test
	public void testGetList() {
		log.info("--------------- get list" +service);
		service.getList(cri);

	}
		
	//@Test
	public void testGet() {
		log.info(service.get(6l));
	}
	
	
	//@Test
	public void testWrite() {
		
		PhotoBoardVO photoboard = new PhotoBoardVO();
		photoboard.setEmail("test2@test.com");
		photoboard.setCategory("test4");	
		photoboard.setTitle("test4");
		photoboard.setContent("test4");
		
		service.write(photoboard);
		log.info("----------------------------register result : " +photoboard);
	}
	
	//@Test
	public void testModify() throws ParseException {
		PhotoBoardVO photoboard = service.get(8l);
		
		if(photoboard == null) {
			return;
		}
		
		photoboard.setTitle("modify3");
		log.info("----------------------------register result : " + service.modify(photoboard));
		
	}
	
	//@Test
	public void testRemove() {
		log.info("----------------------------delete result : " + service.remove(8l));
	}
}
