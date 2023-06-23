<%@page import="com.som.model.UsersVO"%>
<%@page import="com.som.model.CartDAO"%>
<%@page import="com.som.model.CartVO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Approved Page</title>
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

<script language="javascript">
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";

function goPopup(){
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    var pop = window.open("./jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
    
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}
/** API 서비스 제공항목 확대 (2017.02) **/
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
						, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.form.roadAddrPart1.value = roadAddrPart1;
	document.form.roadAddrPart2.value = roadAddrPart2;
	document.form.addrDetail.value = addrDetail;
	document.form.zipNo.value = zipNo;
}
</script>
<link rel="stylesheet" type="text/css" href="./css/joinInfo.css">
	<!-- 결제 기능 위해 추가 -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="http://code.jquery.com/jquery-3.1.0.js"></script>
<link rel="shortcut icon" href="#">
<style type="text/css">
	.app_table tr{
		height: 56px;
	}
</style>
</head>
<body class="animsition">

	<!-- Header -->
    <header>
        <jsp:include page="./common/header.jsp"/>
    </header>

	<%  
		DecimalFormat formatter = new DecimalFormat("###,###");
		// 사용자 정보
		int user_seq = 0;
		UsersVO login_vo = (UsersVO)session.getAttribute("login_vo");
		if(login_vo != null){
			System.out.print(login_vo.getUser_id());
			user_seq = login_vo.getUser_seq();
		};
		
		
		int total_price = 0;
		int product_price = 0;
		int product_quantity = 0;
		int product_period = 0;
		
		int peoduct_size = 0;
		List<CartVO> list = null;
		if(user_seq > 0){
			list = new CartDAO().printCart(user_seq);
			// System.out.println("seq:" + list.get(0).getCart_seq());
			peoduct_size = list.size();
		}
	%>

	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="index.jsp" class="stext-109 cl8 hov-cl1 trans-04">
				일생일대
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<a href="shopping-cart.jsp" class="stext-109 cl8 hov-cl1 trans-04">
				장바구니
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				결제 진행
			</span>
		</div>
	</div>
		

	<!-- shopping Cart -->
	<div class="bg0 p-t-75 p-b-85">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
					<div class="m-l-25 m-r--38 m-lr-0-xl">
					
					<h4 class="mtext-109 cl2 p-b-30">대여 상품 총 <%=peoduct_size %>건 </h4>
						<div class="wrap-table-shopping-cart">
							<table class="table-shopping-cart">
								<tr class="table_head">
									<th class="column-1">Product</th>
									<th class="column-2"></th>
									<th class="column-3">Quantity</th>
									<th class="column-4">Period</th>
									<th class="column-5">Total</th>
								</tr>
								<% if(user_seq == 0){ %>
									<tr align="center" height="300px"><td colspan="5">상품을 추가해 주세요.</td></tr>
								<% } else { %>
								<%for(CartVO a: list) {
									product_price = a.getProduct_price();
									product_quantity = a.getCart_quantity();
									product_period = a.getCart_period();
									total_price += product_price*product_quantity*(product_period/7);
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
										
										<% if(a.getCart_period() == 7){ %>
											일주일( 7일 ) : <%=formatter.format(product_price) %>
										<%} %>
											
										<% if(a.getCart_period() == 14){ %>
											이주일( 14일 ) : <%=formatter.format(product_price*2) %>
										<%} %>
											
										<% if(a.getCart_period() == 21){ %>
											삼주일( 21일 ) : <%=formatter.format(product_price*3) %>
										<%} %>
											
										<% if(a.getCart_period() == 28){ %>
											사주일( 28일 ) : <%=formatter.format(product_price*4) %>
										<%} %>
											
									</td>
									<td class="column-5"><%=formatter.format(product_price*product_quantity*(product_period/7)) %></td>
								</tr>
								<% } 
								} %>
							</table>
						</div>
					<br>
					<!--  -->
					<h4 class="mtext-109 cl2 p-b-30">사용자 정보 입력</h4>
						<div class="wrap-table-shopping-cart"  onload="init();">
						<!-- LoginService.do -->
						<form action="OrderService.do?order_payment=<%=total_price%>&user_seq=<%=user_seq %>" name="form" id="form" method="post">
							<table class="table-shopping-cart">
								<colgroup>
									<col style="width:25%"><col>
								</colgroup>
								<tbody class="app_table">
							
									<tr>
										<th class="column-1"><label>주문자</label></th>
										<!-- readonly="readonly"  -->
										<td class="column-3"><input type="text" id="approve_transfer_user" name="approve_transfer_user" placeholder="본인인증을 해주세요." value=""></td>
										<td class="column-4">
											<div class="flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10" style="width: 220px;">
												<a href="#" onclick="certification()">본인인증</a>
											</div>
										</td>
									</tr>
									
									<tr>
										<th class="column-1"><label>수령인</label></th>
										<td class="column-2"><input type="text" name="rental_user" placeholder="이름을 입력해 주세요"></td>
									</tr>
									
									<tr>
										<th class="column-1"><label>배송 연락처</label></th>
										<td class="column-2"><input type="text" name="rental_phone" placeholder="배송시 연락 받을 연락처"></td>
									</tr>
									
									<tr>
										<th class="column-1">우편번호</th>
										<td class="column-2">
										    <input type="hidden" id="confmKey" name="confmKey" value=""  >
											<input type="text" id="zipNo" name="zipNo" readonly style="width:100px">
										</td>
										<td>
											<div class="flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10" style="width: 220px;">
												<input type="button"  value="주소검색" onclick="goPopup();" style="background: none;">
											</div>
										</td>
									</tr>
									<tr>
										<th class="column-1">도로명주소</th>
										<td class="column-2"><input type="text" id="roadAddrPart1" style="width:85%" name="addr1"></td>
									</tr>
									<tr>
										<th class="column-1">상세주소</th>
										<td class="column-2">
											<input type="text" id="addrDetail" name="addr3" style="width:40%" value="">
											<input type="text" id="roadAddrPart2" name="addr2"  style="width:40%" value="">
										</td>
									</tr>
																		<!-- 약관 동의 -->
									<tr>
										<th class="column-1">약관 동의</th>
										<td colspan="5">
										<div id="agreeCheckArea">
											<label for="agree_all" style="margin-top: 4px;">
											  <input type="checkbox" name="agree_all" id="agree_all"  style="float: left; margin-top: 4px;">
											  <span> &nbsp;모두 동의합니다</span>
											</label>
											
											<p style="height: 6px;"></p>
											<label for="agree">
											  <input type="checkbox" name="agree" value="1" style="float: left; margin-top: 4px;">
											  <span> &nbsp;이용약관 동의<strong>(필수)</strong></span>
											</label>
											<p style="height: 6px;"></p>
											
											<label for="agree">
											  <input type="checkbox" name="agree" value="2" style="float: left; margin-top: 4px;">
											  <span style="margin-top: 4px;"> &nbsp;개인정보 수집, 이용 동의<strong>(필수)</strong></span>
											</label>
											<p style="height: 6px;"></p>
											
											<label for="agree">
											  <input type="checkbox" name="agree" value="3" style="float: left; margin-top: 4px;">
											  <span style="margin-top: 4px;"> &nbsp;개인정보 이용 동의<strong>(필수)</strong></span>
											</label>
										</div>
										</td>
									</tr>
									
									<tr>
										<td class="column-1"><span></span></td>
										<td class="column-2">
											<div class="flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10" style="width: 220px;">
												<a href="#" onclick="requestPay()">결제 하기</a>
											</div>
										</td>
										<td class="column-3">
											<div class="flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10" style="width: 220px;">
												<button type="submit">제출하기</button>
											</div>
										</td>
									</tr>


									<tr>
										<td>
											<input type="hidden" id="approve_number" name="approve_number" value=""  >
											<input type="hidden" id="approve_card" name="approve_card" value=""  >
											<input type="hidden" id="approve_price" name="approve_price" value=""  >
											<input type="hidden" id="check_approve" name="check_approve" value="false"  >
										</td>
									</tr>
									
									</tbody>
								</table>
							</form>
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
								<span class="mtext-110 cl2" id="totalPrice">
									<%=total_price %>
								</span>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
		


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
	
	
<!-- 	<script type="text/javascript">
	var checkUnload = true;
	$(window).on("beforeunload", function(e){
	    if(checkUnload) {
	    	console.log(e);
	    	return "이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다.";
	    }
	});
	
	// 단, 글쓰기 버튼을 클릭해서 글을 저장한 후 페이지를 이동할때도 저런 메시지가 뜨기 때문에, 
	// 처리 완료 후 이동 시 checkUnload 값을 false 로 바꿔준 후 submit 이나 페이지를 이동해야 함
	$("#saveBtn").on("click", function(){
	    checkUnload = false;
	    $("#saveForm").submit();
	});
	</script> -->
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
	<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
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
	<script src="js/approved.js"></script>
	<script type="text/javascript">
	// 동의 모두선택 / 해제
	const agreeChkAll = document.querySelector('input[name=agree_all]');
	    agreeChkAll.addEventListener('change', (e) => {
	    let agreeChk = document.querySelectorAll('input[name=agree]');
	    for(let i = 0; i < agreeChk.length; i++){
	      agreeChk[i].checked = e.target.checked;
	    }
	});
	</script>
</body>
</html>