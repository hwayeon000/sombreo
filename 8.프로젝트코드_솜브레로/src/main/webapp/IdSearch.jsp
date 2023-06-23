<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>아이디 찾기 : 네이버</title>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta http-equiv="Cache-Control"
	content="no-store, no-cache, must-revalidate">
<meta http-equiv="Cache-Control" content="post-check=0, pre-check=0">
<meta http-equiv="Pragma" content="No-Cache">
<meta name="format-detection" content="telephone=no">

<link rel="stylesheet" type="text/css"
	href="/inc/user/css/IdSearch.css">
	
<meta name="decorator" content="USER_INQUIRY">
<script type="text/javascript"
	src="https://nid.naver.com/inc/user/js/soundCaptcha.js?20220411"></script>
<meta name="autocomplete" content="off">
<head>


</head>
<body onclick="clearDocs();gnbClose();">
	<div id="lnb" class="lnb_wrap">
		<ul class="lnb lnb_type3">
			<li class="m5"><a href="#" id="idinquiry"
				onmouseover="showMenu('idinquiry','pwinquiry');"
				onmouseout="hideMenu('idinquiry');"
				onclick="showMenu('idinquiry','pwinquiry');goPage('idInquiry','idinquiry');clickcr(this,'LNB.idinquiry','','',event);return false;"
				class="on"><span class="blind">아이디 찾기</span></a></li>
			<li class="m6"><a href="#" id="pwinquiry"
				onmouseover="showMenu('pwinquiry','idinquiry');"
				onmouseout="hideMenu('idinquiry');"
				onclick="showMenu('pwinquiry','idinquiry');goPage('pwInquiry','pwinquiry');clickcr(this,'LNB.pwinquiry','','',event);return false;"><span
					class="blind">비밀번호 재설정</span></a></li>
		</ul>
		<h2 class="blind">현재페이지는 "아이디찾기"</h2>
	</div>
	</div>

	<div id="container" style="height: 920px;">
		<!-- CONTENTS -->
		<!-- CONTENTS -->
		<div id="content" class="non_sign inquiry" onclick="clearDocs();">

			<div class="content_header">
				<h2>
					<img
						src="https://static.nid.naver.com/images/user/images/user/h_find_id.gif"
						width="70" height="16" alt="아이디 찾기">
				</h2>
			</div>
			<p class="content_summary">아이디 찾는 방법을 선택해 주세요.</p>

			<div class="section section_find">
				<form id="fm" name="fm" onsubmit="return mainSubmit();">
					<fieldset>
						<input type="hidden" id="token_help" name="token_help"
							value="bC6Ub6PCYAJ34Tq1"> <input type="hidden"
							id="birthday" name="birthday" value=""> <input
							type="hidden" id="fromPage" name="fromPage"
							value="idInquiryBegin"> <input type="hidden"
							name="authYn" id="authYn" value=""> <input type="hidden"
							name="captchaCheckYn" id="captchaCheckYn" value="N"> <input
							type="hidden" id="captcha_type" name="captcha_type" value="image">
						<input type="hidden" id="autoValue" name="autoValue" value="">
						<input type="hidden" id="mobileYn" name="mobileYn" value="N">
						<input type="hidden" name="type" id="type" value="idInquiry">
						<input type="hidden" id="chptchakey" name="chptchakey" value="">
						<div class="box6">
							<!-- 휴대전화 영역 -->
							<div id="div_phone" class="box_inn selected">
								<!-- [D] 선택시 selected 클래스 추가 -->
								<legend>회원정보에 등록한 휴대전화로 인증</legend>
								<input type="radio" id="r_pn1" class="input_rd"
									name="certification" checked="" value="phone"
									onclick="selectType('phone');clickcr(this,'idf.memeberphone','','',event);">

								<label for="r_pn1" class="label_rd">회원정보에 등록한 휴대전화로 인증</label>
								<div class="box_inn_sub">
									<dl>
										<dt>
											<label for="phoneNm" class="label_txt">이름<!--이름--></label>
											<input type="text" id="phoneNm" name="user_name" maxlength="40"
												class="input_txt" style="width: 217px">
										</dt>
									
										<dt>
											<label for="t_pn1" class="label_txt">휴대전화</label>
											<input type="text" id="phoneNm" name="user_phone" maxlength="40"
												class="input_txt" style="width: 217px">
										</dt>

									</dl>
								</div>
							</div>

						</div>

						<script src="/inc/mobile/js/idSearch.js"></script>

					
</body>
</html>