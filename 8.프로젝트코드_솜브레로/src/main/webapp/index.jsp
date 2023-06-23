<%@page import="com.som.model.UsersVO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.som.model.ProductVO"%>
<%@page import="java.util.List"%>
<%@page import="com.som.model.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home</title>
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

</head>
<body class="animsition">
	<!-- Header -->
    <header>
        <jsp:include page="./common/header.jsp"/>
    </header>
	<%
		UsersVO login_vo = (UsersVO)session.getAttribute("login_vo");
		if(login_vo != null){
			System.out.print(login_vo.getUser_id());				
		}
	%>

	<!-- Slider -->
	<section class="section-slide">
		<div class="wrap-slick1">
			<div class="slick1">
				<div class="item-slick1" style="background-image: url(images/slide-44.jpg);">
					<div class="container h-full">
						<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
							<div class="layer-slick1 animated visible-false" data-appear="fadeInDown" data-delay="0">
								<span class="ltext-101 cl2 respon2" style="color: white; font-size: 100px">
									캠핑
								</span>
							</div>
								
							<div class="layer-slick1 animated visible-false" data-appear="fadeInUp" data-delay="800">
								<h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1" style="color: white">
									지금바로 떠나세요
								</h2>
							</div>
								
							<div class="layer-slick1 animated visible-false" data-appear="zoomIn" data-delay="1600">
								<a href="product.jsp" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">
									대여하기
								</a>
							</div>
						</div>
					</div>
				</div>

				<div class="item-slick1" style="background-image: url(images/slide-46.jpg);">
					<div class="container h-full">
						<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
							<div class="layer-slick1 animated visible-false" data-appear="rollIn" data-delay="0">
								<span class="ltext-101 cl2 respon2" style="color: white; font-size: 100px">
									골프
								</span>
							</div>
								
							<div class="layer-slick1 animated visible-false" data-appear="lightSpeedIn" data-delay="800">
								<h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1" style="color : white">
									지금바로 도전하세요
								</h2>
							</div>
								
							<div class="layer-slick1 animated visible-false" data-appear="slideInUp" data-delay="1600">
								<a href="product.jsp" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">
									대여하기
								</a>
							</div>
						</div>
					</div>
				</div>

				<div class="item-slick1" style="background-image: url(images/slide-33.jpg);">
					<div class="container h-full">
						<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
							<div class="layer-slick1 animated visible-false" data-appear="rotateInDownLeft" data-delay="0">
								<span class="ltext-101 cl2 respon2" style="color: white; font-size: 100px">
									바다여행
								</span>
							</div>
								
							<div class="layer-slick1 animated visible-false" data-appear="rotateInUpRight" data-delay="800">
								<h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1" style="color: white">
									지금바로 떠나세요
								</h2>
							</div>
								
							<div class="layer-slick1 animated visible-false" data-appear="rotateIn" data-delay="1600">
								<a href="product.jsp" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">
									대여하기
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<!-- Banner -->
	<div class="sec-banner bg0 p-t-80 p-b-50">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
					<!-- Block1 -->
					<div class="block1 wrap-pic-w">
						<img src="https://cdn.pixabay.com/photo/2021/01/04/10/45/tent-5887144__340.jpg" alt="IMG-BANNER">

						<a href="product.jsp" class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
							<div class="block1-txt-child1 flex-col-l">
								<span class="block1-name ltext-102 trans-04 p-b-8">
									캠핑  
								</span>

								<span class="block1-info stext-102 trans-04">
									Spring 2023
								</span>
							</div>

							<div class="block1-txt-child2 p-b-4 trans-05">
								<div class="block1-link stext-101 cl0 trans-09">
									Shop Now
								</div>
							</div>
						</a>
					</div>
				</div>

				<div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
					<!-- Block1 -->
					<div class="block1 wrap-pic-w">
						<img src="https://cdn.pixabay.com/photo/2017/12/28/18/40/windsurfing-3045927__340.jpg" alt="IMG-BANNER">

						<a href="product.jsp" class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
							<div class="block1-txt-child1 flex-col-l">
								<span class="block1-name ltext-102 trans-04 p-b-8">
									스포츠
								</span>

								<span class="block1-info stext-102 trans-04">
									Summer 2023
								</span>
							</div>

							<div class="block1-txt-child2 p-b-4 trans-05">
								<div class="block1-link stext-101 cl0 trans-09">
									Shop Now
								</div>
							</div>
						</a>
					</div>
				</div>

				<div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
					<!-- Block1 -->
					<div class="block1 wrap-pic-w">
						<img src="https://cdn.pixabay.com/photo/2018/12/10/22/57/child-fishing-3867994__340.jpg" alt="IMG-BANNER">

						<a href="product.jsp" class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
							<div class="block1-txt-child1 flex-col-l">
								<span class="block1-name ltext-102 trans-04 p-b-8" style="color: #e0e0e0;">
									낚시
								</span>

								<span class="block1-info stext-102 trans-04" style="color: #e0e0e0;">
									New Trend
								</span>
							</div>

							<div class="block1-txt-child2 p-b-4 trans-05">
								<div class="block1-link stext-101 cl0 trans-09">
									Shop Now
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Product -->
	<section class="bg0 p-t-23 p-b-140">
		<div class="container">
			<div class="p-b-10">
				<h3 class="ltext-103 cl5">
					Product Overview
				</h3>
			</div>

			<div class="flex-w flex-sb-m p-b-52">
				<div class="flex-w flex-l-m filter-tope-group m-tb-10">
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1" data-filter="*">
						All Products
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".100">
						캠핑
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".200">
						등산
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".300">
						낚시
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".400">
						스포츠
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".500">
						여행
					</button>
				</div>
					<div class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
						<i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
						<i class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
						Search
					</div>
				</div>
				
				<!-- Search product -->
				<div class="dis-none panel-search w-full p-t-10 p-b-15">
					<div class="bor8 dis-flex p-l-15">
						<button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04">
							<i class="zmdi zmdi-search"></i>
						</button>

						<input class="mtext-107 cl2 size-114 plh2 p-r-15" type="text" name="search-product" placeholder="Search">
					</div>	
				</div>

	<%
		// 상품 목록 가져오기
		ProductDAO p_dao = new ProductDAO();
		List<ProductVO> productList = p_dao.showProduct();
		
		DecimalFormat formatter = new DecimalFormat("###,###");
		String p_name = "";
		int p_price = 0;
		String[] p_content = null;
		String[] p_photo = null;
		int index = 1;
		
	%>

			<div class="row isotope-grid">
				<% for(ProductVO p : productList){%>
				<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item <%= p_dao.getCateDepth1(p.getCate_seq()).getCate_depth1() %>">
					<!-- Block2 -->
					<div class="block2">
						<div class="block2-pic hov-img0" style="height: 300px; width: auto;">
						<% int product_seq = p.getProduct_seq();
								String[] photo_path = p_dao.getPhotoPath(p.getPhoto_seq()).get(0).getPhoto_path().split(";");
							%>
							<img src=<%=photo_path[0] %> alt="IMG-PRODUCT" style="position: absolute; width: 100%; top: 50%; left: 50%; transform: translate(-50%, -50%);">
							<input type="hidden" name="d_pho1" value="<%=photo_path[0] %>">
							<input type="hidden" name="d_pho2" value="<%=photo_path[1] %>">
							<input type="hidden" name="d_pho3" value="<%=photo_path[2] %>">
							<input type="hidden" name="d_name" value="<%=p.getProduct_name() %>">
							<input type="hidden" name="d_content" value="<%=p.getProduct_content().split(";")[0] %>">
							<input type="hidden" name="d_price" value="<%=p.getProduct_price() %>"
							>

							<a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1"  onclick="callBack(<%=index %>);">
								Quick View
							</a>
						</div>

						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<a href="product-detail.jsp?product_seq=<%=product_seq %>" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
									<%= p.getProduct_name() %>
								</a>

								<span class="stext-105 cl3">
									<%= formatter.format(p.getProduct_price()) %>원
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
				<%
				index += 1;
				
				} %>
			</div>

			<!-- Load more -->
			<div class="flex-c-m flex-w w-full p-t-45">
				<a href="#" class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04">
					Load More
				</a>
			</div>
		</div>
	</section>


    <footer>
        <jsp:include page="./common/footer.jsp"/>
    </footer>

	<!-- Modal1 -->
	<!-- ================================= 퀵뷰 ================================ -->
	<!--상품 정보 가져오기 -->
	<form action="#" name="form" id="form" method="post">
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
									<div class="item-slick3 p_pho1" name="p_pho1" data-thumb="images/product-detail-01.jpg">
           								<div class="wrap-pic-w pos-relative">
							                <img id="p_pho2" src="images/product-detail-01.jpg">
							
							                <a id="p_pho3" class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="images/product-detail-01.jpg">
							                    <i class="fa fa-expand"></i>
							                </a>
							            </div>
							        </div>

									<div class="item-slick3 p_pho2" id="p_pho4" data-thumb="images/product-detail-02.jpg">
										<div class="wrap-pic-w pos-relative">
											<img id="p_pho5" src="images/product-detail-02.jpg" alt="IMG-PRODUCT">

											<a id="p_pho6" class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="images/product-detail-02.jpg">
												<i class="fa fa-expand"></i>
											</a>
										</div>
									</div>

									<div class="item-slick3 p_pho3" id="p_pho7" data-thumb="images/product-detail-03.jpg">
										<div class="wrap-pic-w pos-relative">
											<img id="p_pho8" src="images/product-detail-03.jpg" alt="IMG-PRODUCT">

											<a id="p_pho9" class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="images/product-detail-03.jpg">
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
								<input type="text" id="p_name" name="p_name" value="상품명" readonly="readonly">
							</h4>

							<span class="mtext-106 cl2">
								<input type="text" id="p_content" name="p_content" value="상품 설명..." readonly="readonly">
							</span>

							<p class="stext-102 cl3 p-t-23">
								<input type="text" id="p_price" name="p_price" value="금액" readonly="readonly">
							</p>
							
							<!--  -->
							<p class="stext-102 cl3 p-t-23">
								<input type="text" id="p_period" name="p_period" value="대여일" readonly="readonly">
							</p>
							
							<div class="size-204 respon6-next">
								<div class="rs1-select2 bor8 bg0">
									<input type="text" id="p_period1" value="가격" readonly="readonly">
									<input type="text" id="p_period2" value="가격" readonly="readonly">
									<input type="text" id="p_period3" value="가격" readonly="readonly">
									<input type="text" id="p_period4" value="가격" readonly="readonly">
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
	</form>
<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/slick/slick.min.js"></script>
	<script src="js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script src="vendor/parallax100/parallax100.js"></script>
	<script>
        $('.parallax100').parallax100();
	</script>
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
	<script src="vendor/sweetalert/sweetalert.min.js"></script>
	<script>
		$('.js-addwish-b2').on('click', function(e){
			e.preventDefault();
		});

		$('.js-addwish-b2').each(function(){
			var nameProduct = $(this).parent().parent().find('.js-name-b2').jsp();
			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-b2');
				$(this).off('click');
			});
		});

		$('.js-addwish-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').jsp();

			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-detail');
				$(this).off('click');
			});
		});

		/*---------------------------------------------*/

		$('.js-addcart-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').jsp();
			$(this).on('click', function(){
				swal(nameProduct, "is added to cart !", "success");
			});
		});
	
	</script>
<!--===============================================================================================-->
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
		<script>
	
	const callBack = (index) => {
		console.log("check callback");
		
		var d_name = document.getElementsByName("d_name")[index-1].value;
		console.log(d_name);
		var d_price = document.getElementsByName("d_price")[index-1].value;
		var d_content = document.getElementsByName("d_content")[index-1].value;
		var d_pho1 = document.getElementsByName("d_pho1")[index-1].value;
		var d_pho2 = document.getElementsByName("d_pho2")[index-1].value;
		var d_pho3 = document.getElementsByName("d_pho3")[index-1].value;
		
		document.form.p_name.value = d_name;
		document.form.p_price.value = "기본금액 : " + d_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		document.form.p_content.value = d_content;
		document.form.p_period1.value = "일주일( 7일 ) : " + d_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원";
		document.form.p_period2.value = "이주일( 14일 ) : " + (d_price*2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원";
		document.form.p_period3.value = "삼주일( 21일 ) : " + (d_price*3).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원";
		document.form.p_period4.value = "사주일( 28일 ) : " + (d_price*4).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원";
		//console.log(document.form.p_pho1.data-thumb);
                
		
        var test2 = document.querySelector('#p_pho2');
        var test3 = document.querySelector('#p_pho3');
        
        var test5 = document.querySelector('#p_pho5');
        var test6 = document.querySelector('#p_pho6');
        
        var test8 = document.querySelector('#p_pho8');
        var test9 = document.querySelector('#p_pho9');

        
        test2.src = d_pho1;
        test3.href = d_pho1;
        
        test5.src = d_pho2;
        test6.href = d_pho2;
        
        test8.src = d_pho3;
        test9.href = d_pho3;

        
        console.log(document.querySelector('.p_pho1').dataset.thumb);
        console.log(d_pho1);
        
    	$('.p_pho1').data('thumb', d_pho1);
    	$('.p_pho2').data('thumb', d_pho2);
    	$('.p_pho3').data('thumb', d_pho3);
    	console.log('data:', $('.p_pho1').data('thumb'))
    	
    	
    	console.log(document.querySelector('.slick3-dots li img'));
    	document.querySelector('div.wrap-slick3-dots > ul > li.slick-active > img').src =d_pho1;
    	document.querySelector('div.wrap-slick3-dots > ul > li:nth-child(2) > img').src = d_pho2;
    	document.querySelector('div.wrap-slick3-dots > ul > li:nth-child(3) > img').src = d_pho3;
    
		
	}

	</script>

</body>
</html>