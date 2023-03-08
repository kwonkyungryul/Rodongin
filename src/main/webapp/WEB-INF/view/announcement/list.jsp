<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ include file="../layout/header.jsp" %>

<link rel="stylesheet" href="/css/announcement.css"/>

<!-- main card -->
<div class="my_card">
  <div class="card">
    <img
      src="${listView[0].companyThumbnail}"
      class="card-img-top"
      alt="Card image"
    />

    <div class="card-body">
      <h5 class="card-title">${listView[0].announcementTitle}</h5>
      <p class="card-text">2023 ${listView[0].companyFullname}</p>
      <a href="/announcement/${listView[0].id}" class="btn btn-primary" style="background-color: rgb(51, 80, 200)">지원하기</a>
    </div>
  </div>
  <div class="card">
    <img
      src="${listView[1].companyThumbnail}"
      class="card-img-top"
      alt="sk"
    />

    <div class="card-body">
      <h5 class="card-title">${listView[1].announcementTitle}</h5>
      <p class="card-text">2023 ${listView[1].companyFullname}</p>
      <a href="/announcement/${listView[1].id}" class="btn btn-primary" style="background-color: rgb(51, 80, 200)">지원하기</a>
    </div>
  </div>
  <div class="card">
    <img
      src="${listView[2].companyThumbnail}"
      class="card-img-top"
      alt="samsung"
    />

    <div class="card-body">
      <h5 class="card-title">${listView[2].announcementTitle}</h5>
      <p class="card-text">2023 ${listView[2].companyFullname}</p>
      <a href="/announcement/${listView[2].id}" class="btn btn-primary" style="background-color: rgb(51, 80, 200)">지원하기</a>
    </div>
  </div>
  <div class="card">
    <img
      src="${listView[3].companyThumbnail}"
      class="card-img-top"
      alt="kakao"
    />

    <div class="card-body">
      <h5 class="card-title">${listView[3].announcementTitle}</h5>
      <p class="card-text">2023 ${listView[3].companyFullname}</p>
      <a href="/announcement/${listView[3].id}" class="btn btn-primary" style="background-color: rgb(51, 80, 200)">지원하기</a>
    </div>
  </div>
</div>

<!-- 줄과 기술스택 -->
<hr />
<!-- 검색바 -->
<form action="/announcement">
  <div class="" style="width: 1000px; margin: 0 auto;">
    <div class="input-group">
      <input type="text" class="form-control" id="search" name="content">
      <button type="submit" class="btn btn-primary" tyle="background-color: rgb(51, 80, 200)">검색</button>
    </div>
  </div>
</form>
<br />

<!-- -->

<!--  -->

<c:if test="${principal != null}" >
  <div class="d-flex justify-content-center">
    <h3 class="font_color_main">
      <span style="color: #000; font-weight: bold; font-size: 32px;">${principal.employeeFullname} </span><span style="color: #949494; font-weight: normal;">님을 위한 맞춤 공고</span>
    </h3>
  </div>
</c:if>
<c:forEach items="${listView}" var="list" varStatus="status">
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingOne">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
        <div class="my_cir">
          <strong class="my_sstrong">${status.index + 1}</strong>
        </div>

          <div class="my_louuuijs">
        <span class="my_span2" style="">${list.companyFullname} ${list.announcementTitle}</span> 
        </div>
      
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <span>${list.announcementContent}</span>
      </div>
    </div>
    <div class="my_deletebtnanddetail">
    <div class="my_button_ooo">
    <c:if test="${list.companyId == comPrincipal.id}" >
      <button onclick="deleteById(${list.id})" type="button" class="btn btn-warning" style="background-color: rgb(51, 80, 200)">삭제하기</button>
    </c:if>
    </div>
    <div class="my_button_ooo" >
      <a href="/announcement/${list.id}" class="btn btn-primary" style="background-color: rgb(51, 80, 200)">지원하기</a>
    </div>
    </div>
  </div>
</div>
</c:forEach>
<%--  --%>
<div class="my_lastbuttonbig">
<div class="my_lastbutton">
<c:if test="${comPrincipal.id != null}" >
<button id="savebtn" type="button" class="btn btn-primary " style="background-color: rgb(51, 80, 200)">공고등록하기</button>
</c:if>
</div>
</div>

<!-- 페이징 -->
<div class="d-flex justify-content-center mb-4">
          <c:if test="${prev}">
	        	<span class="p-0 page_btn btn-rounded" style="width: 48px;">
	        		<a href="/announcement?num=${startPageNum - 1}&content=${content}" class=""><<</a>
	        	</span>
	        </c:if>
	        <!-- //이전 -->
	        <c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
	        	<c:if test="${select == num}">
		        	<span class="p-0 page_btn btn-rounded bg_color_main text-center me-1" style="width: 48px;">
			            <a href="/announcement?num=${num}&content=${content}" class="select font_color_point text-white fw-bold fs-5 page-number member-page-number dp_in w_40 h_40 clr_w">${num}</a>
		        	</span>
		        </c:if>

		        <c:if test="${select != num}">
		        	<span class="p-0 page_btn btn-rounded text-center me-1" style="width: 48px;">
			            <a href="/announcement?num=${num}&content=${content}" class="fs-5 fw-bold page-number member-page-number dp_in w_40 h_40">${num}</a>
		        	</span>
		        </c:if>
		    </c:forEach>
		    
		    <!-- 다음 -->
		    <c:if test="${next}">
		       	<span class="p-0 page_btn btn-rounded" style="width: 48px;">
		       		<a href="/announcement?num=${endPageNum + 1}&content=${content}" class="">>></a>
		       	</span>
		    </c:if>
        	<!-- //다음 -->
		</div>


<script>
  let data = {
    id: $("#id").val()
  }
  
  $('#savebtn').click(function() {
      
    window.location.href = '/announcement/saveForm';
  });

function deleteById(id) {
  
    $.ajax({
        type: "delete",
        url: "/announcement/" + id,
        dataType: "json"
    }).done((res) => { 
        alert(res.msg);
        location.href = "/";
    }).fail((err) => { 
        alert(err.responseJSON.msg);
    });
}

</script>

<%@ include file="../layout/footer.jsp" %>
