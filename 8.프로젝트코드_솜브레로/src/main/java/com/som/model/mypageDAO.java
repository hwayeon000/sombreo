package com.som.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.som.db.SqlSessionManager;

public class mypageDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public List<mypageVO> showOrderList(int user_seq){
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<mypageVO> orderList = sqlSession.selectList("showOrderList", user_seq);
		sqlSession.close();
		
		return orderList;
	}
	
	public String showUserStatus(int user_seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		String user_status = sqlSession.selectOne("showUserStatus", user_seq);
		sqlSession.close();
		
		return user_status;
	}
	
	public List<mypageVO> showMyInquiry(int user_seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<mypageVO> inquiryList = sqlSession.selectList("showMyInquiry", user_seq);
		sqlSession.close();
		
		return inquiryList;
	}
}
