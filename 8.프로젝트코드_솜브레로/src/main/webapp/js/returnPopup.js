console.log("js파일 연결")

let btn_seq = new URLSearchParams(location.search).get('btn')

console.log(btn_seq)

document.getElementById("in_user_seq").value = opener.document.getElementById("r_h_userseq"+btn_seq).innerText;
document.getElementById("in_rental_seq").value = opener.document.getElementById("r_h_rentalseq"+btn_seq).innerText;

/* 부모창 새로고침 */
function pclose(){
    opener.location.reload();
    window.close();
}

