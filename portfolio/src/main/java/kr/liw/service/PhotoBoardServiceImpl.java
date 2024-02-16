package kr.liw.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.liw.domain.Criteria;
import kr.liw.domain.PhotoBoardImageVO;
import kr.liw.domain.PhotoBoardVO;
import kr.liw.mapper.PhotoBoardImageMapper;
import kr.liw.mapper.PhotoBoardMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class PhotoBoardServiceImpl implements PhotoBoardService{

	private PhotoBoardMapper mapper;
	private PhotoBoardImageMapper imageMapper;
	
	@Override
	public List<PhotoBoardVO> getList(Criteria cri) {
		log.info("-------------------- getList " + "--------------------");
		
		return mapper.getList(cri);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}
	
	@Override
	public PhotoBoardVO get(Long pbno) {
		log.info("-------------------- get " + pbno + "--------------------");
		
		return mapper.read(pbno);
	}

	@Transactional
	@Override
	public void write(PhotoBoardVO photoboard) {
		log.info("-------------------- write " + photoboard + " --------------------");
		mapper.insert(photoboard);
		
		if(photoboard.getAttachList() == null || photoboard.getAttachList().size() <= 0) {
			return;
		}
		
		photoboard.getAttachList().forEach(attach ->{
			attach.setPbno(photoboard.getPbno());
			imageMapper.insert(attach);
		});
	}
	
	@Override
	public boolean modify(PhotoBoardVO photoboard) {
		log.info("-------------------- modify " + photoboard + " --------------------");
		
		imageMapper.deleteAll(photoboard.getPbno());
		boolean modifyResult =  mapper.update(photoboard) == 1;
		
		if(modifyResult && photoboard.getAttachList() != null && photoboard.getAttachList().size() > 0) {
			
			photoboard.getAttachList().forEach(attach -> {
				attach.setPbno(photoboard.getPbno());
				imageMapper.insert(attach);
			});
		}
		
		return modifyResult;
	}
	
	@Override
	public boolean updateViews(Long pbno) {
		log.info("-------------------- update views " + pbno + " --------------------");
		
		return mapper.updateViews(pbno) == 1;
	}
	
	@Transactional
	@Override
	public boolean remove(Long pbno) {
		log.info("-------------------- remove " + pbno + " --------------------");
		imageMapper.deleteAll(pbno);
		return mapper.delete(pbno) == 1;
	}

	@Override
	public List<PhotoBoardImageVO> getAttachList(Long pbno) {
		log.info("-------------------- get attach list by pbno " + pbno + " --------------------");
		
		return imageMapper.findByPbno(pbno);
	}

	@Override
	public List<PhotoBoardVO> getListByEmail(String email) {
		log.info("-------------------- get list by email " + email + " --------------------");
		
		return mapper.getListByEmail(email);
	}

	

	
}
