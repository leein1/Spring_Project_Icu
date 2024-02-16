package kr.liw.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private long rno;
	
	private long pbno;
	
	private String reply;
	
	private String replyer;
	
	private String replyer_nickname;
	
	private Date replydate;
	
	private Date updatedate;
	
	private long parent_rno;
}
