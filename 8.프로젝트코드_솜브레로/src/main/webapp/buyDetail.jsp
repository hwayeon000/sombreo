<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.som.model.SaleVO"%>
<%@page import="com.som.model.SaleDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Contact</title>
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
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->


</head>
<body>

<body>
	
	
	
    <header>
        <jsp:include page="./common/header.jsp"/>
    </header>
    
    <%
   
    int sale_seq = Integer.parseInt(request.getParameter("sale_seq"));
    System.out.println(sale_seq);
    SaleDAO dao = new SaleDAO();
    SaleVO vo = dao.detailSale(sale_seq);
    System.out.print(vo.getSale_photo());
       %>
	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('images/bg-01.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			판매자 등록 제품 매입
		</h2>
	</section>	


	<!-- Content page -->
	<section class="bg0 p-t-104 p-b-116">
		<div class="container">
			<div class="flex-w flex-tr">


				<div class="size-210 bor10 flex-w flex-col-m p-lr-93 p-tb-30 p-lr-15-lg w-full-md">
					<!-- div안에 제품 사진 올라갈 곳 -->
					<img src="./file/<%=vo.getSale_photo()%>" width="500PX">
				</div>
								<div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">
					<form>
						<h4 class="mtext-105 cl2 txt-center p-b-30" style="font-size:30pt">
							매입여부
						</h4>

						<div class="bor8 m-b-30">
							<span class="stext-111 cl2 plh3 size-120 p-lr-28 p-tb-25" style="font-size:18pt">품명 : <%=vo.getSale_name() %></span>
							
						</div>

						<div class="bor8 m-b-30">
							<span class="stext-111 cl2 plh3 size-120 p-lr-28 p-tb-25" style="font-size:18pt">내용 : <%=vo.getSale_content() %></span>
						</div>
						<div class="bor8 m-b-30">
							<span class="stext-111 cl2 plh3 size-120 p-lr-28 p-tb-25" style="font-size:18pt">희망가격 : <%=vo.getSale_price() %></span>
						</div>
						<div class="bor8 m-b-30">
							<span class="stext-111 cl2 plh3 size-120 p-lr-28 p-tb-25" style="font-size:18pt">반품희망여부 : <%=vo.getSale_check() %></span>
						</div>

						<!-- 매입 서비스 연결 -->
						<a href="SaleStatusService.do?sale_seq=<%=vo.getSale_seq()%>&sale_return=매입" class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer" style="font-size:18pt">매입</a>
						
						<br>
						<!-- 반려 서비스 연결 -->
						<a href="SaleStatusService.do?sale_seq=<%=vo.getSale_seq()%>&sale_return=반품" class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer" style="font-size:18pt">반품</a>
						<br>
						<a href="SaleStatusService.do?sale_seq=<%=vo.getSale_seq()%>&sale_return=폐기" class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer" style="font-size:18pt">폐기</a>
						
					</form>
				</div>
			</div>
		</div>
	</section>	
	
	



    <footer>
        <jsp:include page="./common/footer.jsp"/>
    </footer>


</body>
</html>