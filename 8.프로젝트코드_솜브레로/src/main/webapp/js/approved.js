console.log("approved check111");

/* 결제하기 누르면 값 있는지 여부 체크하는 함수 */
function check_onclick(){
	theFrom=document.form;
	if(theFrom.approve_transfer_user.value==""){
		alert("필수 입력란이 비었습니다.")
	} else if(theFrom.rental_user.value==""){
		alert("필수 입력란이 비었습니다.")
	} else if(theFrom.rental_phone.value==""){
		alert("필수 입력란이 비었습니다.")
	} else if(theFrom.addr3.value==""){
		alert("필수 입력란이 비었습니다.")
	} else {
		alert("필수 입력 완료")
	}
};


// 결제 uid 어떻게 처리할 지 고민해보기!!!
// const IMP = window.IMP; // 생략 가능
IMP.init("imp34881717"); 
function requestPay() {
	theFrom=document.form;
	// 결제 금액
	var price = document.getElementById('totalPrice').innerText;
	console.log(price);
	
	// 결제 임시로 임의의 값 넘김
/*	theFrom.approve_number.value = "123412*********4";
	theFrom.approve_card.value = "NH카드";
	theFrom.approve_price.value = "10600";*/
	
	
	if(theFrom.approve_transfer_user.value==""){
		alert("필수 입력란이 비었습니다.")
	} else {
		
	    IMP.request_pay({
	        pg : 'kcp.{INIBillTst}',
	        pay_method : 'card',
	        merchant_uid: "57008833-330012", 
	        name : '주문명: 결제 테스트',
	        amount : 100,
	        buyer_email : 'Iamport@chai.finance',
	        buyer_name : '김한송',
	        buyer_tel : '010-2626-2911',
	        buyer_addr : '서울특별시 강남구 삼성동',
	        buyer_postcode : '123-456'
	    }, function (rsp) { // callback
	        if (rsp.success) {
	            console.log(rsp);
	            //NH카드
	            console.log(rsp.card_name);
		        // approve_seq, approve_number, approve_card, approve_price, approve_transfer_user
	      		// location="LoginService.do?name=" + name;
				theFrom.approve_number.value = rsp.card_number;
				theFrom.approve_card.value = rsp.card_name;
				theFrom.approve_price.value = rsp.paid_amount;
				
			} else {
			    alert(`결제에 실패하였습니다. 에러 내용: ${rsp.error_msg}`);
			}
	    });
    }
}



// IMP.certification(param, callback) 호출
function certification() {
  IMP.certification({ // param
    // 주문 번호
    pg:'PG사코드.{MIIiasTest}',//본인인증 설정이 2개이상 되어 있는 경우 필
    merchant_uid: "ORD20180131-0000015", 
    // 모바일환경에서 popup:false(기본값) 인 경우 필수
    m_redirect_url : "cart.jsp", 
    // PC환경에서는 popup 파라미터가 무시되고 항상 true 로 적용됨
    popup : false 
  }, function (rsp) { // callback
    if (rsp.success) {
      // 인증 성공 시 로직,
      console.log("본인인증 성공");
      console.log(rsp);
      //document.getElementById("approve_transfer_user").value = rsp.success;
      /*axios({
		  url: "Main.jsp", 
	      method: "POST",
	      headers: { "Content-Type": "application/json" },
	      data: { imp_uid: rsp.imp_uid }
      });*/
    } else {
      // 인증 실패 시 로직,
      console.log("본인인증 실패");
      alert("인증에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
    }
  }); 
}


/*function goPost(){
    let f = document.createElement('form');
    f.setAttribute('method', 'post');
    f.setAttribute('action', 'LoginService.do');
    
    document.body.appendChild(f);
    f.submit();
}*/







