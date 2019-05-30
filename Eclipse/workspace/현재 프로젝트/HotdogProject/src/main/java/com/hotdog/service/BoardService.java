package com.hotdog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotdog.dao.BoardDao;
import com.hotdog.vo.BoardVO;
import com.hotdog.vo.Criteria;

@Service
public class BoardService {
	@Autowired
	BoardDao dao;
	
	public List<BoardVO> getList(BoardVO vo) {
		return dao.getList(vo);
	}
	
	public void write(BoardVO vo) {
		dao.write(vo);
	}

	public BoardVO getDetail(BoardVO vo) {
		return dao.getDetail(vo); 
	}

	public List<BoardVO> getCriteriaList(Criteria criteria) {
		return dao.getCriteriaList(criteria);
	}

	public Integer getCountCriteria(Criteria criteria) {
		return dao.getCriteriaCnt(criteria);
	}

	public void delete(BoardVO vo) {
		dao.delete(vo);
	}

	public void update(BoardVO vo) {
		dao.update(vo);
	}
}
