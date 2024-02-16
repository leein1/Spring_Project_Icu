package kr.liw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/sample/*")
@Controller
public class SampleController {
//	/sample/all	로그인을 하지 않은 상요자도 접그 가능한 uri
//	/sample/member	로그인 한 사용자들만이 접근할 수 있는 uri
//	/sample/admin	 로그인 한 사람들 중에서 관리자 권한을 가진 사용자만이 접근할 수 있는 uri
	
	@GetMapping("/all")
	public void doAll() {
		log.info("do all can access everybody");
	}
	
	@GetMapping("/member")
	public void doMember() {
		log.info("logined member");
	}
	
	@GetMapping("/admin")
	public void doAdmin() {
		log.info("admin only");
	}
}
