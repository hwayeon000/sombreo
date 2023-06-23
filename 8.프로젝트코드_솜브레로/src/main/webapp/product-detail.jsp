<%@page import="com.som.model.UsersDAO"%>
<%@page import="java.util.Random"%>
<%@page import="com.som.model.UsersVO"%>
<%@page import="com.som.model.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.som.model.ReviewVO"%>
<%@page import="com.som.model.ReviewDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.som.model.ProductVO"%>
<%@ include file="./common/header.jsp" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Product Detail</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
<script src="http://code.jquery.com/jquery-3.1.0.js"></script>
</head>
<body class="animsition">
	<!--상품 정보 가져오기 -->
	<%
	
		
		if(login_vo != null){
			System.out.print(login_vo.getUser_id());
			user_seq = login_vo.getUser_seq();
			user_nick = login_vo.getUser_nick(); 
		};
		
		int product_seq = Integer.parseInt(request.getParameter("product_seq"));
		
		//ProductVO vo = (ProductVO)session.getAttribute("get_product_detail");
		ProductDAO p_dao = new ProductDAO();
		ProductVO vo = p_dao.getProductDetail(product_seq);

		String product_name = vo.getProduct_name();
		String[] product_content = vo.getProduct_content().split(";");
		String[] p_photo = null;
		p_photo = vo.getPhoto_path().split(";");
		product_price = vo.getProduct_price();
	%>
	
	<!-- Header -->
	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="index.jsp" class="stext-109 cl8 hov-cl1 trans-04">
				일생일대
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<a href="product.jsp" class="stext-109 cl8 hov-cl1 trans-04">
				상품
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				<%=product_name %>
			</span>
		</div>
	</div>
	
	<!-- Product Detail -->
	<section class="sec-product-detail bg0 p-t-65 p-b-60">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-7 p-b-30">
					<div class="p-l-25 p-r-30 p-lr-0-lg">
						<div class="wrap-slick3 flex-sb flex-w">
							<div class="wrap-slick3-dots"></div>
							<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>
							
							<div class="slick3 gallery-lb">
								<%for(String a:p_photo){ 
								%>
								<div class="item-slick3" data-thumb="<%=a%>">
									<div class="wrap-pic-w pos-relative">
										<img src="<%=a%>" alt="IMG-PRODUCT">

										<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="<%=a%>">
											<i class="fa fa-expand"></i>
										</a>
									</div>
								</div>
								<%} %>
								
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-md-6 col-lg-5 p-b-30">
					<div class="p-r-50 p-t-5 p-lr-0-lg">
						<h4 class="mtext-105 cl2 js-name-detail p-b-14">
							<%=product_name %><br>
							<%=product_content[0] %>
						</h4>

						<span class="mtext-106 cl2">
							<%=product_price %>원
						</span>

						<p class="stext-102 cl3 p-t-23">
							<%=product_content[1] %>
						</p>
						
						<!--  -->
					<!-- <form action="#" name="form" id="form" method="post"> -->
						<div class="p-t-33">
							<!-- 기간 설정 -->
							<div class="flex-w flex-r-m p-b-10">
								<div class="size-203 flex-c-m respon6">
								<input type="hidden" id="user_seq" name="user_seq" value="<%=user_seq%>">
								<input type="hidden" id="prod_seq" name="prod_seq" value="<%=product_seq%>">
								<input type="hidden" id="rental_period" name="rental_period" value="">
								<input type="hidden" id="rental_quantity" name="rental_quantity" value="">
									대여일
								</div>

								<div class="size-204 respon6-next">
									<div class="rs1-select2 bor8 bg0">
										<select class="js-select2" name="time" onchange="changeValue(this)">
											<option>[필수] 대여일을 선택해 주세요.</option>
											<option value="7">일주일( 7일 ) : <%=formatter.format(product_price) %></option>
											<option value="14">이주일( 14일 ) : <%=formatter.format(product_price*2) %></option>
											<option value="21">삼주일( 21일 ) : <%=formatter.format(product_price*3) %></option>
											<option value="28">사주일( 28일 ) : <%=formatter.format(product_price*4) %></option>
										</select>
										<div class="dropDownSelect2"></div>
									</div>
								</div>
							</div>

							<div class="flex-w flex-r-m p-b-10">
								<div class="size-204 flex-w flex-m respon6-next">
									<div class="wrap-num-product flex-w m-r-20 m-tb-10">
										<div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-minus"></i>
										</div>

										<input class="mtext-104 cl3 txt-center num-product" type="number" name="num-product" value="1">

										<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-plus"></i>
										</div>
									</div>
									<%if(user_seq<1){ %>
									<button class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail">
										로그인을 해주세요
									</button>
									<%}else{ %>
									<button class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail" id="addToCart" onclick="change()">
										Add to cart
									</button>
									<%} %>
								</div>
							</div>	
						</div>
					<!-- </form> -->
						<!--  -->
						<div class="flex-w flex-m p-l-100 p-t-40 respon7">
							<div class="flex-m bor9 p-r-10 m-r-11">
								<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100" data-tooltip="Add to Wishlist">
									<i class="zmdi zmdi-favorite"></i>
								</a>
							</div>

							<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Facebook">
								<i class="fa fa-facebook"></i>
							</a>

							<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Twitter">
								<i class="fa fa-twitter"></i>
							</a>

							<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Google Plus">
								<i class="fa fa-google-plus"></i>
							</a>
						</div>
					</div>
				</div>
			</div>

			<div class="bor10 m-t-50 p-t-43 p-b-40">
				<!-- Tab01 -->
				<div class="tab01">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item p-b-10">
							<a class="nav-link active" data-toggle="tab" href="#description" role="tab">Description</a>
						</li>

						<li class="nav-item p-b-10">
							<a class="nav-link" data-toggle="tab" href="#information" role="tab">Additional information</a>
						</li>
<!-- ========================================================================== --> 
						<%
						// 리뷰 정보 가져오기
						List<ReviewVO> rev_info = new ReviewDAO().getReviews(product_seq);
						
						int r_vo_size = rev_info.size();
						%>
						<li class="nav-item p-b-10">
							<a class="nav-link" data-toggle="tab" href="#reviews" role="tab">Reviews (<%=r_vo_size %>)</a>
						</li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content p-t-43">
						<!-- - -->
						<div class="tab-pane fade show active" id="description" role="tabpanel">
							<div class="how-pos2 p-lr-15-md">
								<p class="stext-102 cl6">
									<%=product_content[2] %>
								</p>
							</div>
						</div>

						<!-- - -->
						<div class="tab-pane fade" id="information" role="tabpanel">
							<div class="row">
								<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
									<ul class="p-lr-28 p-lr-15-sm">
									<p>배송정보</p>
										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												배송 방법
											</span>

											<span class="stext-102 cl6 size-206">
												HY 프레딧 배송, 택배 배송
											</span>
										</li>
										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												배송 지역
											</span>

											<span class="stext-102 cl6 size-206">
												전국
											</span>
										</li>
										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												배송 비용
											</span>

											<span class="stext-102 cl6 size-206">
												3,000원
											</span>
										</li>
										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												도서산간 추가 배송비
											</span>

											<span class="stext-102 cl6 size-206">
												3,000원
											</span>
										</li>
										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												배송 예정일
											</span>

											<span class="stext-102 cl6 size-206">
												- 평일 기준 출고 후 1~2일 소요 (관할 지역 택배사 사정에 따라 추가 소요될 수 있음)<br>
												- 천재지변, 물량 급증, 수급 변동 등 예외적인 사유 발생 시, 배송이 지연될 수 있는 점 양해 부탁드립니다<br>
												- 군부대 일부와 해외의 경우 배송이 어려울 수 있습니다<br>
												- 평일 낮 12시 이전 결제 시 : 당일 출고 (주말 및 공휴일 제외)<br>
												- 평일 낮 12시 이후 결제 시 : 다음날 출고 (주말 및 공휴일 제외)
											</span>
										</li>

										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												교환/반품 안내
											</span>

											<span class="stext-102 cl6 size-206">
												- 단순 변심에 의한 교환 / 반품은 제품 수령 후 7일까지 가능하며 왕복 배송비는 고객부담입니다.<br>
												- 상세주소 미입력, 주소지 오기재 등으로 인해 상품이 반송될 경우 왕복 배송비는 고객 부담입니다.<br>
												- 고객 사유로 인한 교환/반품/반송 시 왕복 배송비 6,000원이 발생하며 제주 및 도서산간 지역의 경우 실제 왕복 배송비가 부과됩니다.<br>
												- 상품 불량 및 오배송 등으로 인한 귀책 사유가 있을 경우, 교환/반품 배송비는 송브레로가 부담합니다.<br>
											</span>
										</li>

										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												교환/반품 제한사항
											</span>

											<span class="stext-102 cl6 size-206">
												- 제품 소비에 의해 제품의 가치가 현저히 감소한 경우<br>
												- 구성품의 분실, 누락, 파손 혹은 사용이 어려울 정도로 훼손되어 제품의 가치가 현저히 감소한 경우
											</span>
										</li>

									</ul>
								</div>
							</div>
						</div>

	<!-- ================================== 리뷰 ================================== -->
						
						<div class="tab-pane fade" id="reviews" role="tabpanel">
							<div class="row">
								<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
									<div class="p-b-30 m-lr-15-sm">
										<!-- Review -->
										<%
										List<UsersVO> user_seq_list = new ArrayList<>();
										user_seq_list = new UsersDAO().getReviewUser(product_seq);
										for(ReviewVO re: rev_info){
										int rev_num = re.getReview_check();
										%>
										<div class="flex-w flex-t p-b-68">
											<div class="wrap-pic-s size-109 bor0 of-hidden m-r-18 m-t-6">
												<img alt="이미지" src="./file/<%=re.getReview_photo()%>"><br>
												<a href="./file/<%=re.getReview_photo()%>" download>다운로드</a>
											</div>
											
											<div class="size-207">
												<div class="flex-w flex-sb-m p-b-17">
													<span class="mtext-107 cl2 p-r-20">
														<%=re.getUser_nick() %>
													</span>

													<span class="fs-18 cl11">
													<%for(int i=0; i<rev_num; i++) { %>
														<i class="zmdi zmdi-star"></i>
													<%} %>
													<%for(int i=0; i<5-rev_num; i++) { %>
														<i class="item-rating pointer zmdi zmdi-star-outline"></i>
													<%} %>
													</span>
												</div>

												<p class="stext-102 cl6">
													<%=re.getReview_content() %>
												</p>
											</div>
										</div>
										
										<%} %>
<!-- ==================================  Add review  ================================== -->
										<form action="ReviewService.do" class="w-full" method="post" enctype="multipart/form-data">
											<h5 class="mtext-108 cl2 p-b-7">
												Add a review
											</h5>

											<p class="stext-102 cl6">
												Your email address will not be published. Required fields are marked *
											</p>

											<div class="flex-w flex-m p-t-50 p-b-23">
												<span class="stext-102 cl3 m-r-16">
													Your Rating
												</span>

												<span class="wrap-rating fs-18 cl11 pointer">
													<i class="item-rating pointer zmdi zmdi-star-outline"></i>
													<i class="item-rating pointer zmdi zmdi-star-outline"></i>
													<i class="item-rating pointer zmdi zmdi-star-outline"></i>
													<i class="item-rating pointer zmdi zmdi-star-outline"></i>
													<i class="item-rating pointer zmdi zmdi-star-outline"></i>
													<input class="dis-none" type="number" name="rating">
												</span>
											</div>
											
											<div class="row p-b-25">
												<div class="col-12 p-b-5">
													<label class="stext-102 cl3" for="review">Your review</label>
													<textarea class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10" id="review" name="review"></textarea>
												</div>

												<div class="col-sm-6 p-b-5">
													<label class="stext-102 cl3" for="name">Name</label>
													<%if(user_seq>0){ %>
														<span><%=user_nick %></span>
														<input class="size-111 bor8 stext-102 cl2 p-lr-20" id="name" type="hidden" name="name" value="<%=user_nick%>">
														<input class="size-111 bor8 stext-102 cl2 p-lr-20" id="product_seq" type="hidden" name="product_seq" value="<%=product_seq%>">
														<input class="size-111 bor8 stext-102 cl2 p-lr-20" id="user_seq" type="hidden" name="user_seq" value="<%=user_seq%>">
													<%} else { %>
														<span>비회원</span>
													<%} %>
												</div>
												
												
												<div class="col-sm-6 p-b-5">
													<label class="stext-102 cl3" for="email">후기사진</label>
													<input name="filename" type="file">
												</div>
												<%
												int[] seqCheck = new int[user_seq_list.size()];
												for(int i = 0;i<user_seq_list.size();i++){
													seqCheck[i]=user_seq_list.get(i).getUser_seq();
												}
												
												boolean isExists = false;
												
												 for (int num : seqCheck) {
											         if (num == user_seq)
											        	 isExists = true;
											      }
												
												if(isExists){
												%>
												
												<div class="col-sm-6 p-b-5">
													<button type="reset" class="flex-c-m stext-101 cl0 size-112 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10">
														초기화
													</button>
												</div>
												
												<div class="col-sm-6 p-b-5">
													<button type="submit" class="flex-c-m stext-101 cl0 size-112 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10">
														작성하기
													</button>
												</div>
												
												<%} else { %>
													<div class="col-sm-6 p-b-5">
														<input type="hidden">
													</div>
													<div class="col-sm-6 p-b-5">
														<button disabled="disabled" class="flex-c-m stext-101 cl0 size-112 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10">
															대여 후 이용해 주세요.
														</button>
													</div>
												<%} %>

											</div>
										</form>
										
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="bg6 flex-c-m flex-w size-302 m-t-73 p-tb-15">
			<span class="stext-107 cl6 p-lr-25">
				Product: <%=product_name %>
			</span>
			
			<span class="stext-107 cl6 p-lr-25">
				By. 송브레로 ( Songbrero ) 
			</span>
		</div>
	</section>


<!-- 추천 영역 시작 -->
		<%
			List<ProductVO> productList = new ProductDAO().showProduct();
			Random rd = new Random();
			int[] r_list = new int[8];
			List<ProductVO> suggestProductList = new ArrayList<>();
			
			for(int i = 0; i<8; i++){
				r_list[i] = rd.nextInt(productList.size());
				
				for(int k = 0; k<i; k++){
					if(r_list[i] == r_list[k]){
						i--;
					}
				}
			}
			
			for(int i=0; i<8; i++){
				suggestProductList.add(productList.get(r_list[i]));
			}
		%>
	<!-- Related Products -->
	<section class="sec-relate-product bg0 p-t-45 p-b-105">
		<div class="container">
			<div class="p-b-45">
				<h3 class="ltext-106 cl5 txt-center">
					<%=user_nick %>님을 위한 추천 상품
				</h3>
			</div>

			<!-- Slide2 -->
			<div class="wrap-slick2">
				<div class="slick2">
				
				<%for(ProductVO p : suggestProductList){ 
				String[] pho = p.getPhoto_path().split(";");
				%>
					<div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15">
						<!-- Block2 -->
						<div class="block2">
							<div class="block2-pic hov-img0"  style="height: 300px; width: auto;">
								<img src="<%=pho[0] %>" alt="IMG-PRODUCT" style="position: absolute; width: 100%; top: 50%; left: 50%; transform: translate(-50%, -50%);">

								<a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
									Quick View
								</a>
							</div>

							<div class="block2-txt flex-w flex-t p-t-14">
								<div class="block2-txt-child1 flex-col-l ">
									<a href="product-detail.jsp" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
										<%=p.getProduct_name() %>
									</a>

									<span class="stext-105 cl3">
										<%=formatter.format(p.getProduct_price()) %>
									</span>
								</div>

								<div class="block2-txt-child2 flex-r p-t-3">
									<a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
										<img class="icon-heart1 dis-block trans-04" src="images/icons/icon-heart-01.png" alt="ICON">
										<img class="icon-heart2 dis-block trans-04 ab-t-l" src="images/icons/icon-heart-02.png" alt="ICON">
									</a>
								</div>
							</div>
						</div>
					</div>
					<%} %>
					
				</div>
			</div>
		</div>
	</section>
		

	<!-- Footer -->
    <footer>
        <jsp:include page="./common/footer.jsp"/>
    </footer>


	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

	<!-- Modal1 -->
	<div class="wrap-modal1 js-modal1 p-t-60 p-b-20">
		<div class="overlay-modal1 js-hide-modal1"></div>

		<div class="container">
			<div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent">
				<button class="how-pos3 hov3 trans-04 js-hide-modal1">
					<img src="images/icons/icon-close.png" alt="CLOSE">
				</button>

				<div class="row">
					<div class="col-md-6 col-lg-7 p-b-30">
						<div class="p-l-25 p-r-30 p-lr-0-lg">
							<div class="wrap-slick3 flex-sb flex-w">
								<div class="wrap-slick3-dots"></div>
								<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

								<div class="slick3 gallery-lb">
									<div class="item-slick3" data-thumb="images/product-detail-01.jpg">
										<div class="wrap-pic-w pos-relative">
											<img src="images/product-detail-01.jpg" alt="IMG-PRODUCT">

											<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="images/product-detail-01.jpg">
												<i class="fa fa-expand"></i>
											</a>
										</div>
									</div>

									<div class="item-slick3" data-thumb="images/product-detail-02.jpg">
										<div class="wrap-pic-w pos-relative">
											<img src="images/product-detail-02.jpg" alt="IMG-PRODUCT">

											<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="images/product-detail-02.jpg">
												<i class="fa fa-expand"></i>
											</a>
										</div>
									</div>

									<div class="item-slick3" data-thumb="images/product-detail-03.jpg">
										<div class="wrap-pic-w pos-relative">
											<img src="images/product-detail-03.jpg" alt="IMG-PRODUCT">

											<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="images/product-detail-03.jpg">
												<i class="fa fa-expand"></i>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-md-6 col-lg-5 p-b-30">
						<div class="p-r-50 p-t-5 p-lr-0-lg">
							<h4 class="mtext-105 cl2 js-name-detail p-b-14">
								Lightweight Jacket
							</h4>

							<span class="mtext-106 cl2">
								$58.79
							</span>

							<p class="stext-102 cl3 p-t-23">
								Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.
							</p>
							
							<!--  -->
							<div class="p-t-33">
								<div class="flex-w flex-r-m p-b-10">
									<div class="size-203 flex-c-m respon6">
										Size
									</div>

									<div class="size-204 respon6-next">
										<div class="rs1-select2 bor8 bg0">
											<select class="js-select2" name="time">
												<option>Choose an option</option>
												<option>Size S</option>
												<option>Size M</option>
												<option>Size L</option>
												<option>Size XL</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
									</div>
								</div>

								<div class="flex-w flex-r-m p-b-10">
									<div class="size-203 flex-c-m respon6">
										Color
									</div>

									<div class="size-204 respon6-next">
										<div class="rs1-select2 bor8 bg0">
											<select class="js-select2" name="time">
												<option>Choose an option</option>
												<option>Red</option>
												<option>Blue</option>
												<option>White</option>
												<option>Grey</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
									</div>
								</div>

								<div class="flex-w flex-r-m p-b-10">
									<div class="size-204 flex-w flex-m respon6-next">
										<div class="wrap-num-product flex-w m-r-20 m-tb-10">
											<div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
												<i class="fs-16 zmdi zmdi-minus"></i>
											</div>

											<input class="mtext-104 cl3 txt-center num-product" type="number" name="num-product" min="0" max="<%=10 %>">

											<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
												<i class="fs-16 zmdi zmdi-plus"></i>
											</div>
										</div>

										<button class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail">
											Add to cart
										</button>
									</div>
								</div>	
							</div>

							<!--  -->
							<div class="flex-w flex-m p-l-100 p-t-40 respon7">
								<div class="flex-m bor9 p-r-10 m-r-11">
									<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100" data-tooltip="Add to Wishlist">
										<i class="zmdi zmdi-favorite"></i>
									</a>
								</div>

								<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Facebook">
									<i class="fa fa-facebook"></i>
								</a>

								<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Twitter">
									<i class="fa fa-twitter"></i>
								</a>

								<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Google Plus">
									<i class="fa fa-google-plus"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!--===============================================================================================-->
	<script src="vendor/slick/slick.min.js"></script>
	<script src="js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<script>
		$('.gallery-lb').each(function() { // the containers for all your galleries
			$(this).magnificPopup({
		        delegate: 'a', // the selector for gallery item
		        type: 'image',
		        gallery: {
		        	enabled:true
		        },
		        mainClass: 'mfp-fade'
		    });
		});
	</script>
<!--===============================================================================================-->
	<script src="vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
	<script src="js/cart.js"></script>
		<script>
	
	const change = () => {
		console.log("check change");
		
		var user_seq = document.getElementById('user_seq').value;
		var product_seq = document.getElementById('prod_seq').value;
		console.log(user_seq + ", " + product_seq);
		
		// 로그인이 되어 있지 않으면
		if(user_seq<1){
			var answer1 = confirm("로그인이 필요한 서비스 입니다.\n로그인페이지로 이동하시겠습니까?");
			if(answer1){
				location="login.jsp";
			} else if (theFrom.num-product.value<1){
					confirm("하나 이상 선택해 주세요.");
			} else{
				console.log("페이지 이동 취소")
			}
		}else {
			const num = document.getElementsByClassName("num-product")[0];
			rental_quantity = num.value;
			console.log(num.value);
			const price = document.getElementsByClassName("mtext-106 cl2")[0];
			product_price = price.innerHTML;
			
			console.log("가격:" + price.innerHTML);
			console.log(rental_period+", "+rental_quantity +","+ product_price + ","+product_seq);
			
			var answer = confirm("장바구니에 물품이 담겼습니다. 장바구니로 이동하시겠습니까?");
			if(answer){
				location.href="InsertCart.do?rental_period="+rental_period+"&rental_quantity="+rental_quantity + "&product_price="+product_price+"&product_seq="+product_seq+"&user_seq="+user_seq;
				
			}else{
				/*장바구니 업데이트만*/
				location.href="InsertCart.do?rental_period="+rental_period+"&rental_quantity="+rental_quantity + "&product_price="+product_price+"&product_seq="+product_seq+"&user_seq="+user_seq+"&check="+"true";		
				
				console.log("장바구니 이동 취소")
			}
		}
		
	}

	</script>
	
	
	
</body>
</html>