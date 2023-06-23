package com.som.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.som.db.SqlSessionManager;

public class OrderDAO {
	
SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	// 주문번호 생성
	public int insertOrder(OrderVO vo) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int res = sqlSession.insert("com.som.db.OrderMapper.insertOrder", vo);
		sqlSession.close();
		return res;
	}
	
	// 렌탈 상세 생성
	public int insertRental(CartVO cartVO) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int res = sqlSession.insert("com.som.db.OrderMapper.insertRental", cartVO);
		sqlSession.close();
		return res;
	}

}
