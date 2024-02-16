package kr.liw.service;

import org.springframework.stereotype.Service;

import kr.liw.domain.LikesVO;
import kr.liw.mapper.LikesMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class LikesServiceImpl implements LikesService{

	private LikesMapper mapper;

	@Override
	public int clickLike(LikesVO likesVO) {
		log.info("-------------------- click Like " + "--------------------");
		return mapper.insertLike(likesVO);
	}

	@Override
	public int unclickLIke(LikesVO likesVO) {
		log.info("-------------------- unclick Like " + "--------------------");
		return mapper.deleteLike(likesVO);
	}

	@Override
	public int checkLike(LikesVO likesVO) {
		log.info("-------------------- check Like " + "--------------------");
		return mapper.checkLike(likesVO);
	}

	@Override
	public int countLike(LikesVO likesVO) {
		// TODO Auto-generated method stub
		return mapper.countLike(likesVO);
	}
}
