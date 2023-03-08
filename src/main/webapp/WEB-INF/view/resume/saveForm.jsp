<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>

        <link rel="stylesheet" href="/css/resumeForm.css">

        <div class="my_info_insert">
            <div class="my_title">
                <h2>이력서 등록</h2>
            </div>
            <div class="my_yellow_box">
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
                                <img src="${empInfo.employeeThumbnail == null ? '/images/profile.png' : empInfo.employeeThumbnail}"
                                    alt="Current Photo" class="img-fluid" id="imagePreview" />
                            </div>

                        </div>
                    </div>
                </div>
            </div>


            <div>
                <div class="my_sub_title_form">
                    <div class="mb-2">
                        <span class="main_yellow_label mb-2">제목</span>
                    </div>
                    <div>
                        <input name="resumeTitle" id="resumeTitle" class="form-control my_resume_title_form mb-2"
                            type="text" placeholder="이력서 타이틀 입력">
                    </div>
                </div>

                <div class="mb-3">
                    <div>
                        <span class="main_yellow_label mb-2">최종학력</span>
                    </div>
                    <div class="d-flex">
                        <select name="schoolId" id="schoolId" class="main_select_box p-2">
                            <option value="0">선택해주세요</option>
                            <c:forEach items="${schools}" var="school">
                                <option value="${school.id}">${school.schoolName}</option>
                            </c:forEach>
                        </select>
                        <div>
                            <select name="schoolGraduate" id="schoolGraduate" class="main_select_box p-2">
                                <option value="0">선택해주세요</option>
                                <option value="고등학교 졸업">고등학교 졸업</option>
                                <option value="대학 (2,3년)">대학 (2,3년)</option>
                                <option value="대학교 (4년)">대학교 (4년)</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="mb-3">
                    <div class="d-flex mb-2">
                        <span class="main_yellow_label">경력사항</span>
                        <div class="form-check my_check" id="isCareerCheck">
                            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" />
                        </div>
                    </div>
                    <div class="align-items-center d-flex mb-2">
                        <div class="AA"></div>
                        <span class="my_list">회사명</span>
                        <input name="careerCompany" id="careerCompany" class="form-control my_career_input"
                            type="text" />
                    </div>
                    <div class="align-items-center d-flex mb-2">
                        <div class="AA"></div>
                        <span class="my_list">재직기간</span>
                        <div class="d-flex my_career_input">
                            <input name="careerStart" id="careerStart" class="form-control" type="date"
                                value="0001-01-01" />
                            <input name="careerEnd" id="careerEnd" class="form-control" type="date"
                                value="0001-01-01" />
                        </div>
                    </div>
                </div>

                <div>
                    <div class="d-flex mb-2">
                        <span class="main_yellow_label">자격증</span>
                        <div class="form-check my_check">
                            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" readonly>
                        </div>
                    </div>
                    <div class="mb-1">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="d-flex align-items-center mb-2">
                                    <div class="AA"></div>
                                    <span class="my_list">자격증명</span>
                                    <select name="licenseId" id="licenseId" class="main_select_box_title">
                                        <option value="0">선택해주세요</option>
                                        <c:forEach items="${licenses}" var="license">
                                            <option value="${license.id}">${license.licenseName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="col-6 col-md-8">
                                <div class="d-flex align-items-center">
                                    <div class="AA"></div>
                                    <span class="my_list">발행처</span>
                                    <input id="licenseIssuer" name="licenseIssuer" class="form-control my_util" type="text">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div>
                        <div class="d-flex mb-2">
                            <span class="main_yellow_label">기술스텍</span>
                            <div class="form-check my_check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" readonly>
                            </div>
                        </div>
                        <div class="mb-1">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="d-flex align-items-center mb-2">
                                        <div class="AA"></div>
                                        <span class="my_list">기술명</span>
                                        <select name="stackId" id="stackId" class="main_select_box_title">
                                            <option value="0">선택해주세요</option>
                                            <c:forEach items="${stacks}" var="stack">
                                                <option value="${stack.id}">${stack.stackName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-6 col-md-8">
                                    <div class="d-flex align-items-center">
                                        <div class="AA"></div>
                                        <span class="my_list">활용도</span>
                                        <input name="stackAcquisition" id="stackAcquisition" class="form-control my_util" type="text" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="my_sub_title_form">
                    <div class="d-flex mb-3">
                        <span class="main_yellow_label">희망연봉</span>
                    </div>
                    <div class="d-flex align-items-center">
                        <div class="BB"></div>
                        <input name="resumeSalary" id="resumeSalary" class="form-control" style="width: 30%;"
                            type="number">
                        <p class="m-2"> (만 원)</p>
                    </div>
                </div>
            </div>
            <div class="my_sub_title_form">
                <div class="d-flex mb-3">
                    <span class="main_yellow_label">자기소개서</span>
                </div>
                <div class="form-group my_summernote">
                    <textarea class="form-control summernote" rows="5" id="CV" name="CV"></textarea>
                </div>
            </div>
            <div class="my_sub_title_form">
                <div class="d-flex mb-3">
                    <span class="main_yellow_label">파일등록</span>
                </div>
                <div class="my_yellow_box">
                    <div class="my_arrow_box">
                        <!-- <i class="fa-solid fa-circle-arrow-up my_arrow"></i> -->
                        <i class="fa-solid fa-circle-up my_arrow"></i>
                    </div>
                    <div class="my_file_comment">
                        <span>등록할 파일을 선택해 주세요 (최대 1개, 10MB)</span>
                    </div>
                </div>

                <div>
                    <div class="button_center d-flex justify-content-center">
                        <button onclick="save()" class="main_blue_btn" type="button">등록</button>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <script>
            function save() {
                let data = {
                    "resumeTitle": $("#resumeTitle").val(),
                    "resumeSalary": $("#resumeSalary").val(),
                    "cv": $("#CV").val(),
                    "schoolId": $("#schoolId").val(),
                    "schoolGraduate": $("#schoolGraduate").val(),
                    "careerCompany": $("#careerCompany").val(),
                    "careerStart": $("#careerStart").val(),
                    "careerEnd": $("#careerEnd").val(),
                    "licenseId": $("#licenseId").val(),
                    "licenseIssuer": $("#licenseIssuer").val(),
                    "stackId": $("#stackId").val(),
                    "stackAcquisition": $("#stackAcquisition").val()
                };

                $.ajax({
                    type: "post",
                    url: "/resume/save",
                    data: JSON.stringify(data),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json"
                }).done((res) => { // 20X 일때
                    alert(res.msg);
                    location.href = "/resume/" + res.data + "/detail";
                }).fail((err) => {
                    alert(err.responseJSON.msg);
                });
                console.log(data);
            }
        </script>
        <script>
            $('.summernote').summernote({
                tabsize: 2,
                height: 400
            });
        </script>

        <%@ include file="../layout/footer.jsp" %>