package net.koreate.qnaboard.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.koreate.qnaboard.dao.QnABoardDAO;
import net.koreate.qnaboard.vo.QnABoardVO;

@Service
public class QnABoardServiceImpl implements QnABoardService {

	@Inject
	QnABoardDAO dao;
	
	@Override
	public void regist(QnABoardVO vo) throws Exception {
		dao.regist(vo);
		System.out.println("QnA게시판 글쓰기 완료");
	}

	@Override
	public List<QnABoardVO> list() throws Exception {
		
		return dao.list();
	}

	@Override
	public QnABoardVO detail(int qno) throws Exception {
		
		return dao.detail(qno);
	}

}
