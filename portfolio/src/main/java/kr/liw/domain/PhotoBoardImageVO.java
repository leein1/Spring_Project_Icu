package kr.liw.domain;

import lombok.Data;

@Data
public class PhotoBoardImageVO {

	private Long imgno;
	private Long pbno;
	private Long orderno;
	private String name;
	private String uuid;
	private String path;
	private String type;
}
