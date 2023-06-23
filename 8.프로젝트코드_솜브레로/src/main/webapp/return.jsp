<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.som.model.returnVO"%>
<%@page import="com.som.model.returnDAO"%>
<%@page import="com.som.model.mypageVO"%>
<%@page import="java.util.List"%>
<%@page import="com.som.model.mypageDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>return</title>
<link rel="stylesheet" type="text/css" href="css/return.css">
</head>
<body>

 <header>
	<jsp:include page="./common/header.jsp" />
</header>


<div id="returnPage">
	<div id="returnPeople">
	<ul>
	
	<li><div id="r_headDiv"><h3 id="r_head">대여자 관리하기</h3></div></li>
	<%
		// 반납 예정인 사람들 목록 불러오기
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 날짜 포매팅

		returnDAO r_dao = new returnDAO();
		List<returnVO> returnList = r_dao.showAllReturn();
		int i = 1;
	%>
		<li><div id="returnTableDiv">
			<table id="returnTable">
				<tr id="titleTr"><th class="r_user">대여자</th><th class="r_product">대여 물건</th><th class="r_quantity">대여 수량</th><th class="r_start">대여 시작일</th><th class="r_period">대여 기간</th><th class="r_ex_date">반납기한</th><th class="r_num"></th></tr>
				<%for(returnVO r: returnList){ %>
					<tr class = "dataTr">
						<td class="r_user"><%=r.getUser_name() %>(<%=r.getUser_seq() %>)</td>
						<td class="r_product" align="left"><%=r.getProduct_name() %></td>
						<td class="r_quantity"><%=r.getOrder_quantity() %>개</td>
						<td class="r_start"><%=simpleDateFormat.format(r.getRental_date()) %></td>
						<td class="r_period"><%=r.getRental_period() %>일</td>
						<td class="r_ex_date"><%=simpleDateFormat.format(r.getReturn_ex_date()) %></td>
						<td class="r_num">D-<%=(int)r.getReturn_num() %></td>
						
						<td id="r_h_userseq<%=i %>" class="r_h_userseq"><%=r.getUser_seq() %></td>
						<td id="r_h_rentalseq<%=i %>"class="r_h_rentalseq"><%=r.getRental_seq() %></td>
						
						
						<td id="r_botton<%=i %>" style="border-bottom: none; background-color: white;"><button class="r_button" onclick="win_open('returnPopup.jsp?btn=<%=i++ %>', 'returnPopup')" type="button">반납 처리하기</button></td>
					</tr>
				<%} %>
			</table>
		</div>
		</li>
		</ul>
	</div>

</div>
<footer>
	<jsp:include page="./common/footer.jsp" />
</footer>

<script src="./js/return.js" type="text/javascript"></script>
	<script src="js/main.js"></script>
</body>
</html>