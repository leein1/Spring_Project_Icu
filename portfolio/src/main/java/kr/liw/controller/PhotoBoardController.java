package kr.liw.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.liw.domain.Criteria;
import kr.liw.domain.LikesVO;
import kr.liw.domain.PageDTO;
import kr.liw.domain.PhotoBoardImageVO;
import kr.liw.domain.PhotoBoardVO;
import kr.liw.domain.UserVO;
import kr.liw.service.LikesService;
import kr.liw.service.PhotoBoardImageService;
import kr.liw.service.PhotoBoardService;
import kr.liw.service.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/photoboard/*")
@AllArgsConstructor
public class PhotoBoardController {
	
	private PhotoBoardService service;
	private UserService uservice;
	private PhotoBoardImageService imageService;
	
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		
		cri.setAmount(12);
		log.info("=================전체 리스트 : " + cri + "================");
		
		model.addAttribute("list", service.getList(cri));
		
		int total = service.getTotal(cri);
		model.addAttribute("total",total);
		
		log.info("total: " + total);
		
		model.addAttribute("pageMaker",new PageDTO(cri,total));
	}
	
	@GetMapping("/get")
	public String get(@RequestParam("pbno") long pbno, @ModelAttribute("cri") Criteria cri ,Model model,
	        HttpServletRequest request, HttpServletResponse response) {

	    log.info("=================get 이나 modi 요청 :" + cri + "pbno :" + pbno + "================");

	    // 조회수 처리
	    Cookie[] cookies = request.getCookies();
	    boolean createNewCookie = true;

	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if (cookie.getName().equals("viewed_" + pbno)) {
	                // 쿠키가 존재하고, 그 날짜가 오늘과 같은지 확인하여 중복 조회를 방지
	                createNewCookie = !LocalDate.now().toString().equals(cookie.getValue());
	                break;
	            }
	        }
	    }

	    if (createNewCookie) {
	        // 조회수 증가 및 쿠키 설정 로직
	        // ...
	        service.updateViews(pbno);
	        // 쿠키 생성 및 설정
	        Cookie newCookie = new Cookie("viewed_" + pbno, LocalDate.now().toString());
	        newCookie.setMaxAge(24 * 60 * 60); // 1일 동안 유지되도록 설정 (초 단위)
	        newCookie.setPath("/"); // 쿠키의 경로 설정
	        response.addCookie(newCookie);
	    }
	    
	    //게시물 번호 정보 가져오기 
	    PhotoBoardVO photoBoard = service.get(pbno);
	    //해당 게시물 글쓴이 정보 가져오기 
	    String email = photoBoard.getEmail();
	    UserVO userInfo = uservice.get(email);


	    model.addAttribute("cri", cri);
	    model.addAttribute("photoboard", photoBoard);
	    model.addAttribute("userInfo", userInfo);

	    return "photoboard/get";
	}
	
	@GetMapping("/modify")
	public void modify(@RequestParam("pbno") long pbno, @ModelAttribute("cri") Criteria cri ,Model model) {
		
		log.info("=================get 이나 modi 요청 :"+cri+"pbno :"+pbno+"================");
		
		
		
		PhotoBoardVO photoBoard = service.get(pbno);
		String email = photoBoard.getEmail();
		UserVO userInfo = uservice.get(email);
		
		model.addAttribute("cri", cri);
		model.addAttribute("photoboard",photoBoard);
		model.addAttribute("userInfo", userInfo);
	}
	
	@PreAuthorize("principal.user.email == #photoboard.email")
	@PostMapping("/modify")
	public String modify(PhotoBoardVO photoboard, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("=================수정 처리 : ================");
		
		if(service.modify(photoboard)) {
			rttr.addFlashAttribute("result", "수정성공");
			
		}
		
		return "redirect:/photoboard/get?"+cri.getListLink()+"&pbno=" + photoboard.getPbno();
		
	}
	
	@GetMapping("/write")
	@PreAuthorize("isAuthenticated()")
	public void write() {
		log.info("=================글쓰기 페이지 : ================");

	}
	
	@PostMapping("/write")
	@PreAuthorize("isAuthenticated()")
	public String write(PhotoBoardVO photoboard, RedirectAttributes rttr) {
		log.info("=================글쓰기 처리 : ================");
		
		log.info("resgister : " + photoboard);
		
		if(photoboard.getAttachList() != null	) {
			photoboard.getAttachList().forEach(attach ->log.info(attach));
		}
		service.write(photoboard);
		//rttr.addFlashAttribute("result", photoboard.getPbno());
		
		//이미지테이블 인서트도 해야함
		
		return "redirect:/photoboard/list";
	}
	
	@PreAuthorize("principal.user.email == #email")
	@PostMapping("/remove")
	public String remove(@RequestParam("pbno")long pbno,@RequestParam("email") String email, Criteria cri, RedirectAttributes rttr) {
		log.info("=================삭제 처리 : ================");
		log.info(email);
		List<PhotoBoardImageVO> attachList = service.getAttachList(pbno);
		
		if(service.remove(pbno)) {
			
			//delete attach files
			deleteFiles(attachList);
			
			rttr.addFlashAttribute("result","삭제성공");
			
		}
		
		return "redirect:/photoboard/list" + cri.getListLink();
	}
	
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<PhotoBoardImageVO>> getAttachListh(Long pbno){
		log.info("================= 이미지 리스트 가져오기 : " + pbno + " ================");
		return new ResponseEntity<List<PhotoBoardImageVO>>(service.getAttachList(pbno), HttpStatus.OK);
	}
	
	private void deleteFiles(List<PhotoBoardImageVO> attachList) {
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		
		log.info("=================첨부 파일 삭제 : ================");
		log.info(attachList);
		
		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("/Users/leeinwon/SpringUpload/"+attach.getPath()
				+"/"+attach.getUuid()+"_"+attach.getName());
				
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					
					Path thumbNail = Paths.get("/Users/leeinwon/SpringUpload/"+attach.getPath()
				+"/s_"+attach.getUuid()+"_"+attach.getName());
					
					Files.delete(thumbNail);
				}
			} catch (Exception e) {
				log.error("delete file error" + e.getMessage());
			}
		});
	}
}
