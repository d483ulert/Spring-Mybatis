package com.my.page.board;
import java.util.Date;
import lombok.Data;

@Data
public class BoardVO {
	private int bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private int viewcnt;
	private int page;
	private int perPageNum;

}
