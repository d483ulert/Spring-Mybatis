package com.my.page.board;
import java.util.List;
import com.my.page.board.BoardVo;

public interface BoardDAO {
	//List
	public List<BoardVo> boardList() throws Exception;
	
	//C
	public void writerBoard(BoardVo bdto) throws Exception;
	
	//R
	public BoardVo boardRead(int bno) throws Exception;
	
	//U
	public void boardUpdate(BoardVo bdto) throws Exception;
	
	//D
	public void boardDelete(int bno) throws Exception;
	
	//게시물 총 개수
	public int countBoard() throws Exception;
	
	//조회수
	public void updateViewCnt(int bno)throws Exception;

}
