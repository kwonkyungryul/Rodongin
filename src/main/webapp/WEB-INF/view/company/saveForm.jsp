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
                <input type="text" class="form-control" placeholder="회사명을 입력해주세요" name="company_info_fullname" id="companyFullname" value="${detailDto.companyFullname}" >
            </div>
            <div class="">
                <div class="main_yellow_label px-3 mb-2">설립일</div>
                <input type="date" class="form-control" placeholder="1995년 1월 1일" name="company_info_establish" id="companyEstablish" value="${detailDto.companyEstablish}">
            </div>
            <div class="">
                <div class="main_yellow_label px-3 mb-2">매출액</div>
                <input type="text" class="form-control" placeholder="예) 1억" name="company_info_sales" id="companySales"value="${detailDto.companySales}" >
            </div>
            <div class="">
                <div class="main_yellow_label px-3 mb-2">사원수</div>
                <input type="text" class="form-control" placeholder="예) 100명" name="company_info_employees_number" id="companyEmployeesNumber" value="${detailDto.companyEmployeesNumber}" >
            </div>
        </div>
        <div class="mb-2">
            <span class="main_yellow_label px-3">기업소개</span>
            <a href="#" class="main_yellow_label px-3 text-white bg_color_point">파일등록</a>
            <div class="mt-2">
                <textarea name="company_info_introduction"  id="companyIntroduction" class="form-control" rows="10" placeholder="기업 소개를 입력해주세요" >"${detailDto.companyIntroduction}" </textarea>
            </div>
        </div>
        <div class="mb-2">
            <span class="main_yellow_label px-4">연혁</span>
            <a href="#" class="main_yellow_label px-3 text-white bg_color_point">파일등록</a>
            <div class="mt-2">
                <textarea name="company_info_history"   id="companyHistory" class="form-control" cols="30" rows="10" placeholder="연혁을 입력해주세요"> "${detailDto.companyHistory}"</textarea>
            </div>
        </div>
        <div class="mb-2">
            <span class="main_yellow_label px-3">기업목표</span>
            <a href="#" class="main_yellow_label px-3 text-white bg_color_point">파일등록</a>
            <div class="mt-2">
                <textarea name="company_info_vision"  id="companyVision" class="form-control" cols="30" rows="10" placeholder="기업 목표를 입력해주세요">"${detailDto.companyVision}"</textarea>
            </div>
        </div>
        <div class="d-flex justify-content-end">
            <button onclick="savedetail(${detailDto.id})" class="main_blue_btn mb-3 mt-1">저장</button>
        </div>
    </div>
</div>

<script>
 function savedetail(id) {
       let data = {
            companyFullname: $("#companyFullname").val(),
            // companyThumbnail: $("#inputGroupSelect02").val(),
            companyEstablish: $("#companyEstablish").val(),
            companySales: $("#companySales").val(),
            companyEmployeesNumber: $("#companyEmployeesNumber").val(),
            companyIntroduction: $("#companyIntroduction").val(),
            companyHistory: $("#companyHistory").val(),
            companyVision: $("#companyVision").val()
        };
       

        $.ajax({
            type: "put",
            url: "/company/update",
            data: JSON.stringify(data),
            contentType: "application/json; charset=utf-8",
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