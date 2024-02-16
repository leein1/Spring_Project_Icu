package kr.liw.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.liw.domain.Criteria;
import kr.liw.domain.ReplyVO;

public interface ReplyMapper {

	public int insert(ReplyVO vo);
	
	public ReplyVO read(Long rno);
	
	public int delete(Long rno);
	
	public int update(ReplyVO reply);
	
	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri,@Param("pbno") Long pbno);
	
	public int getCountByPbno(Long pbno);
	
	public List<ReplyVO> getListByEmail(String email);
}
