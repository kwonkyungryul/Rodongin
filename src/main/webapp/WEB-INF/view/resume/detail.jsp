<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>

        <link rel="stylesheet" href="/css/resumeForm.css">


        <div class="my_info_insert">
            <div class="my_title">
                <h2>MY 이력서</h2>
            </div>
            <div class="my_yellow_box mb-5">
                <div class="my_info_box_margin">
                    <div>
                        <div class="d-flex justify-content-between">
                            <div>
                                <div class="my_name">
                                    <h3>${empInfo.employeeFullname}</h3>
                                </div>

                                <div class="d-flex">
                                    <div>
                                        <div>
                                            <span class="my_info_title">생년월일</span>
                                            <span class="my_info">${empInfo.employeeBirth}</span>
                                        </div>
                                        <div>
                                            <span class="my_info_title">연락처</span>
                                            <span class="my_info">${empInfo.employeeTel}</span>
                                        </div>
                                    </div>
                                    <div class="my_info_title_margin">
                                        <div>
                                            <span class="my_info_title">주소</span>
                                            <span class="my_info">${empInfo.employeeAddress}</span>
                                        </div>
                                        <div>
                                            <span class="my_info_title">이메일</span>
                                            <span class="my_info">${empInfo.employeeEmail}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="my_info_thumbnail">
                                <img src="${empInfo.employeeThumbnail == null ? '/images/kakao.jpg' : empInfo.employeeThumbnail}"
                                    alt="Current Photo" class="img-fluid" id="imagePreview" />
                            </div>

                        </div>
                    </div>
                </div>
            </div>



            <div>


                <div class="mb-3">
                    <div>
                        <span class="main_yellow_label mb-2">최종학력</span>
                    </div>
                    <c:forEach items="${resumeGraduates}" var="resumeGraduates">
                        <div class="d-flex">
                            <p class="my_text ">${resumeGraduates.schoolName}</p>
                        </div>
                    </c:forEach>
                </div>

                <div class="mb-3">
                    <div class="mb-2">
                        <span class="main_yellow_label">경력사항</span>
                    </div>
                    <c:forEach items="${resumeCareers}" var="resumeCareers">
                        <div class="d-flex">
                            <div class="align-items-center d-flex mb-2">
                                <div class="BB"></div>
                                <span class="my_list">회사명</span>
                                <p class="my_text" style="width: 190px;">${resumeCareers.careerCompany}</p>
                            </div>
                            <div class="align-items-center d-flex mb-2">
                                <div class="BB"></div>
                                <span class="my_list">재직기간</span>
                                <p class="my_text">${resumeCareers.careerStart} ~ ${resumeCareers.careerEnd}</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div>
                    <div class="d-flex mb-2">
                        <span class="main_yellow_label">자격증</span>
                    </div>
                    <c:forEach items="${resumeLicense}" var="resumeLicense">
                    <div class="mb-1">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="d-flex align-items-center mb-2">
                                    <div class="BB"></div>
                                    <span class="my_list">자격증명</span>
                                    <p class="my_text">${resumeLicense.licenseName}</p>
                                </div>
                            </div>
                            <div class="col-6 col-md-8">
                                <div class="d-flex align-items-center">
                                    <div class="BB"></div>
                                    <span class="my_list">발행처</span>
                                    <p class="my_text">${resumeLicense.licenseIssuer}</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    </div>
                    

                    <div>
                        <div class="d-flex mb-2">
                            <span class="main_yellow_label">기술스텍</span>
                        </div>
                        <c:forEach items="${resumeStack}" var="resumeStack">
                        <div class="mb-1">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="d-flex align-items-center mb-2">
                                        <div class="BB"></div>
                                        <span class="my_list">기술명</span>
                                        <p class="my_text">${resumeStack.stackName}</p>
                                    </div>
                                </div>
                                <div class="col-6 col-md-8">
                                    <div class="d-flex align-items-center">
                                        <div class="BB"></div>
                                        <span class="my_list">활용도</span>
                                        <p class="my_text">${resumeStack.stackAcquisition}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="my_sub_title_form">
                    <div class="d-flex mb-3">
                        <span class="main_yellow_label">희망연봉</span>
                    </div>
                    <div class="d-flex align-items-center">
                        <div class="BB"></div>
                        <p class="my_text">${resume.resumeSalary} (만원)</p>
                    </div>
                </div>
                <div class="my_sub_title_form">
                    <div class="d-flex mb-3">
                        <span class="main_yellow_label">자기소개서</span>
                    </div>
                    <div class="mb-5">
                        <p>${resume.CV}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

        <%@ include file="../layout/footer.jsp" %>