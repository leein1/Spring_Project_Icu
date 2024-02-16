package kr.liw.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import kr.liw.domain.Criteria;
import kr.liw.domain.ReplyVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplymapperTests {
	
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	//@Test
	public void testMapper(){
		
		log.info(mapper);
	}
	
	//@Test
	public void testCreate() {
		
			ReplyVO vo = new ReplyVO();
			
			vo.setPbno(23l);
			vo.setReply("댓글 테스트");
			vo.setReplyer("replyer");
			
			mapper.insert(vo);
		
	}
	
	//@Test
	public void testRead() {
		
		Long targetRno = 2L;
		ReplyVO vo = mapper.read(targetRno);
		
		log.info(vo);
	}
	
	//@Test
	public void testDelete() {
		Long targetRno = 1l;
		
		mapper.delete(targetRno);
	}

	//@Test
	public void testUpdate() {
		
		Long targetRno = 2L;
		
		ReplyVO vo = mapper.read(targetRno);
		
		vo.setReply("update reply");
		int count = mapper.update(vo);
		log.info("update count ------------------------- : " + count );
	}
	
	//@Test
	public void testList() {
		
		Criteria cri = new Criteria();
		List<ReplyVO> replies = mapper.getListWithPaging(cri, 23l);
		
		replies.forEach(reply -> log.info(replies));
	}
	
	//@Test
	public void testList2() {
		Criteria cri = new Criteria(2,10);
		
		List<ReplyVO> replies = mapper.getListWithPaging(cri, 23l);
		replies.forEach(reply -> log.info(reply));
	}
}
