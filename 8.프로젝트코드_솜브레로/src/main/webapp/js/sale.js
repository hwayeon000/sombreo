console.log("js 파일 연결")

/* 이미지 파일 미리보기 */
   var upload = document.querySelector('#salePhotoID');
    var preview = document.querySelector('#preview');
 
    upload.addEventListener('change',function (e) {
        var get_file = e.target.files;
 
        var image = document.createElement('img');
 
        /* FileReader 객체 생성 */
        var reader = new FileReader();
 
        /* reader 시작시 함수 구현 */
        reader.onload = (function (aImg) {
            console.log(1);
 
            return function (e) {
                console.log(3);
                /* base64 인코딩 된 스트링 데이터 */
                aImg.src = e.target.result
            }
        })(image)
 
        if(get_file){
            /* 
                get_file[0] 을 읽어서 read 행위가 종료되면 loadend 이벤트가 트리거 되고 
                onload 에 설정했던 return 으로 넘어간다.
                이와 함게 base64 인코딩 된 스트링 데이터가 result 속성에 담겨진다.
            */
            reader.readAsDataURL(get_file[0]);
            console.log(2);
        }
 
        preview.appendChild(image);
    })
    
    
/* 카테고리 설정 */
function categoryChange(e){
	var cate2_100 = ['텐트', '그릴', '침낭', '캠핑 테이블', '캠핑 의자'];
	var cate2_200 = ['등산 가방', '등산 스틱', '아이젠', '스패츠', '헤드랜턴'];
	var cate2_300 = ['낚시대','낚시 태클박스', '낚시 두레박', '낚시 조명', '낚시 의자'];
	var cate2_400 = ['골프채', '골프 가방', '서핑보드', '스노쿨링 마스크', '야구배트/공/글러브'];
	var cate2_500 = ['캐리어 20인치', '캐리어 24인치', '캐리어 28인치', '보조배터리', '물놀이 용품'];
	
	var target = document.getElementById("selectCate2");
	if(e.value == "100") var d = cate2_100;
	else if(e.value == "200") var d = cate2_200;
	else if(e.value == "300") var d = cate2_300;
	else if(e.value == "400") var d = cate2_400;
	else if(e.value == "500") var d = cate2_500;
	
	target.options.length = 0;
	
	let i = 1;
	
	for(x in d){
		var opt = document.createElement("option");
		opt.value = i++;
		opt.innerHTML = d[x];
		target.appendChild(opt);
	}
}