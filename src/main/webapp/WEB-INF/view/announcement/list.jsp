<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ include file="../layout/header.jsp" %>

<link rel="stylesheet" href="/css/announcement.css"/>

<!-- 검색바 -->
<div class="my_search">
  <div class="input-group mb-3">
    <input
      type="text"
      class="form-control"
      placeholder="목요일 저녁, 딸 마고에게 걸려온 부재중전화..."
      aria-label="Recipient's username"
      aria-describedby="button-addon2"
    />
    <button class="btn btn-outline-secondary" type="button" id="button-addon2">
      Search
    </button>
  </div>
</div>

<!-- main card -->
<div class="my_card">
  <div class="card">
    <img
      src="${listview[0].companyThumbnail}"
      class="card-img-top"
      alt="Card image"
    />

    <div class="card-body">
      <h5 class="card-title">${listview[0].announcementTitle}</h5>
      <p class="card-text">2023 ${listview[0].companyFullname}</p>
      <a href="/announcement/${listview[0].id}" class="btn btn-primary">지원하기</a>
    </div>
  </div>
  <div class="card">
    <img
      src="${listview[1].companyThumbnail}"
      class="card-img-top"
      alt="sk"
    />

    <div class="card-body">
      <h5 class="card-title">${listview[1].announcementTitle}</h5>
      <p class="card-text">2023 ${listview[1].companyFullname}</p>
      <a href="/announcement/${listview[1].id}" class="btn btn-primary">지원하기</a>
    </div>
  </div>
  <div class="card">
    <img
      src="${listview[2].companyThumbnail}"
      class="card-img-top"
      alt="samsung"
    />

    <div class="card-body">
      <h5 class="card-title">${listview[2].announcementTitle}</h5>
      <p class="card-text">2023 ${listview[2].companyFullname}</p>
      <a href="/announcement/${listview[2].id}" class="btn btn-primary">지원하기</a>
    </div>
  </div>
  <div class="card">
    <img
      src="${listview[3].companyThumbnail}"
      class="card-img-top"
      alt="kakao"
    />

    <div class="card-body">
      <h5 class="card-title">${listview[3].announcementTitle}</h5>
      <p class="card-text">2023 ${listview[3].companyFullname}</p>
      <a href="/announcement/${listview[3].id}" class="btn btn-primary">지원하기</a>
    </div>
  </div>
</div>

<!-- 줄과 기술스택 -->
<hr />
<br />
<div class="my_hr">
  <div class="input-group mb-3">
    <select class="form-select" id="inputGroupSelect02">
      <option selected>Choose...</option>
      <c:forEach items="${stacks}" var="stack">
      <option value="${stack.id}">${stack.stackName}</option>
      </c:forEach>
    </select>
    <label
      class="input-group-text"
      style="background: rgb(255, 230, 104); color: white"
      for="inputGroupSelect03"
      >기술스택</label
    >
  </div>
</div>
<!-- -->

<!--  -->

<c:forEach items="${listview}" var="list">
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingOne">
      <button
        class="accordion-button collapsed"
        type="button"
         data-bs-toggle="collapse"
        data-bs-target="#collapseOne"
        aria-expanded="false"
        aria-controls="collapseOne" 
      >
        <div class="my_cir">
          <strong class="my_sstrong">${list.id}</strong>
        </div>
        <span class="my_span">${list.announcementTitle}</span>
        <span class="my_span2">${list.companyFullname}</span> //!!
      </button>
    </h2>
    <div
     id="collapseOne"
      class="accordion-collapse collapse"
      aria-labelledby="headingOne"
      data-bs-parent="#accordionExample" 
    >
      <div class="accordion-body">
        <span>${list.announcementContent}</span>
      </div>
    </div>
    <div class="my_deletebtnanddetail">
    <div class="my_button_ooo">
      <button onclick="deleteById(${list.id})" type="button" class="btn btn-warning">삭제하기</button>
    </div>
     <div class="my_button_ooo" >
      <a href="/announcement/${list.id}" class="btn btn-primary">지원하기</a>
    </div>
    </div>
  </div>
</div>
</c:forEach>
<%--  --%>
<div class="my_lastbuttonbig">
<div class="my_lastbutton">
<button id="savebtn" type="button" class="btn btn-primary ">공고등록하기</button>
</div>
</div>
<!-- 페이징 -->


<script>
 let data = {
            id: $("#id").val()}
  
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
