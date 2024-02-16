package kr.liw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.liw.domain.Criteria;
import kr.liw.domain.ReplyPageDTO;
import kr.liw.domain.ReplyVO;
import kr.liw.mapper.PhotoBoardMapper;
import kr.liw.mapper.ReplyMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService{
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private PhotoBoardMapper photoboardMapper;
	
	@Override
	public int register(ReplyVO vo) {
		log.info("register.........:" + vo);
		photoboardMapper.updateReplyCnt(vo.getPbno(), 1);
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long rno) {
		log.info("get...............:" + rno);
		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyVO vo) {
		log.info("modify..........." + vo);
		return mapper.update(vo);
	}

	@Override
	public int remove(Long rno) {
		log.info("remove........" + rno);
		ReplyVO vo = mapper.read(rno);
		photoboardMapper.updateReplyCnt(vo.getPbno(),-1);
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long pbno) {
		log.info("get Reply List of a Board" + pbno);
		return mapper.getListWithPaging(cri, pbno);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long pbno) {
		
		return new ReplyPageDTO(mapper.getCountByPbno(pbno), mapper.getListWithPaging(cri, pbno));
	}

	@Override
	public List<ReplyVO> getListByEmail(String email) {
		log.info("get Reply List By email" + email);

		return mapper.getListByEmail(email);
	}
	
}
