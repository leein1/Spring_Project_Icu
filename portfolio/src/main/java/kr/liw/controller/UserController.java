package kr.liw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.liw.domain.UserVO;
import kr.liw.service.PhotoBoardService;
import kr.liw.service.ReplyService;
import kr.liw.service.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@Log4j
@RequestMapping("/user/*")
@AllArgsConstructor
public class UserController {

	private UserService service;
	private PhotoBoardService photoboardService;
	private ReplyService replyService;
	
	@PostMapping("/info")
	public void info(String email,Model model) {
		
		UserVO user = service.get(email);
		
		model.addAttribute("photoboardList",photoboardService.getListByEmail(email));
		model.addAttribute("replyList",replyService.getListByEmail(email));
		model.addAttribute("user",user );
	}
	
	@PostMapping("/get")
	public String get(String email, Model model) {
		UserVO user = service.get(email);
		String formattedIntroduce = user.getIntroduce().replaceAll("<br>","");
		user.setIntroduce(formattedIntroduce);
		
		model.addAttribute("user", user);
		
		return "/user/get";
	}
	
	@PostMapping("/modify")
	public String modify(UserVO user,Model model) {
		
		String formattedIntroduce = user.getIntroduce().replaceAll("", "");
		user.setIntroduce(formattedIntroduce);
		service.modify(user);
		model.addAttribute("successMessage", "수정되었습니다.");
		return this.get(user.getEmail(), model);
	}
	
	
	
	@GetMapping("/register")
	public void register() {
		log.info("=================등록화면================");
	}
	
	@Transactional
	@PostMapping("/register")
	public String register(UserVO user, RedirectAttributes rttr	) {
		
		log.info("=================등록처리 @@@@ : " + user);
		service.register(user);
		service.registerAuth(user.getEmail());
		
		rttr.addFlashAttribute("result", user.getUsernumber());
		
		return "redirect:/";
	}
	
	@GetMapping("/login")
	public void login() {
		log.info("=================로그인 화면================");
	}
	
	@PostMapping("/login")
	public String login(String email, String inputPassword, RedirectAttributes rttr) {
		log.info("=================로그인 처리 @@@@ : " + email + " / " + inputPassword);
		boolean loginResult = service.login(email, inputPassword);
		
		if(loginResult == true) {
			return "redirect:/";
		}else {
			rttr.addFlashAttribute("result", "로그인 실패");
			return "redirect:/user/login";
		}
		
		
	}
	
	
}
