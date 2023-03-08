<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
 <link rel="stylesheet" href="/css/applyList.css" />

<div>
    <div>
        <h2 class="my_title">지원자 리스트</h2>
    </div>
    <div>
        <c:forEach items="${applys}" var="apply" varStatus="status">
            <div class="my_yellow_box mb-3">
                <div class="my_yellow_box_margin">
                    <div class="d-flex justify-content-between">
                        <div>
                            <div class="d-flex">
                                <div class="my_info_thumbnail m-2">
                                    <img class="card-img-top" src="/images/profile.png" alt="Card image">
                                </div>
                                <div class="m-2">
                                    <div class="mb-3">
                                        <span class="m-1" style="font-weight: bold; font-size: 20px;">${apply.employeeFullname}</span>
                                    </div>
                                    <div class="d-flex mb-1">
                                        <span class="m-1" style="font-weight: bolder;">지역 </span>
                                        <span class="m-1">| ${apply.employeeAddress} | </span>
                                        <span class="m-1" style="color: blue;"> 전체 포트폴리오</span>
                                        <div class="m-1">
                                            <i class="fa-sharp fa-solid fa-download"></i>
                                    </div>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <hr/ style="width: 500px;">
                            </div>
                            <div>
                                <span class="m-2" style="font-weight: bolder;">이력서 제목</span>
                                <span class="m-2"><b class="fw-bold">${apply.resumeTitle}</b></span>
                                <div class="d-flex justify-content-md-between">
                                    <div class="d-flex">
                                        <span class="m-2" style="font-weight: bolder;">경력</span>
                                        <span class="m-2">${apply.companyName}</span>
                                    </div>
                                    <div class="d-flex">
                                        <span class="m-2" style="font-weight: bolder;">기술스택</span>
                                        <span class="m-2">${apply.stackName}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="d-flex" style="height: 200px;">
                                <div class="vr" style="margin-left: 30px;"></div>
                            </div>
                        </div>
                        <div class="ms-5 m-4 align-items-center" style="width: 130px;">
                            <div>
                                <span class="m-1" style="font-size: large; font-weight: bolder;">
                                    ₩ <fmt:formatNumber value="${apply.resumeSalary}" /> 만
                                </span>
                            </div>
                            <div style="height: 90px;"></div>
                            <div>
                                <a href="/resume/${apply.resumeId}/detail" class="my_main_yellow_btn">이력서보기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<%@ include file="../layout/footer.jsp" %>
