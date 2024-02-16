package kr.liw.service;

import java.util.List;

import kr.liw.domain.Criteria;
import kr.liw.domain.PhotoBoardImageVO;
import kr.liw.domain.PhotoBoardVO;

public interface PhotoBoardService {
	
	public List<PhotoBoardVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	public PhotoBoardVO get(Long pbno);
	
	public void write(PhotoBoardVO photoboard);
	
	public boolean modify(PhotoBoardVO photoboard);
	
	public boolean remove(Long pbno);
	
	public List<PhotoBoardImageVO> getAttachList(Long pbno);
	
	public List<PhotoBoardVO> getListByEmail(String email);
	
	public boolean updateViews(Long pbno);
}
