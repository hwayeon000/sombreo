package com.som.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.som.db.SqlSessionManager;

public class ProductDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	// 상품 seq로 상품 정보 가져오기
	public ProductVO getProductDetail(int product_seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductVO list = sqlSession.selectOne("com.som.db.ProductMapper.getProductDetail", product_seq);
		sqlSession.close();
		
		return list;
	}

	// 상품 정보 불러오기
	public List<ProductVO> showProduct() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<ProductVO> productList = sqlSession.selectList("showProducts");
		sqlSession.close();
		
		return productList;
	}
	
	// 상품 카테고리 불러오기
	public ProductVO getCateDepth1(int cate_seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductVO cate_depth1 = sqlSession.selectOne("getCateDepth1", cate_seq);
		sqlSession.close();
		
		return cate_depth1;
	}
	
	// 상품 사진 경로 불러오기
	public List<ProductVO> getPhotoPath(int photo_seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<ProductVO> photo_path = sqlSession.selectList("getPhotoPath",photo_seq);
		sqlSession.close();
		
		return photo_path;
	}
	
	// 상품 카테고리랑 같이 출력
	public List<ProductVO> adminShowProduct() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<ProductVO> productList = sqlSession.selectList("adminShowProduct");
		sqlSession.close();
		
		return productList;
	}
	
	
	
}
