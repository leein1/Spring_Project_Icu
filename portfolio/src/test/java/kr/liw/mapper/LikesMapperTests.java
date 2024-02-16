package kr.liw.mapper;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.liw.domain.Criteria;
import kr.liw.domain.LikesVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class LikesMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private LikesMapper mapper;
	
	@Test
	public void testMapper() {
		assertNotNull(mapper);
		log.info("-----------------------------------------");
		log.info(mapper);
		log.info("-----------------------------------------");
	}
	
	//@Test
	public void testGetList() {
		log.info("-----------------------------------------");
		
		Criteria cri = new Criteria();
		cri.setPageNum(1);
		cri.setAmount(10);
//		List<PhotoBoardVO> list = mapper.getList(cri);
		
//		list.forEach(photoboard -> log.info(photoboard));
		log.info("-----------------------------------------");
	}
	
	//@Test
	public void testRead() {
//		PhotoBoardVO photobaord = new PhotoBoardVO();
//		photobaord = mapper.read(6l);
		log.info("-----------------------------------------");
//		log.info(photobaord);
		log.info("-----------------------------------------");
	}
	
	@Test
	public void testInsert() {
		LikesVO likes = new LikesVO();
		
		likes.setBno((long) 1);
		likes.setEmail("leeinwon@test.com");
		likes.setBoardtype("photoboard");
		
		mapper.insertLike(likes);
		log.info("------------------------"+likes.getLno());
		
//		PhotoBoardVO photoboard = new PhotoBoardVO();
		
//		photoboard.setEmail("test2@test.com");
//		photoboard.setCategory("insert test");
//		photoboard.setTitle("insert test");
//		photoboard.setContent("insert test");
		
//		mapper.insert(photoboard);
//		log.info("------------------------"+photoboard.getPbno());
		
	}
	
	//@Test
	public void testUpdate() {
//		PhotoBoardVO photoboard = new PhotoBoardVO();
//		photoboard.setCategory("update test");
//		photoboard.setTitle("update test");
//		photoboard.setContent("update test");
//		photoboard.setPbno(6l);
//		int count = mapper.update(photoboard);
//		log.info("-----------------------------------------");
//		log.info("update result : " + count);
//		log.info("-----------------------------------------");
	}
	
	//@Test
	public void testDelete() {
//		int count = mapper.delete(7l);
//		log.info("-----------------------------------------");
//		log.info("delete result : " + count);
//		log.info("-----------------------------------------");
	}
}
