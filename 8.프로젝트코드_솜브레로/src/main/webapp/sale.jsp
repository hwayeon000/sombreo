<%@page import="com.som.model.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/sale.css">
</head>
<body>
	<%
		UsersVO login_vo = (UsersVO)session.getAttribute("login_vo");
		if(login_vo == null){
			response.sendRedirect("login.jsp");
		}
	%>

	<header>
		<jsp:include page="./common/header.jsp" />
	</header>
	<div id="salePage">
	<div id="saleDiv">

		<div id="saleForm">
			<!-- 매매 요청 입력 공간 -->
			<form action="SaleService.do" method="post"
				enctype="multipart/form-data">
				<table id="saleTable">
					<tr class="cateTr">
						<th>카테고리</th>
						<td>
						<select id="selectCate1" name="cate_depth1" onchange="categoryChange(this)">
							<option>카테고리를 선택해주세요</option>
							<option value="100">캠핑</option>
							<option value="200">등산</option>
							<option value="300">낚시</option>
							<option value="400">스포츠</option>
							<option value="500">여행</option>
						</select>
						
						<select id="selectCate2" name="cate_depth2">
							<option>물품을 선택해주세요</option>
						</select>
													
							</td>
					</tr>

					<tr class="nameTr">
						<th>상품명</th>
						<td><input type='text' name='sale_name'></td>
					</tr>

					<tr class="priceTr">
						<th>희망가격</th>
						<td><input type='text'
							onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
							name='sale_price' style="display: inline">원</td>
					</tr>

					<tr class="contentTr">
						<th>내용</th>
						<td><textarea name='sale_content' cols='50' rows='5'></textarea>
						</td>
					</tr>

					<tr class="photoTr">
						<th>
							<!-- 			<input type="file" accept="image/*" name='sale_photo' id="salePhotoID"> -->
							<!-- 				<button id="imgBtn">사진 업로드</button> --> <input
							type='file' accept="image/*" name='sale_photo' id="salePhotoID">
						</th>
						<td>이미지 파일을 업로드 해주세요.
							<div id="preview"></div>
						</td>
					</tr>


					<tr class="accountTr">
						<th>정산 계좌</th>
						<td>
							<table id="account">
								<tr>
									<td>은행</td>
									<td><select name="sale_bank" id="saleBankID"><option
												value="">선택하세요</option>
											<option value="경남은행">경남은행</option>
											<option value="광주은행">광주은행</option>
											<option value="국민은행">국민은행</option>
											<option value="기업은행">기업은행</option>
											<option value="농협">농협</option>
											<option value="대구은행">대구은행</option>
											<option value="도이치뱅크">도이치뱅크</option>
											<option value="부산은행">부산은행</option>
											<option value="산업은행">산업은행</option>
											<option value="상호저축은행">상호저축은행</option>
											<option value="새마을금고">새마을금고</option>
											<option value="수협중앙회">수협중앙회</option>
											<option value="신용협동조합">신용협동조합</option>
											<option value="신한은행">신한은행</option>
											<option value="외환은행">외환은행</option>
											<option value="우리은행">우리은행</option>
											<option value="우체국">우체국</option>
											<option value="전북은행">전북은행</option>
											<option value="제주은행">제주은행</option>
											<option value="카카오뱅크">카카오뱅크</option>
											<option value="케이뱅크">케이뱅크</option>
											<option value="토스뱅크">토스뱅크</option>
											<option value="한국씨티은행">한국씨티은행</option>
											<option value="하나은행">하나은행</option>
											<option value="HSBC">HSBC</option>
											<option value="SC제일은행">SC제일은행</option></select></td>
								</tr>

								<tr>
									<td>예금주</td>
									<td><input type='text' name='sale_acc_holder'></td>
								</tr>

								<tr>
									<td>계좌번호</td>
									<td><input type='text' name="sale_account"
										placeholder="숫자만 입력하세요"
										onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></td>
								</tr>
							</table>
						</td>
					</tr>

					<tr class="returnTr">
						<th>매입 불가 상품 처리 방법</th>
						<td><input type="radio" name="sale_check" id="dispose"
							value="폐기" style="display: inline"> <label for="dispose" style="display: inline">폐기</label> <input
							type="radio" name="sale_check" id="return" value="반송" style="display: inline"> <label
							for="return" style="display: inline">반송</label>
							<div><ul class="ulClass">
							<li> 폐기 : 매입 불가 또는 신청내역에 없는 상품은 즉시 폐기되며, 돌려받을 수 없습니다. 또한, 재활용 불가 물품은 폐기 불가능합니다 폐기불가 물품을 보내실 경우 자동으로 반송될 수 있음을 알립니다.</li>
							<li>반송 : 반송비는 고객 부담이며 별도 요청 없을 시 '발송 주소'로 반송됩니다. (반송료 - 박스당 1500원)</li></ul></div>
							
							</td>
					</tr>

					<tr class="acceptTr">
						<th>매입 약관 동의</th>
						<td><div>
								<ul class="ulClass">
									<li>신청하신 물품은 일생일대 중고 정책에 따라 매입가능 여부가 결정됩니다.</li>
									<li>매입 불가 상품 처리 방법은 접수 후 변경이 불가능합니다.<br>폐기로 선택하신 경우에
										매입 불가 또는 신청내역에 없는 상품은 즉시 폐기되므로 돌려받을 수 없습니다. <br>반송으로
										선택하셔야 돌려받을 수 있으며 반송비는 박스당 1,500원으로 정산시 차감됩니다.
									</li>
									<li>팔기 신청 상품이 배송 중 파손되거나 오염되지 않도록 안전하게 포장하여 발송해주시기 바랍니다.<br>(이동
										과정에서 파손된 상품은 매입되지 않을 수 있으며 일생일대가 책임을 지지 않습니다.)
									</li>
									<li><span>매입
											완료 상품은 '매입 취소나 반송이 불가'합니다. (매입 즉시 실시간 온라인 판매나 중고매장 이동 후 판매)</span></li>
								</ul>
							</div>
							<div id="ckDiv">
								<input name="chkClause" type="checkbox"> 
								<label for="chkClause">위의 매입 약관에 동의합니다.</label>
							</div></td>
					</tr>

					<tr class="submitTr">
					<td align="center" colspan="2">
						<div class="flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10">
							<!-- 결제 페이지로 이동 -->
							<input type="submit" value="팔기 신청 완료" style="border: 0;background-color: transparent;">
						</div>
						</td>
					</tr>



				</table>
			</form>
		</div>
	</div>
	</div>
	
	<footer>
		<jsp:include page="./common/footer.jsp" />
	</footer>


	<script src="js/main.js"></script>

	<script src="./js/sale.js" type="text/javascript"></script>
</body>
</html>