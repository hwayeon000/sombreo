package com.som.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.som.db.SqlSessionManager;

public class SaleDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	// 매매 희망 상품 폼 작성
	public int insertSale(SaleVO vo) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int cnt = sqlSession.insert("insertSale", vo);
		sqlSession.close();
		return cnt;
	}
	
	// 매매 상품 리스트
	public List<SaleVO> selectAllSale() {
		List<SaleVO> list = null;
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		list = sqlSession.selectList("selectAllSale");
		sqlSession.close();
		return list;
	}
	
	public int updateReturn(SaleVO vo) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int cnt = sqlSession.update("updateReturn", vo);
		sqlSession.close();
		return cnt;
	}
	
	// 판매상품 상세정보
	public SaleVO detailSale(int num) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		SaleVO vo = sqlSession.selectOne("detailSale", num);
		sqlSession.close();
	
		return vo;
	}

}
