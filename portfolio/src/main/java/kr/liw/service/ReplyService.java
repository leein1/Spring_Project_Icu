package kr.liw.service;

import java.util.List;

import kr.liw.domain.Criteria;
import kr.liw.domain.ReplyPageDTO;
import kr.liw.domain.ReplyVO;

public interface ReplyService {

	
	public int register(ReplyVO vo);
	
	public ReplyVO get(Long rno);
	
	public int modify(ReplyVO vo);
	
	public int remove(Long rno);
	
	public List<ReplyVO> getList(Criteria cri, Long pbno);
	
	public ReplyPageDTO getListPage(Criteria cri, Long pbno);
	
	public List<ReplyVO> getListByEmail(String email);
	
}
