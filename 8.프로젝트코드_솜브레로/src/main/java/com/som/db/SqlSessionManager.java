package com.som.db;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.javassist.bytecode.stackmap.BasicBlock.Catch;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// mybatis 설정 파일을 읽어 와 db와 연결 후 세션을 반환
public class SqlSessionManager {
	// DB연결 및 해제 ...
	
	// 맘대로 접근 못하도록 private, static 영역에서 사용 가능하도록 선언
	// SqlSessionFactory : SqlSession( DB연결, sql(INSERT, DELETE, ...)실행, 트랜젝션 관리 ) 생성
	private static SqlSessionFactory sqlSessionFactory;
	
	// 기 클래스를 실행하기 전부터 존재하도록 하기 위함
	static {
		// static 영역에 넣어줘야 함
		try {
			String resource = "com/som/db/mybatis-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			
			// new : 객체 생성, 반환을 위한 전역변수 변환
			// SqlSessionFactoryBuilder : mybatis 설정 파일 바탕으로 sqlSessionFactory 생성
//			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}
	
	// 반환을 위한 public 메소드, 다른곳에서 접근 가능하도록 public
	// DAO(class)에서 사용
	public static SqlSessionFactory getSqlSession() {
		return sqlSessionFactory;
	}
	
}
