<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp" %>

<link rel="stylesheet" href="/css/company_saveForm.css">

<div class="container">
    <div class="" style="width: 1000px; margin: 0 auto;">
        <div class="d-flex my-4 justify-content-between">
            <div class="d-flex">
                <div class="p-2 me-3" style="border-radius: 20px; box-shadow: 2px 2px 5px;">
                    <img src="/images/kakao.jpg" width="80" height="80" alt="company logo">
                </div>
                <div class="d-flex align-items-end">
                    <a href="#" class="main_yellow_label px-3 text-white bg_color_point">사진수정</a>
                </div>
            </div>
        </div>
        <div class="d-flex justify-content-between mb-4">
            <div class="">
                <div class="main_yellow_label px-3 mb-2">회사명</div>
                <input type="text" class="form-control" placeholder="회사명을 입력해주세요" name="company_info_fullname">
            </div>
            <div class="">
                <div class="main_yellow_label px-3 mb-2">설립일</div>
                <input type="text" class="form-control" placeholder="1995년 1월 1일" name="company_info_establish">
            </div>
            <div class="">
                <div class="main_yellow_label px-3 mb-2">매출액</div>
                <input type="text" class="form-control" placeholder="예) 1억" name="company_info_sales">
            </div>
            <div class="">
                <div class="main_yellow_label px-3 mb-2">사원수</div>
                <input type="text" class="form-control" placeholder="예) 100명" name="company_info_employees_number">
            </div>
        </div>
        <div class="mb-2">
            <span class="main_yellow_label px-3">기업소개</span>
            <a href="#" class="main_yellow_label px-3 text-white bg_color_point">파일등록</a>
            <div class="mt-2">
                <textarea name="company_info_introduction" id="" class="form-control" rows="10" placeholder="기업 소개를 입력해주세요"></textarea>
            </div>
        </div>
        <div class="mb-2">
            <span class="main_yellow_label px-4">연혁</span>
            <a href="#" class="main_yellow_label px-3 text-white bg_color_point">파일등록</a>
            <div class="mt-2">
                <textarea name="company_info_history" id="" class="form-control" cols="30" rows="10" placeholder="연혁을 입력해주세요"></textarea>
            </div>
        </div>
        <div class="mb-2">
            <span class="main_yellow_label px-3">기업목표</span>
            <a href="#" class="main_yellow_label px-3 text-white bg_color_point">파일등록</a>
            <div class="mt-2">
                <textarea name="company_info_vision" id="" class="form-control" cols="30" rows="10" placeholder="기업 목표를 입력해주세요"></textarea>
            </div>
        </div>
        <div class="d-flex justify-content-end">
            <button class="main_blue_btn mb-3 mt-1">저장</button>
        </div>
    </div>
</div>

<%@ include file="../layout/footer.jsp" %>