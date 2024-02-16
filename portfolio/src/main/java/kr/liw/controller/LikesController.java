package kr.liw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.liw.domain.LikesVO;
import kr.liw.service.LikesService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/likes/*")
@AllArgsConstructor
public class LikesController {
	
	private LikesService service;
	
	@GetMapping("/check")
	@ResponseBody
	public int get(LikesVO likesVO) {
		return service.checkLike(likesVO);
	}
	
	@GetMapping("/click")
	@ResponseBody
	public int click(LikesVO likesVo) {
		return service.clickLike(likesVo);
	}
	
	@GetMapping("/unclick")
	@ResponseBody
	public int unclick(LikesVO likesVo) {
		return service.unclickLIke(likesVo);
	}
	
	@GetMapping("/count")
	@ResponseBody
	public int count(LikesVO likesVO) {
		return service.countLike(likesVO);
	}

}
