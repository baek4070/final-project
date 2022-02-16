package net.koreate.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.koreate.board.dao.BoardDAO;
import net.koreate.board.util.Criteria;
import net.koreate.board.util.PageMaker;
import net.koreate.board.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject 
	BoardDAO dao;
	
	@Override
	public List<BoardVO> list(Criteria cri) throws Exception {
		List<BoardVO> list = dao.list(cri);
		return list;
	}

	@Override
	public int listCount(Criteria cri) {
		int list = 0;
		try {
			list = dao.listCount(cri);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public PageMaker getPageMaker(Criteria cri) throws Exception {
		int totalCount = dao.listCount(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		System.out.println(pageMaker);
		return pageMaker;
	}

	@Override
	public void register(BoardVO board) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public BoardVO read(int bno) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean modify(BoardVO board) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean remove(int bno) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

}
