package kr.liw.service;

import kr.liw.domain.LikesVO;

public interface LikesService {

	public int clickLike(LikesVO likesVO);
	
	public int unclickLIke(LikesVO likesVO);
	
	public int checkLike(LikesVO likesVO);
	
	public int countLike(LikesVO likesVO);
}
