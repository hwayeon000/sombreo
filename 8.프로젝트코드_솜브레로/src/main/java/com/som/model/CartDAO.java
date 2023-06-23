package com.som.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.som.db.SqlSessionManager;

public class CartDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	// 장바구니 업데이트
	public int insertCart(CartVO cartVo) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int res = sqlSession.insert("com.som.db.CartMapper.insertCart", cartVo);
		sqlSession.close();
		return res;
	}
	
	// 장바구니 불러오기
	public List<CartVO> printCart(int user_seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<CartVO> list = sqlSession.selectList("com.som.db.CartMapper.printCart", user_seq);
		sqlSession.close();
		return list;
	}
	
	// 장바구니 삭제
	public int deleteCart(int cart_seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int res = sqlSession.delete("com.som.db.CartMapper.deleteCart", cart_seq);
		sqlSession.close();
		return res;
	}
	
	// 결제 후 장바구니 비우기
	public int ClearCart(int user_seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int res = sqlSession.delete("com.som.db.CartMapper.ClearCart", user_seq);
		sqlSession.close();
		return res;
	}
	
	
	
}
