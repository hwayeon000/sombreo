<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	    
    <header>
        <jsp:include page="./common/header.jsp"/>
    </header>


	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('images/bg-01.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			What is Sombrero?
		</h2>
	</section>	


	<!-- Content page -->
	<section class="bg0 p-t-75 p-b-120">
		<div class="container">
			<div class="row p-b-148">
				<div class="col-md-7 col-lg-8">
					<div class="p-t-7 p-r-85 p-r-15-lg p-r-0-md">
						<h3 class="mtext-111 cl2 p-b-16" style="font-size: 80px">
							Our Story
						</h3>

						<p class="stext-113 cl6 p-b-26" style="font-size: 30px">
저희 일생일대는 도전해보고 싶은 취미가 있지만 경제적 <br>
여건, 공간적 제약 등의 사유 때문에 시도하지 못하는 <br>
고객들을 위하여 개발됐습니다. 많은 제약 때문에 <br>
시도해보지 못한 취미들을 지금바로 시도해보세요!
	</p>
					</div>
				</div>

				<div class="col-11 col-md-5 col-lg-4 m-lr-auto">
					<div class="how-bor1 ">
						<div class="hov-img0">
							<img src="images/about-01.jpg" alt="IMG">
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="order-md-2 col-md-7 col-lg-8 p-b-30">
					<div class="p-t-7 p-l-85 p-l-15-lg p-l-0-md">
						<h3 class="mtext-111 cl2 p-b-16" style="font-size: 80px">
							Our Mission
						</h3>

						<p class="stext-113 cl6 p-b-26" style="font-size: 30px">
						일생일대는 고객들에게 시중가보다 높은 가격으로 중고 물건을 매입하여 다시 고객들에게 저렴한 가격으로 물건을 대여하고 있습니다.
						</p>

						<div class="bor16 p-l-29 p-b-9 m-t-22">
						
							<span class="stext-111 cl8" style="font-size: 20px">
								- from sombrero
							</span>
						</div>
					</div>
				</div>

				<div class="order-md-1 col-11 col-md-5 col-lg-4 m-lr-auto p-b-30">
					<div class="how-bor2">
						<div class="hov-img0">
							<img src="images/about-02.jpg" alt="IMG">
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>	
	
	<!-- Footer -->
    <footer>
        <jsp:include page="./common/footer.jsp"/>
    </footer>

<script src="js/main.js"></script>
</body>
</html>