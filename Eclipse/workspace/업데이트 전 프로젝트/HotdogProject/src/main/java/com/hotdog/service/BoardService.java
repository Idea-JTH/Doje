package com.hotdog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotdog.dao.BoardDao;
import com.hotdog.vo.BoardVO;

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
}
