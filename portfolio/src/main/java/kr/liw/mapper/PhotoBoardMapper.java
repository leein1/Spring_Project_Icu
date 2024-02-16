package kr.liw.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.liw.domain.Criteria;
import kr.liw.domain.PhotoBoardVO;

public interface PhotoBoardMapper {
	
	public List<PhotoBoardVO> getList(Criteria cri);
	
	public List<PhotoBoardVO> getList();
	
	public int getTotalCount(Criteria cri);
	
	public PhotoBoardVO read(Long pbno);
	
	public void insert(PhotoBoardVO photoboard);
	
	public int update(PhotoBoardVO photoboard);
	
	public int delete(Long pbno);
	
	public void updateReplyCnt(@Param("pbno") long pbno, @Param("amount") int amount);
	
	public List<PhotoBoardVO> getListByEmail(String email);
	
	public int updateViews(Long pbno);
}
