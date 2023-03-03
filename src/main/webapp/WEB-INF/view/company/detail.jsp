<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ include file="../layout/header.jsp" %>
<link rel="stylesheet" href="/css/company_detail.css" />

<div class="container">
  <div
    class="d-flex my-4 justify-content-between"
    style="width: 1000px; margin: 0 auto"
  >
    <div class="d-flex">
      <div class="p-2" style="border-radius: 20px; box-shadow: 2px 2px 5px">
        <img
          src="/images/kakao.jpg"
          width="50"
          height="50"
          alt="company logo"
        />
      </div>
      <div class="ml-3 mx-4">
        <h5>${detailDto.companyFullname}</h5>
      </div>
    </div>
    <div>
      <%-- asd --%>

     
      <c:if test="${detailDto.id == comPrincipal.id}" >
        <a href="/company/saveForm" class="main_blue_btn">수정</a>
      </c:if>
    </div>
  </div>
  <div class="cate_box my-4">
    <div class="row justify-content-between text-center">
      <div class="cate col-12 col-md-2 p-3">
        <a href="#" class="fw-bold">기업소개</a>
      </div>
      <div class="cate col-12 col-md-2 p-3">
        <a href="#" class="fw-bold">연혁</a>
      </div>
      <div class="cate col-12 col-md-2 p-3">
        <a href="#" class="fw-bold">기업목표</a>
      </div>
      <div class="cate col-12 col-md-2 p-3">
        <a href="#" class="fw-bold">기타</a>
      </div>
    </div>
  </div>
  <div
    class="d-flex justify-content-between text-center mb-4"
    style="width: 700px; margin: 0 auto"
  >
    <div class="">
      <i class="fas fa-history fa-4x font_color_main mb-1"></i>
      <p class="mb-1 fw-bold">설립일</p>
      <p class="mb-1 font_color_94">${detailDto.companyEstablish}</p>
    </div>
    <div class="">
      <i class="fas fa-building fa-4x font_color_main mb-1"></i>
      <p class="mb-1 fw-bold">매출액</p>
      <p class="mb-1 font_color_94">${detailDto.companySales}</p>
    </div>
    <div class="">
      <i class="fa-solid fa-users fa-3x font_color_main mb-1"></i>
      <p class="mb-1 fw-bold">사원수</p>
      <p class="mb-1 font_color_94">${detailDto.companyEmployeesNumber}</p>
    </div>
  </div>
  <div class="text-center fs-4 fw-bold">
    <p class="my-4">"Connect Everything"</p>
  </div>
  <div class="" style="width: 800px; margin: 0 auto">
    <p class="main_yellow_label w-100 px-3 py-2 fs-6 font_color_94 fw-normal">
      기업소개
    </p>
    <div class="px-3 fs-6">${detailDto.companyIntroduction}</div>
    <div class="px-3 fs-6"></div>
  </div>
  <div class="" style="width: 800px; margin: 0 auto">
    <p class="main_yellow_label w-100 px-3 py-2 fs-6 font_color_94 fw-normal">
      연혁
    </p>
    <div class="px-3 fs-6">${detailDto.companyHistory}</div>
  </div>
  <div class="" style="width: 800px; margin: 0 auto">
    <p class="main_yellow_label w-100 px-3 py-2 fs-6 font_color_94 fw-normal">
      기업목표
    </p>
    <div class="px-3 fs-6">${detailDto.companyVision}</div>
  </div>
</div>
<%@ include file="../layout/footer.jsp" %>