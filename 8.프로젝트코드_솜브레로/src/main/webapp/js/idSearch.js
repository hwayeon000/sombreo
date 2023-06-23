

function setInternationalCode(){
		
var totalTime = 0;
var ftime = 0;
var stime = 0;
var etime = 0;
var selected_id = "";
var radioClickCount = 0;
var btnClickCount = 0;
}
jquery_pwInquiry = jQuery.noConflict(true);
jquery_pwInquiry(document).ready(function() {
    lua_do2('IDInquiry_CHECK_UI_PC', arguments.callee.name, "", document.fm.token_help.value, true,'');        

	if(totalTime == 0) {
		totalTime  = new Date();
	}

	jquery_pwInquiry("input[name=certification]").change(function() {
	    selected_id = jquery_pwInquiry('form input[type=radio]:checked').attr("id");
        ftime = new Date();
		
		radioClickCount++;
	});     
    
    jquery_pwInquiry("#emailAuthNo").on( "click", function(event){
    	stime  = new Date();
    });
    
    jquery_pwInquiry("#phoneAuthNo").on( "click", function(event){
    	stime  = new Date();
    });    
        
    jquery_pwInquiry("#btnNext").on( "click", function(event){
    	btnClickCount++;
        if(stime == 0 && radioClickCount == 0){
        	stime = totalTime;
        	ftime = totalTime;
        	selected_id = jquery_pwInquiry('form input[type=radio]:checked').attr("id");
        }
    	
        if(stime != 0 && etime == 0) {
            etime = new Date();
        }
        
        
        nowTime = new Date();
        ptime = etime - stime;
        ttime = nowTime - totalTime;
        ctime = nowTime - ftime;
        
        lua_do2('IDInquiry_CHECK_UI_PC', arguments.callee.name, ptime + "^" + ttime + "^" + ctime + "^" + btnClickCount + "^" + radioClickCount + "^" + selected_id, document.fm.token_help.value, true,'');        
    });
});
 
var ua = window.navigator.userAgent.toLowerCase();
var result = (/android+\s+((\d)\.(\d))(?:\.(\d))?/igm).exec(ua);
var uad = navigator.userAgentData;
var isMobile = (uad && uad.mobile) || (ua.indexOf('Mobi') !== -1) || (/windows ce/.test( ua ) && /polar/.test( ua )) || ( /mozilla/.test( ua ) && /natebrowser/.test( ua ) ) || ( /opera/.test( ua ) && (/windows ce/.test( ua ) || /skt/.test( ua )) ) || ( /iphone/.test( ua ) || /ipod/.test( ua ) ) || ( /android/.test( ua ) && !( /.*shw-m180(s|k|l|w).*/.test( ua ) ) && !( result != null && result.length > 0 && result[1] >=3.0 ) ) || ( /dolfin/.test( ua )) || ( /windows ce/.test( ua ) && /iemobile/.test( ua ) ) || ( /mozilla/.test( ua ) &&  /(wv[0-9]+)/.test( ua ) && /lgtelecom/.test( ua ) ) || ( (/mozilla/.test( ua ) && /((010|011|016|017|018|019)\d{3,4}\d{4}$)/.test( ua )) ) || ( /windows phone os/.test( ua ) && /iemobile/.test( ua ) );
if(isMobile){
	document.getElementById('divMobileYn').style.display = "block";
}else{
	document.getElementById('divMobileYn').style.display = "none";
}

getGNB();
document.getElementById('idinquiry').className = "on";

var cur_container_height = Number(document.getElementById("container").clientHeight); // container 높이
var min_container_height = 647;
var header_height = 86;
var footer_height = isMobile ? 160: 30;

window.onload   = changeContentSize; // Window 창 로드시
window.onresize = changeContentSize; // Window 창 크기를 조정할때마다

	function changeContentSize() {
	var container_height = min_container_height;
	var window_height = Number(document.documentElement.clientHeight) - header_height - footer_height; // Window 창 높이
	if (window_height > cur_container_height) {
		if (window_height > min_container_height) {
			container_height = window_height;
		}
	} else {
		if (cur_container_height > min_container_height) {
			container_height = cur_container_height;
		}
	}
	
    if (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) { // ie11 추가
        document.getElementById("container").style.height = container_height + "px";
    }else if (window.navigator.userAgent.indexOf("MSIE") == -1 || (document.all && window.XMLHttpRequest)) { // ie6 제외
        document.getElementById("container").style.height = container_height + "px";
    } else {
        document.getElementById("container").style.height ="100%";
    }
}

	function setContainerHeight(height) {
	if (height >= 0) {
		cur_container_height = height;
	} else {
		cur_container_height = Number(document.getElementById("container").clientHeight);
	}
	changeContentSize();
 }


