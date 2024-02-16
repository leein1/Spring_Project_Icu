package kr.liw.mapper;

import java.util.List;

import kr.liw.domain.PhotoBoardImageVO;

public interface PhotoBoardImageMapper {
	
	public List<PhotoBoardImageVO> findByPbno(Long pbno);
	
	public void insert(PhotoBoardImageVO photoBoardImage);
	
	public int delete(String uuid);
	
	public void deleteAll(Long pbno);
	
	public List<PhotoBoardImageVO> getOldFiles();

}
