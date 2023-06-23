<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script language="javascript">
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";

function goPopup(){
    var pop = window.open("./jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
    
}
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
						, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
	document.form.roadAddrPart1.value = roadAddrPart1;
	document.form.roadAddrPart2.value = roadAddrPart2;
	document.form.addrDetail.value = addrDetail;
	document.form.zipNo.value = zipNo;
	console.log(roadAddrPart1+"/"+roadAddrPart2);
	
}
</script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="http://code.jquery.com/jquery-3.1.0.js"></script>
<link rel="stylesheet" type="text/css" href="css/JoinPage.css">
</head>
<body>

	  <main id="main-holder" class="container">
		<form action="JoinService.do" name="form" id="form" method="post">

		<article id="Contents" class="joinPerson memberJoin">
			<h1 class="sign__title">회원가입</h1>
			

			<!-- 아이디 입력창 -->
				<div class="input-box-wrap">
					<div class="input-box">
						<input type="text" minlength="5" id="userid" name="user_id" class="has-label" value="" maxlength="15" autocomplete="">
						<label for="userid">아이디 (5~15자 영문,숫자)</label>
	
						
					</div>
				</div>
				<div class="valid-text">
					<p id="msg_userid" class="msg"></p>
				</div>
	<!-- 비밀번호 입력창 -->
			<section class="sign-section passwd">
				<ul class="input-box-wrap">
					<li class="input-box">
						<input type="password" id="passwd" name="user_pw" minlength="5" class="has-label" value="" autocomplete="new-password" value={password} onChange={onChangePassword} >
						<label for="passwd">비밀번호<span>5-15자의 영문/숫자 또는 특수문자 조합</span></label>
						{password  && (<span>{passwordMessage}</span>)}
						<button type="button" id="changePasswdType" class="password-view-btn" onclick="">표시</button>
					</li>
					
					
					<li class="input-box">
			
						<input type="password" id="passwd2" name="passwd2" class="has-label" value="" minlength="8" maxlength="16"  value={passwordConfirm} onChange={onChangePasswordConfirm}>
						<label for="passwd2">비밀번호 재입력</label>
						{passwordConfirm ? (password === passwordConfirm ? <span>같음</span> : <span>다름</span>) : null}
					</li>
				</ul>
				<div class="valid-text">
					<p id="msg_passwd" class="msg"></p>
					<p id="msg_passwd2" class="msg"></p>
				</div>
			</section>
	<!-- 이름 입력창 o-->
			<section class="sign-section name">
				<div class="input-box-wrap">
					<div class="input-box">
						<input type="text" id="usernm" class="has-label" name="user_name" maxlength="20" value="">
						<label for="usernm">이름</label>
					</div>
				</div>
				<div class="valid-text">
					<p id="msg_usernm" class="msg"></p>
				</div>
			</section>
	<!-- nick네임 입력창 o-->
			<section class="sign-section">
				<div class="input-box-wrap">
					<div class="input-box">
						<input type="text" id="email" class="has-label" name="user_nick" value="" maxlength="50" autocomplete="off">
						<label for="email">닉네임</label>
					</div>
				</div>
			</section>
			<!-- 주소 입력창 -->
			<section class="sign-section address">
				<ul class="input-box-wrap">
					<li class="input-box">
						<label for="htel">우편번호
						<span><input type="text" id="zipNo" name="zipNo" readonly style="width:100px" value=""></span>
					    <span><input type="hidden" id="confmKey" name="confmKey" value=""  ></span>
						<input type="button"  value="주소검색" onclick="goPopup();">
						</label>
					</li>
					
					
					<li class="input-box">
						<label for="text">도로명주소
							<span><input type="text" id="roadAddrPart1" name="addr1" style="width:70%" readonly="readonly" value=""></span>
							<span><input type="text" id="roadAddrPart11" name="roadAddrPart11" readonly="readonly" value=""></span>
						</label>
					</li>
					
					<li class="input-box">
						<label for="text">상세주소
							<span><input type="text" id="addrDetail" name="addr3" style="width:40%" readonly="readonly" value=""></span>
							<span><input type="text" id="roadAddrPart2" name="addr2"  style="width:40%" readonly="readonly" value=""></span>
						</label>
					</li>
				</ul>	
			
			</section>
	<!-- 휴대폰번호 입력창 o-->
			<section class="sign-section">
				<ul class="input-box-wrap">
					<li class="input-box">
						<label for="htel">휴대폰 <span>('-' 없이 입력하세요.)</span></label>
						<input type="tel" id="htel" class="has-label" name="user_phone" value="" maxlength="11">
					</li>
				</ul>		
			</section>

			<div class="btnAction">
			<!-- fff230 -> c0c0c0 -->
				<input type= "submit" class="btn btnType1 submit" >
			</div>
			
		</article>
	</form>
	</main>
	
	
	
<style type="text/css">

    
html {
  height: 100%;
}

body {
  height: 120%;
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
  display: grid;
  justify-items: center;
  align-items: center;
  background-color: #3a3a3a;
}

#main-holder {
  width: 50%;
  height: 70%;
  display: grid;
  justify-items: center;
  align-items: center;
  background-color: white;
  border-radius: 7px;
  box-shadow: 0px 0px 5px 2px black;
}

#login-error-msg-holder {
  width: 100%;
  height: 100%;
  display: grid;
  justify-items: center;
  align-items: center;
}

#login-error-msg {
  width: 23%;
  text-align: center;
  margin: 0;
  padding: 5px;
  font-size: 12px;
  font-weight: bold;
  color: #8a0000;
  border: 1px solid #8a0000;
  background-color: #e58f8f;
  opacity: 0;
}

#error-msg-second-line {
  display: block;
}

#login-form {
  align-self: flex-start;
  display: grid;
  justify-items: center;
  align-items: center;
}

.login-form-field::placeholder {
  color: #3a3a3a;
}
.login-form-field {
  width: 100%;
  border: none;
  border-bottom: 1px solid #3a3a3a;
  margin-bottom: 10px;
  border-radius: 3px;
  outline: none;
  padding: 0px 0px 5px 5px;
}

#login-form-submit {
  width: 100%;
  padding: 7px;
  border: none;
  border-radius: 5px;
  color: white;
  font-weight: bold;
  background-color: #3a3a3a;
  cursor: pointer;
  outline: none;
}


#main-holder {
  width: 70%;
  height: 90%;
}
  </style>
</body>
</html>