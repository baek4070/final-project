package net.koreate.qnaboard.vo;

import java.util.Date;

import lombok.Data;

@Data
public class QnABoardVO {

	private int qno;
	private String userId;
	private String title;
	private String content;
	private String userNickname;
	private Date regdate;
	private int viewcnt;
	private String filename;
	private String filepath;
}
