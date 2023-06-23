console.log("cart check");

/* 대여일, 대여 수량 */
let rental_period = 0;
let rental_quantity = 0;
let product_price = 0;
/* 대여일 선택 값 가져오는 함수, 변수 */
const changeValue =(target)=>{
	console.log(target.value);
	rental_period = target.value;
}

/* 버튼 클릭시 장바구니 페이지 이동 함수 */
/* num-product */
const product_btn_cart = document.getElementById("addToCart");

