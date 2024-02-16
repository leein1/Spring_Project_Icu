package kr.liw.service;

import org.springframework.stereotype.Service;

import kr.liw.domain.PhotoBoardImageVO;
import kr.liw.domain.PhotoBoardVO;
import kr.liw.mapper.PhotoBoardImageMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class PhotoBoardImageServiceImpl implements PhotoBoardImageService {
	
	private PhotoBoardImageMapper mapper;

	@Override
	public void write(PhotoBoardImageVO photoBoardImage) {
		log.info("-------------------- write " + photoBoardImage + " --------------------");
		mapper.insert(photoBoardImage);
		
	}

}
