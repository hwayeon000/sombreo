<%@page import="com.som.model.UsersVO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.som.model.CartDAO"%>
<%@page import="com.som.model.CartVO"%>
<%@page import="java.util.List"%>
<%@ include file="./common/header.jsp" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>shopping Cart</title>
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
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
	<!-- 결제 기능 위해 추가 -->
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<script src="http://code.jquery.com/jquery-3.1.0.js"></script>

</head>
<body class="animsition">

	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="index.jsp" class="stext-109 cl8 hov-cl1 trans-04">
				일생일대
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				장바구니
			</span>
		</div>
	</div>
		
		<%total_price = 0; %>

	<!-- shopping Cart -->
	<form class="bg0 p-t-75 p-b-85">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
					<div class="m-l-25 m-r--38 m-lr-0-xl">
						<div class="wrap-table-shopping-cart">
							<table class="table-shopping-cart">
								<tr class="table_head">
									<th class="column-1">Product</th>
									<th class="column-2"></th>
									<th class="column-3">Quantity</th>
									<th class="column-4">Period</th>
									<th class="column-5">Total</th>
									<th class="column-6">Delete</th>
									<!-- 삭제 추가, main.css 부분 수정 -->
								</tr>
								<% if(user_seq == 0 || list.size()==0){ %>
									<tr align="center" height="300px"><td colspan="6">상품을 추가해 주세요.</td></tr>
								<% } else { %>
								<%for(CartVO a: list) {
									System.out.println(a.getProduct_name());
									product_price = a.getProduct_price();
									product_quantity = a.getCart_quantity();
									product_period = a.getCart_period();
									total_price += product_price*product_quantity*(product_period/7);
									System.out.println("check!!!:" + (product_price * product_quantity));
									StringBuffer rb = new StringBuffer(); %>
								<tr class="table_row">
									<td class="column-1">
										<div class="how-itemcart1">
											<img src="<%=a.getPhoto_path().split(";")[0] %>" alt="IMG">
										</div>
									</td>
									<td class="column-2"><%=a.getProduct_name() %></td>
									<td class="column-3"><%=formatter.format(product_quantity) %></td>
									<td class="column-4">
										<div>
											<div>
												<select class="js-select2" name="time" onchange="changeValue(this)">
													<option>[필수] 대여일 선택</option>
													<% if(a.getCart_period() == 7){ %>
														<option value="7" selected="selected">일주일( 7일 ) : <%=formatter.format(product_price) %></option>
													<%} else { %>
														<option value="7">일주일( 7일 ) : <%=formatter.format(product_price) %></option>
													<%} %>
													<% if(a.getCart_period() == 14){ %>
														<option value="14" selected="selected">이주일( 14일 ) : <%=formatter.format(product_price*2) %></option>
													<%} else { %>
														<option value="14">이주일( 14일 ) : <%=formatter.format(product_price*2) %></option>
													<%} %>
													<% if(a.getCart_period() == 21){ %>
														<option value="21" selected="selected">삼주일( 21일 ) : <%=formatter.format(product_price*3) %></option>
													<%} else { %>
														<option value="21">삼주일( 21일 ) : <%=formatter.format(product_price*3) %></option>
													<%} %>
													<% if(a.getCart_period() == 28){ %>
														<option value="28" selected="selected">사주일( 28일 ) : <%=formatter.format(product_price*4) %></option>
													<%} else { %>
														<option value="28">사주일( 28일 ) : <%=formatter.format(product_price*4) %></option>
													<%} %>
													
													<%-- <option value="7">일주일( 7일 ) : <%=formatter.format(product_price) %></option>
													<option value="14">이주일( 14일 ) : <%=formatter.format(product_price*2) %></option>
													<option value="21">삼주일( 21일 ) : <%=formatter.format(product_price*3) %></option>
													<option value="28">사주일( 28일 ) : <%=formatter.format(product_price*4) %></option> --%>
												</select>
												<div class="dropDownSelect2"></div>
											</div>
										</div>
									</td>
									<td class="column-5"><%=formatter.format(product_price*product_quantity*(product_period/7)) %></td>
									<td class="column-6"><a href="DeleteCart.do?cart_seq=<%=a.getCart_seq() %>">삭제</a></td>
								</tr>
								<% } 
								} %>
							</table>
						</div>

						<div class="flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm">
							<div class="flex-w flex-m m-r-20 m-tb-5">
								<input class="stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-r-10 m-tb-5" type="text" name="coupon" placeholder="Coupon Code">
									<!-- 추후 구현 예정이라 합싀다.. -->
								<div class="flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5">
									Apply coupon
								</div>
							</div>

						</div>
					</div>
				</div>

				<div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
					<div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
						<h4 class="mtext-109 cl2 p-b-30">
							Cart Totals
						</h4>

						<div class="flex-w flex-t bor12 p-b-13">
							<div class="size-208">
								<span class="stext-110 cl2">
									Total:
								</span>
							</div>

							<div class="size-209">
								<span class="mtext-110 cl2">
									<%=total_price %>
								</span>
							</div>
							<br>
						</div>
						<%if(user_seq<1){ %>
						<div class="flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10">
							<!-- 결제 페이지로 이동 -->
							<a href="#">로그인 필수</a>
						</div>
						
						<%} else { %>
						<div class="flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10">
							<!-- 결제 페이지로 이동 -->
							<a href="approved.jsp">결제하기</a>
						</div>
						<%} %>
					</div>
				</div>
			</div>
		</div>
	</form>
		


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

<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->

	<script src="js/main.js"></script>
	<script src="js/approved.js"></script>

</body>
</html>