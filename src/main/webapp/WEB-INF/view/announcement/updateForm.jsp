<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ include file="../layout/header.jsp" %>



 <link
      rel="stylesheet"
      href="/css/announcementUpdateForm.css"
    />

      <!-- 공고제목 -->
     
      <div class="my_hrname">
      <h2>채용공고 제목</h1>
        <div class="my_hrsmlname">
      <span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp채용공고 제목에 모집 내용을 잘 기재할수록, 적합한 인제를 채용할 수 있습니다.</span>
      </div>
    </div>
    <div class="my_hrclass">
      <hr />
    </div>

      <!--  공고제목  끝 -->
      <!-- 경력박스 -->
      <form> 
      <div class="my_input_box2">
        <div class="my_input_box">
          <div class="input-group input-group-sm mb-3">
            <span class="input-group-text" id="inputGroup-sizing-sm">제목</span>
            <input
              type="text"
              class="form-control"
              aria-label="Sizing example input"
              aria-describedby="inputGroup-sizing-sm"
              placeholder="수정할 제목을 입력해주세요"
            id="announcementTitle" value="${announcement.announcementTitle}"/>
          </div>
        </div>
      </div>
   

  
     
      <div class="my_inputbigflex">
      <div class="my_inputflex">
      <div class="input-group input-group-lg">
        <span class="input-group-text" id="inputGroup-sizing-lg">경력사항</span>
        <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" id="announcementCarrer" value="${announcement.announcementCarrer}">
      </div>
      <div class="input-group input-group-lg">
        <span class="input-group-text" id="inputGroup-sizing-lg">상세급여</span>
        <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" id="announcementSalary" value="${announcement.announcementSalary}">
      </div>
    </div>
      </div>

      <div class="my_inputbigflex">
        <div class="my_inputflex">
        <div class="input-group input-group-lg">
          <span class="input-group-text" id="inputGroup-sizing-lg">근무형태</span>
          <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" id="announcementHireType" value="${announcement.announcementHireType}">
        </div>
        <div class="input-group input-group-lg">
          <span class="input-group-text" id="inputGroup-sizing-lg">모집인원</span>
          <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" id="announcementRecNum" value="${announcement.announcementRecNum}">
        </div>
      </div>
        </div>
        <!-- 경력박스 끝 -->
<!-- 기술선택 -->
<div class="my_hr">
    <div class="input-group mb-3">
           <select class="form-select" id="inputGroupSelect02">
      <option selected value="0">Choose...</option>
      <c:forEach items="${stacks}" var="stack">
      <option value="${stack.id}">${stack.stackName}</option>
      </c:forEach>
    </select>
        <label class="input-group-text" style="background: rgb(255, 230, 104); color: white;" for="inputGroupSelect03">기술스택</label>
      </div>
    </div>

<!-- 기술선택 -->

<!-- 근무지역 name-->
<div class="my_allbox">
    <div class="my_hrname">
    <h2>근무지역</h2>
  </div>
  <div class="my_hrclass">
    <hr />
   
  </div>
</div>
<!--  -->
<!-- 근무지역  -->


<div class="my_rmsanwl">
    <div><strong><h4>근무지</h4></strong></div>
</div>
<div class="my_wjscpqrtm">


    <!--주소  -->
    <div class="my_formclass">
        <input class="form-control" type="text" placeholder="주소입력" aria-label="default input example" id="announcementArea"name="announcementArea" value="${announcementArea}">
        <%-- <input class="form-control" type="text" placeholder="주소입력" aria-label="default input example" id="announcementArea"name="addr1" value="${address1}"> --%>
        <button type="button" onclick="execPostCode();" class="btn btn-primary">주소찾기</button>
    </div>
      
</div>
<div class="my_formclass2">
<input class="form-control" type="text" placeholder="상세주소" aria-label="default input example" >
</div>
</div></form>
   <!--주소 끝  -->
<!-- 섬머노트 -->
<div class="my_mysummermagin"name="announcementContent" id="announcementContent" >
<form class="my_summernote"  >
  <textarea id="summernote" > Hello Summernote</textarea>
</form>
<div class="my_summernotebtn">
<button onclick="updateId(${announcement.id})" type="button"  class="btn btn-primary">등록하기</button>
</div>
</form>
</form>
</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
  <script>
    $(document).ready(function() {
      $('#summernote').summernote({
		  height: 300,                 // 에디터 높이
      width: 815,
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
          
	});
});

 function updateId(id) {
        let data = {
            stackId: $("#inputGroupSelect02").val(),
            announcementTitle: $("#announcementTitle").val(),
            announcementContent: $("#summernote").val(),
            announcementCarrer: $("#announcementCarrer").val(),
            announcementHireType: $("#announcementHireType").val(),
            announcementRecNum: $("#announcementRecNum").val(),
            announcementSalary: $("#announcementSalary").val(),
            announcementArea: $("#announcementArea").val()
        };
        console.log(data.stackId);

        $.ajax({
            type: "put",
            url: "/announcement/" + id,
            data: JSON.stringify(data),
            contentType: "application/json; charset=utf-8",
            dataType: "json" 
        }).done((res) => { 
            alert(res.msg);
            location.href = "/announcement/" + id;
        }).fail((err) => { 
            alert(err.responseJSON.msg);
        });
    }

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
                
                
                $("[name=addr1]").val(data.zonecode);
                $("[name=announcementArea]").val(fullRoadAddr);
                
                /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
                document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
            }
         }).open();
     }

  </script>




<%@ include file="../layout/footer.jsp" %>