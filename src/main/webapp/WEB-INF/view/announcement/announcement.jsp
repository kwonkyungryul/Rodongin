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
      src="/images/KT.jpg"
      class="card-img-top"
      alt="KT"
    />

    <div class="card-body">
      <h5 class="card-title">KT</h5>
      <p class="card-text">2023 신입/경력 모집</p>
      <a href="#" class="btn btn-primary">지원하기</a>
    </div>
  </div>
  <div class="card">
    <img
      src="/images/sk.png"
      class="card-img-top"
      alt="sk"
    />

    <div class="card-body">
      <h5 class="card-title">SK</h5>
      <p class="card-text">2023 신입/경력 모집</p>
      <a href="#" class="btn btn-primary">지원하기</a>
    </div>
  </div>
  <div class="card">
    <img
      src="/images/samsung.png"
      class="card-img-top"
      alt="samsung"
    />

    <div class="card-body">
      <h5 class="card-title">Samsung</h5>
      <p class="card-text">2023 신입/경력 모집</p>
      <a href="#" class="btn btn-primary">지원하기</a>
    </div>
  </div>
  <div class="card">
    <img
      src="/images/kakao.jpg"
      class="card-img-top"
      alt="kakao"
    />

    <div class="card-body">
      <h5 class="card-title">Kakao</h5>
      <p class="card-text">2023 신입/경력 모집</p>
      <a href="#" class="btn btn-primary">지원하기</a>
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
      <option value="1">Java</option>
      <option value="2">C+</option>
      <option value="3">Js</option>
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
          <strong class="my_sstrong">1</strong>
        </div>
        <span class="my_span">제약 산업 디지털 마케팅 기획자</span>
        <span class="my_span2">LG 화학</span>
      </button>
    </h2>
    <div
      id="collapseOne"
      class="accordion-collapse collapse"
      aria-labelledby="headingOne"
      data-bs-parent="#accordionExample"
    >
      <div class="accordion-body">
        <span>기업의 소개글</span>
      </div>
    </div>
    <div class="my_button_ooo">
      <button type="button" class="btn btn-primary">지원하기</button>
    </div>
  </div>
</div>
<!--  -->
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button
        class="accordion-button collapsed"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#collapseTwo"
        aria-expanded="false"
        aria-controls="collapseTwo"
      >
        <div class="my_cir">
          <strong class="my_sstrong">2</strong>
        </div>
        <span class="my_span">제약 산업 디지털 마케팅 기획자</span>
        <span class="my_span2">LG 화학</span>
      </button>
    </h2>
    <div
      id="collapseTwo"
      class="accordion-collapse collapse"
      aria-labelledby="headingTwo"
      data-bs-parent="#accordionExample"
    >
      <div class="accordion-body">
        <span>기업의 소개글</span>
      </div>
    </div>
    <div class="my_button_ooo">
      <button type="button" class="btn btn-primary">지원하기</button>
    </div>
  </div>
</div>

<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingThree">
      <button
        class="accordion-button collapsed"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#collapseThree"
        aria-expanded="false"
        aria-controls="collapseThree"
      >
        <div class="my_cir">
          <strong class="my_sstrong">3</strong>
        </div>
        <span class="my_span">제약 산업 디지털 마케팅 기획자</span>
        <span class="my_span2">LG 화학</span>
      </button>
    </h2>
    <div
      id="collapseThree"
      class="accordion-collapse collapse"
      aria-labelledby="headingThree"
      data-bs-parent="#accordionExample"
    >
      <div class="accordion-body">
        <span>기업의 소개글</span>
      </div>
    </div>
    <div class="my_button_ooo">
      <button type="button" class="btn btn-primary">지원하기</button>
    </div>
  </div>
</div>

<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingfour">
      <button
        class="accordion-button collapsed"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#collapsefour"
        aria-expanded="false"
        aria-controls="collapsefour"
      >
        <div class="my_cir">
          <strong class="my_sstrong">4</strong>
        </div>
        <span class="my_span">제약 산업 디지털 마케팅 기획자</span>
        <span class="my_span2">LG 화학</span>
      </button>
    </h2>
    <div
      id="collapsefour"
      class="accordion-collapse collapse"
      aria-labelledby="headingfour"
      data-bs-parent="#accordionExample"
    >
      <div class="accordion-body">
        <span>기업의 소개글</span>
      </div>
    </div>
    <div class="my_button_ooo">
      <button type="button" class="btn btn-primary">지원하기</button>
    </div>
  </div>
</div>

<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingfive">
      <button
        class="accordion-button collapsed"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#collapsefive"
        aria-expanded="false"
        aria-controls="collapsefive"
      >
        <div class="my_cir">
          <strong class="my_sstrong">5</strong>
        </div>
        <span class="my_span">제약 산업 디지털 마케팅 기획자</span>
        <span class="my_span2">LG 화학</span>
      </button>
    </h2>
    <div
      id="collapsefive"
      class="accordion-collapse collapse"
      aria-labelledby="headingfive"
      data-bs-parent="#accordionExample"
    >
      <div class="accordion-body">
        <span>기업의 소개글</span>
      </div>
    </div>
    <div class="my_button_ooo">
      <button type="button" class="btn btn-primary">지원하기</button>
    </div>
  </div>
</div>

<%@ include file="../layout/footer.jsp" %>
