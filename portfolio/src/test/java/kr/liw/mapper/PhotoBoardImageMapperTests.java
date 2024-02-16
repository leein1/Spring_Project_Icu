package kr.liw.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.liw.domain.PhotoBoardImageVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class PhotoBoardImageMapperTests {

	@Setter(onMethod_ = @Autowired)
	private PhotoBoardImageMapper mapper;
	
	@Test
	public void testInsert() {
		PhotoBoardImageVO photoBoardImage = new PhotoBoardImageVO();
		photoBoardImage.setPbno(1l);
		photoBoardImage.setOrderno(1l);
		photoBoardImage.setName("insert test");
		photoBoardImage.setPath("insert test path");
		photoBoardImage.setUuid("insert test uuid");
		
		mapper.insert(photoBoardImage);
		
		log.info(photoBoardImage);
	}

}
