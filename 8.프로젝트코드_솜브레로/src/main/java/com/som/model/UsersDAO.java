package com.som.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.som.db.SqlSessionManager;

public class UsersDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public List<UsersVO> selectAllUsers() {
		List<UsersVO> list = null;
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		list = sqlSession.selectList("selectAll");
		sqlSession.close();
		return list;
	}
	
	public int delete(UsersVO vo) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int cnt = sqlSession.delete("delete", vo);
		sqlSession.close();
		return cnt;
	}
	public int updateStatus(UsersVO vo) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int cnt = sqlSession.update("updateStatus", vo);
		sqlSession.close();
		return cnt;
	}
	
	public int insertUser(UsersVO vo) {
		SqlSession sqlSession =sqlSessionFactory.openSession(true);
	int cnt = sqlSession.insert("insertUser",vo);
			sqlSession.close();
			return cnt;
	}
   public UsersVO login(UsersVO vo) {
	   UsersVO loginUser= null;  
	   SqlSession sqlSession = sqlSessionFactory.openSession(true);
	   loginUser = sqlSession.selectOne("login",vo);
	   sqlSession.close();
	   return loginUser;
   }  
   
   public List<UsersVO> getReviewUser(int product_seq) {
	   List<UsersVO> reviewUser= null;  
	   SqlSession sqlSession = sqlSessionFactory.openSession(true);
	   reviewUser = sqlSession.selectList("getReviewUser",product_seq);
	   sqlSession.close();
	   return reviewUser;
   }  
   
}
