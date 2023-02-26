<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ include file="../layout/header.jsp" %>



 <link
      rel="stylesheet"
      href="/css/announcementSaveForm.css"
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
      <div class="my_input_box2">
        <div class="my_input_box">
          <div class="input-group input-group-sm mb-3">
            <span class="input-group-text" id="inputGroup-sizing-sm">제목</span>
            <input
              type="text"
              class="form-control"
              aria-label="Sizing example input"
              aria-describedby="inputGroup-sizing-sm"
              placeholder="제목을 입력해주세요"
            />
          </div>
        </div>
      </div>
   

  
     
      <div class="my_inputbigflex">
      <div class="my_inputflex">
      <div class="input-group input-group-lg">
        <span class="input-group-text" id="inputGroup-sizing-lg">경력사항</span>
        <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
      </div>
      <div class="input-group input-group-lg">
        <span class="input-group-text" id="inputGroup-sizing-lg">상세급여</span>
        <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
      </div>
    </div>
      </div>

      <div class="my_inputbigflex">
        <div class="my_inputflex">
        <div class="input-group input-group-lg">
          <span class="input-group-text" id="inputGroup-sizing-lg">근무형태</span>
          <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
        </div>
        <div class="input-group input-group-lg">
          <span class="input-group-text" id="inputGroup-sizing-lg">모집인원</span>
          <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
        </div>
      </div>
        </div>
        <!-- 경력박스 끝 -->
<!-- 기술선택 -->
<div class="my_hr">
    <div class="input-group mb-3">
        <select class="form-select" id="inputGroupSelect02">
          <option selected>Choose...</option>
          <option value="1">Java</option>
          <option value="2">C+</option>
          <option value="3">Js</option>
        </select>
        <label class="input-group-text" style="background: rgb(255, 230, 104); color: white;" for="inputGroupSelect03">기술스택</label>
      </div>
    </div>

<!-- 기술선택 -->

<!-- 근무지역 name-->
<div class="my_allbox">
    <div class="my_hrname">
    <h2>근무지역</h1>
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
    <form class="my_formclass">
        <input class="form-control" type="text" placeholder="주소입력" aria-label="default input example">
        <button type="button" class="btn btn-primary">주소찾기</button>
    </form>
      
</div>
<form class="my_formclass2">
<input class="form-control" type="text" placeholder="상세주소" aria-label="default input example">
</form>
</div>
   <!--주소 끝  -->
<!-- 섬머노트 -->
<form class="my_summernote">
  <div id="summernote"><p>Hello Summernote</p></div>
</form>
<div class="my_summernotebtn">
<button type="button" class="btn btn-primary">등록하기</button>
</div>
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
  </script>




<%@ include file="../layout/footer.jsp" %>