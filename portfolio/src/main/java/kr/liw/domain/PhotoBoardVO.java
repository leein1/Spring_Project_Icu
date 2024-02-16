package kr.liw.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class PhotoBoardVO {

	private Long pbno;
	
	private String email;
	
	private String nickname;
	
	private String category;
	
	private String title;
	
	private String content;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdate;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updatedate;
	
	private String image_path;
	
	private String image_uuid;
	
	private String image_name;
	
	private int replycnt;
	
	private int views;
	
	private List<PhotoBoardImageVO> attachList;
}
