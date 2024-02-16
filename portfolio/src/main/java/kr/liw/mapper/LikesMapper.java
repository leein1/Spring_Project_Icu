package kr.liw.mapper;

import java.util.List;

import kr.liw.domain.LikesVO;

public interface LikesMapper {

	//좋아요 눌렀을때 
	public int insertLike(LikesVO likesVO);
	
	//좋아요를 다시 눌러서 취소할때
	public int deleteLike(LikesVO LikesVO);
	
	//해당 게시글에 대한 좋아요 확인
	public int checkLike(LikesVO likesVO);
	
	//해당 글에 좋아요가 얼마나 있는지 확인용 
	public int countLike(LikesVO likesVO);
	
	//사용자가 어떤 글에 좋아요를 눌렀는지
	public List<LikesVO> likeList(String email);
	
}
