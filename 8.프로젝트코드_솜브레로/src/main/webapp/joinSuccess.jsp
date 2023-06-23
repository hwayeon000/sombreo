<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입완료</title>
</head>
<style>
body{ background-color: lightyellow; }
#Update li{ list-style:none; }
#btn{ background-color: whight;	text-color: whight; }
#Update > ul.actions { margin-top:10%; }
</style>
<body style="text-align: center;">

	<!-- Header -->
    <header>
        <jsp:include page="./common/header.jsp"/>
    </header>
    
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Menu -->
			<nav id="Update">	
				<ul class="actions vertical">
					<li><h1>환영합니다!</h1></li><br>
					<li>회원가입을 축하합니다.</li><br>
					<!--  회원가입 한 회원 아이디를 출력-->
				</ul>
			</nav>			
			<div  class="actions vertical" style="height: 100px; display: flex; justify-content: center; align-items: center;">
				<div>
				<button onclick='location.href="login.jsp"' class="flex-c-m stext-101 cl0 size-112 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10" style="margin-right: 20px">
					로그인
				</button>
				</div>
				<div>
				<button onclick='location.href="index.jsp"' class="flex-c-m stext-101 cl0 size-112 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10">
					메인으로
				</button>
				</div>
			</div>
			<div style="height: 300px;"></div>
	</div>
	
		<!-- Footer -->
    <footer>
        <jsp:include page="./common/footer.jsp"/>
    </footer>
	

</body>
</html>