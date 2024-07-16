var slideIndex = 0; //slide index

//HTML 로드가 끝난 후 동작
window.onload=function(){
	showSlides(slideIndex);
	// Auto Move Slide
	var sec = 5000;
	setInterval(function(){
		slideIndex++;
		showSlides(slideIndex);
	}, sec);
}

//Next/previous controls
function moveSlides(n) {
	slideIndex = slideIndex + n
	showSlides(slideIndex);
}

//Thumbnail image controls
function currentSlide(n) {
	slideIndex = n;
	showSlides(slideIndex);
}

function showSlides(n) {
	var slides = document.getElementsByClassName("mySlides");
	var dots = document.getElementsByClassName("dot");
	var size = slides.length;
	if ((n+1) > size) {
		slideIndex = 0; n = 0;
	}else if (n < 0) {
		slideIndex = (size-1);
		n = (size-1);
	}
	for (i = 0; i < slides.length; i++) {
		slides[i].style.display = "none";
	}
	for (i = 0; i < dots.length; i++) {
		dots[i].className = dots[i].className.replace(" active", "");
	}
	slides[n].style.display = "block";
	dots[n].className += " active";
}

//약관동의
function go_next() {
	if ($('.agree')[0].checked == true && $('.agree')[1].checked == true) { // 동의함에 체크되어 있으면 회원가입페이지 이동
		$('#join').attr('action', 'join_form').submit();
	} else {
		alert("약관에 동의해 주셔야 합니다.")
	}
}

var bannerWidth = $('.mediabannerlist li').length * 100;
$('.mediabannerlist').width(bannerWidth);

//MEDIA BANNER SCROLLING
$('.scroller.right').mouseenter(function(){
	$('.banner-inner').scrollTo(bannerWidth, 1200);
});
$('.scroller.left').mouseenter(function(){
	$('.banner-inner').scrollTo(0, 1200);
});
$('.scroller').mouseleave(function(){
	$('.banner-inner').stop();
});


/*
 * 탭메뉴
 */
$(document).ready(function(){
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');
		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');
		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})
})

//회원가입 입력확인
function formCheck(form) {
	var idchk = $('.idCheck1').css('display');
	var emailchk = $('#mailChkResult');
	var chk = confirm("입력한 정보대로 회원가입 하시겠습니까?");
if(chk){
	//유효성 검사
	if(form.name.value == "") { // 이름 미입력시
		alert('이름을 입력하세요.');
		form.name.focus() ;
		return ;
	} else if(form.id.value == "") { // 아이디 미입력시
		alert('아이디를 입력하세요.');
		form.id.focus() ;
		return ;
	} else if (idchk == 'none') {
		alert("아이디 중복체크를 해주세요!");
		form.id.focus();
		return;
	} else if(form.pwd.value == "") { // 비밀번호 미입력시
		alert('비밀번호를 입력하세요.');
		form.pwd.focus() ;
		return ;
	} else if(form.pwd.value.length < 10 || form.pwd.value.length > 16) { // 비밀번호 글자수 틀릴시
		alert('비밀번호는 10 ~ 16자 사이로 입력하세요.');
		form.pwd.focus() ;
		return ;
	} else if(form.pwdCheck.value != form.pwd.value) {
		alert('비밀번호가 일치하지 않습니다.');
		form.pwdCheck.focus() ;
		return ;
	} else if(form.email.value == "") {
		alert('e-mail을 입력하세요.');
		form.email.focus() ;
		return ;
	} else if(emailchk.hasClass("correct") ==false) {
		alert('e-mail인증을 완료하세요.');
		form.mailcodeChk.focus() ;
		return ;
	}  else if(form.phone.value == "") {
		alert('휴대폰 번호를 입력하세요.');
		form.phone.focus() ;
		return ;
	} else if(form.zipnum.value == "") {
		alert('우편번호를 입력하세요.');
		form.zipnum.focus() ;
		return ;
	} else if(form.addr.value == "") {
		alert('주소를 입력하세요.');
		form.addr.focus() ;
		return ;
	} else {
		alert('회원가입이 완료되었습니다.');
		$("#join").attr("action", "join").submit();
	}
	form.reset();
}
}

//폰번호 - 자동삽입
function inputPhoneNumber(obj) { 
    var number = obj.value.replace(/[^0-9]/g, "");
    var phone = "";
	
	 if(number.length < 4) {
	        return number;
	    } else if(number.length < 7) {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3);
	    } else if(number.length < 11) {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3, 3);
	        phone += "-";
	        phone += number.substr(6);
	    } else {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3, 4);
	        phone += "-";
	        phone += number.substr(7);
	    }
	    obj.value = phone;
}

//우편번호 찾기
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

        	// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }
           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           document.getElementById('zipnum').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('addr').value = fullRoadAddr;
       }
    }).open();
}
function idok(){
	  self.close();
}

/**
 *  아이디, 비밀번호 찾기 관련 스크립트 참수
 */
function findInfoForm() {
	var url = "findId";
	window.open(url, "_blank_1", 
			"width=700, height=650, left=500, top=100");
}
function findPwdForm() {
	var url = "findPwd";
	window.open(url, "_blank_1", 
			"width=700, height=650, left=500, top=100");
}
/*
 * 아이디를 찾기 위해 find_pwd URL 요청 전송
 * 이름, 이메일, 전화번호가 입력되었는지 확인
 */
function findMemberId() {
	/* 이름과 이메일 입력 확인 */
	if ($("#name").val() == "") {
		alert("이름을 입력해 주세요!");
		$("#name").focus();
	} else if ($("#email").val() == "") {
		alert("이메일을 입력해 주세요!");
		$("#email").focus();
	} else if ($("#phone").val() == "") {
		alert("전화번호를 입력해 주세요!");
		$("#phone").focus();
	} else {
		$("#findId").attr("action", "find_id").submit();
	}
}
/*
 * 비밀번호를 찾기 위해 find_pwd URL 요청 전송
 * 이름, 이메일, 전화번호가 입력되었는지 확인
 */
function findMemberPwd() {
	/* 이름과 이메일 입력 확인 */
	if ($("#name").val() == "") {
		alert("이름을 입력해 주세요!");
		$("#name").focus();
	} else if ($("#id").val() == "") {
		alert("아이디를 입력해 주세요!");
		$("#id").focus();
	} else if ($("#email").val() == "") {
		alert("이메일을 입력해 주세요!");
		$("#email").focus();
	} else if ($("#phone").val() == "") {
		alert("전화번호를 입력해 주세요!");
		$("#phone").focus();
	} else {
		$("#findPwd").attr("action", "find_pwd").submit();
	}
}

/*
 * 아이디, 이름, 비밀번호를 입력하여 비밀번호 찾기 요청
 */
function findPassword() {

	if ($("#id2").val() == "") {
		alert("아이디를 입력해 주세요!");
		$("#id2").focus();
	} else if ($("#name2").val() == "") {
		alert("이름을 입력해 주세요!");
		$("#name2").focus();
	} else if ($("#email2").val() == "") {
		alert("이메일을 입력해 주세요!");
		$("#email2").focus();
	} else {
		$("#findPW").attr("action", "find_password").submit();
	}
}



/* 사이드메뉴 */
$(function(){
	$('.sidemenu ul li a').click(function(){
		$('.sidemnu ul li a').removeClass();
			$(this).addClass('on');
	})
}) 

 $(function(){
  var sBtn = $(".sidemenu > ul > li");    //  ul > li 이를 sBtn으로 칭한다. (클릭이벤트는 li에 적용 된다.)
  sBtn.find("a").click(function(){   // sBtn에 속해 있는  a 찾아 클릭 하면.
   sBtn.removeClass("visited");     // sBtn 속에 (active) 클래스를 삭제 한다.
   $(this).parent().addClass("visited"); // 클릭한 a에 (active)클래스를 넣는다.
  })
 })


/* 도서등록 */
function admin_book_save() {
	var chk = confirm("등록하시겠습니까?");
	if(chk){
	$("#write_form").attr("encoding", "multipart/form-data");
	$("#write_form").attr("action", "admin_book_write").submit();
	alert("도서 등록이 완료되었습니다.");
	}
}

/* 도서 수정화면 요청 함수 */
function admin_book_update(bseq) {
	$("#book_detail").attr("action", "admin_book_update_form?bseq="+bseq).submit();
}

/*도서 수정완료 요청 함수*/
function admin_book_update_save(bseq) {
	var chk = confirm("수정하시겠습니까?");
	if (chk) {			
		$("#update_form").attr("encoding", "multipart/form-data");
		$("#update_form").attr("action", "admin_book_update?bseq="+bseq).submit();
		alert("수정이 완료되었습니다.");
	}
}

/* 도서 삭제 함수 */
function admin_book_delete(bseq) {
	var chk = confirm("정말 삭제하시겠습니까?");
	if (chk) {
		location.href='admin_book_delete?bseq='+bseq;
		alert("삭제가 완료되었습니다.");
	}
}

/* 리뷰상세보기 */
function getReply(oseq) {
	var url = "getReply?oseq="+oseq;
	window.open(url, "_blank_1", 
	"width=700, height=650, left=500, top=100");
}
/* 리뷰등록 */
function insertReplyForm(oseq) {
	var url = "insertReplyForm?oseq="+oseq;
	window.open(url, "_blank_1", 
	"width=700, height=650, left=500, top=100");
}
function insertReply(bseq) {
	var chk = confirm("리뷰를 등록하시겠습니까?");
	if(chk){
	$("#insertReply").attr("action", "insertReply?bseq="+bseq).submit();
	alert("리뷰 등록이 완료되었습니다.");
	}
}
/* 리뷰수정 */
function updateReplyForm(oseq) {
	var url = "updateReplyForm?oseq="+oseq;
	window.open(url, "_blank_1", 
	"width=700, height=650, left=500, top=100");
}
function updateReply(oseq) {
	var chk = confirm("리뷰를 수정하시겠습니까?");
	if(chk){
	$("#updateReply").attr("action", "updateReply?oseq="+oseq).submit();
	alert("리뷰 수정이 완료되었습니다.");
	}
}
/* 리뷰삭제 */
function deleteReply(rseq) {
	var chk = confirm("리뷰를 삭제하시겠습니까?");
	if(chk){
	location.href = "deleteReply?rseq="+rseq;
	alert("리뷰가 삭제 되었습니다.");
	}
}

/* 도서 검색 */
function search() {
	if ($("#keyword").val() == "") {
		alert("검색어를 입력해 주세요!");
		$("#keyword").focus();
	} else {
		$("#searchForm").attr("action", "search").submit();
	}
}
function search2() {
	if ($("#keyword2").val() == "") {
		alert("검색어를 입력해 주세요!");
		$("#keyword2").focus();
	} else {
		$("#searchForm2").attr("action", "search").submit();
	}
}
function search3() {
	if ($("#keyword3").val() == "") {
		alert("검색어를 입력해 주세요!");
		$("#keyword3").focus();
	} else {
		$("#searchForm3").attr("action", "search").submit();
	}
}

/* 공지사항 */
function noticeWrite(){
	var chk = confirm("공지사항을 등록하시겠습니까?");
	if(chk){
		alert("등록이 완료되었습니다.");
	}
}
function noticeDelete(nseq){ // 공지사항삭제
	var chk = confirm("공지사항을 삭제하시겠습니까?");
	if(chk){
		location.href="admin_notice_delete?nseq="+nseq;
		alert("삭제가 완료되었습니다.");
	}
}
function noticeUpdate(){ // 공지사항수정
	var chk = confirm("공지사항을 수정하시겠습니까?");
	if(chk){
		alert("수정이 완료되었습니다.");
	}
}
function qnaWrite(){
	var chk = confirm("1대1 문의를 등록하시겠습니까?");
	if(chk){
		alert("문의가 등록이 완료되었습니다.");
	}
}
function qnaUpdate(){
	var chk = confirm("문의를 수정하시겠습니까?");
	if(chk){
		alert("수정이 완료되었습니다.");
	}
}
/* 자주묻는질문 */
function aqnaWrite(){ // 자묻질 등록
	var chk = confirm("자주묻는질문을 등록하시겠습니까?");
	if(chk){
		alert("등록이 완료되었습니다.");
	}
}
function aqnaDelete(aqseq){ // 자묻질 삭제
	var chk = confirm("자주묻는질문을 삭제하시겠습니까?");
	if(chk){
		location.href="admin_aqna_delete?aqseq="+aqseq;
		alert("삭제가 완료되었습니다.");
	}
}
function aqnaUpdate(){ // 자묻질 수정
	var chk = confirm("자주묻는질문을 수정하시겠습니까?");
	if(chk){
		alert("수정이 완료되었습니다.");
	}
}
function qnaAnswer(){ // 답변등록
	var chk = confirm("답변을 등록 하시겠습니까?");
	if(chk){
		alert("등록이 완료되었습니다.");
	}
}

function qnaDelete(qseq){ // 질문삭제
	var chk = confirm("질문을 삭제하시겠습니까?");
	if(chk){
		location.href="qna_delete?qseq="+qseq;
		alert("삭제가 완료되었습니다.");
	}
}

function go_cart(){ // 카트담기
	var chk = confirm("장바구니에 담으시겠습니까?");
	if (chk){
		$("#book_detail").attr("action", "cart_insert").submit();
	}
}

function go_order(){ // 카트담지않고 바로구매
	var chk = confirm("바로구매 하시겠습니까?");
	if(chk){
		$("#book_detail").attr("action", "order_insert").submit();
	}
}

function cancel_order(){
	var chk = confirm("진행중인 주문을 취소 하시겠습니까?");
	if(chk){
		$(".orderingList").attr("action", "delete_order").submit();
		alert("주문이 취소되었습니다. 진행중인 주문은 장바구니에 다시 담깁니다.");
	}
}


function go_order_insert(){ // 주문전 주문정보창에서 주문완료처리
	var chk = confirm("주문을 완료 하시겠습니까?");
	if(chk){
		$(".orderingList").attr("action", "update_order").submit();
		alert("주문이 완료되었습니다.");
	}
}

function update_order_info_form(id) {
	location.href = "update_order_info_form?result=1&id="+id;
}

function getOrder(oseq) {
	location.href = "order_view?oseq="+oseq;
}
function updateGetOrderForm(oseq) {
	location.href = "updateGetOrderForm?oseq="+oseq;
}
function updateGetOrder(oseq) {
	var chk = confirm("배송정보를 수정하시겠습니까?");
	if(chk){
		$("#updateGetOrder").attr("action", "updateGetOrder?oseq="+oseq).submit();
		alert("배송정보를 수정했습니다.");
	}
}

function update_order_info(id) {
	var chk = confirm("배송정보수정을 완료하시겠습니까?");
	if(chk){
		$("#deliveryInfo").attr("action", "update_order_info?result=1&id="+id).submit();
		alert("배송정보 수정이 완료되었습니다.");
	}
}

function order_insert_by_cart(){
	var count = 0;	// 삭제할 항목의 갯수
	var chk = confirm("선택한 항목을 주문하시겠습니까?");
	
	if(chk){
	if (document.formm.oseq.length == undefined) {
		if (document.formm.oseq.checked == true) {
			count++;
		}
	}
	
	for (var i=0; i<document.formm.oseq.length; i++) {
		if (document.formm.oseq[i].checked == true) {
			count++;
		}
	}
	
	if (count == 0) {
		alert("주문할 항목을 선택해 주세요!");
	} else {
		document.formm.action = "cart_order";
		document.formm.submit();
	}
	}
}

function order_check(oseq){ // 구매확정처리
	var chk = confirm("구매확정 하시겠습니까?");
	if(chk){
		location.href="order_check?oseq="+oseq;
		alert("구매확정이 완료되었습니다.");
	}
}

function order_cancel(oseq){ // 주문취소처리
	var chk = confirm("주문취소 하시겠습니까?");
	if(chk){
		location.href="order_cancel?oseq="+oseq;
		alert("주문취소가 완료되었습니다.");
	}
}

function admin_order_ok(oseq){ // 관리자-배송완료처리
	var chk = confirm("배송완료 처리하시겠습니까?");
	if(chk){
		location.href="admin_order_ok?oseq="+oseq;
		alert("배송완료 완료되었습니다.");
	}
}

/* 리뷰쓰기 */
$(".insertReply").on("click", function(e){
	e.preventDefault();
	var chk = confirm("리뷰를 등록하시겠습니까?");
	if(chk){
		$("#book_detail").attr("action", "order_insert").submit();
		alert("리뷰를 등록했습니다.");
	}
});


