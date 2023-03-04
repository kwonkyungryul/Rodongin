<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ include file="../layout/header.jsp" %>

    <link rel="stylesheet" href="/css/resumeForm.css" />

    <div class="my_info_insert">
      <div class="d-flex justify-content-between align-items-center">
        <div class="my_title">
          <h2>개인정보</h2>
        </div>
        <div class="button_center" style="margin-top: 15px">
          <a href="/employee/updateForm" class="main_blue_btn" type="submit">수정</a>
        </div>
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
                      <span class="my_info_title">아이디</span>
                      <span class="my_info">${empInfo.employeeName}</span>
                    </div>
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
          <c:forEach items="${empGraduates}" var="empGraduate">
            <div class="d-flex">
              <p class="my_text">${empGraduate.schoolName}</p>
            </div>
          </c:forEach>
        </div>

        <div class="mb-3">
          <div class="d-flex mb-2">
            <span class="main_yellow_label">경력사항</span>
          </div>

          <c:forEach items="${empCareer}" var="empCareer">
            <div class="d-flex">
              <div>
                <div class="align-items-center d-flex mb-2">
                  <div class="BB"></div>
                  <span class="my_list">회사명</span>
                  <p class="my_text">${empCareer.careerCompany}</p>
                </div>
              </div>
              <div class="align-items-center d-flex mb-2">
                <div class="BB"></div>
                <span class="my_list">재직기간</span>
                <p class="my_text">${empCareer.careerStart} ~ ${empCareer.careerEnd}</p>
              </div>
            </div>
          </c:forEach>
        </div>




        <div class="d-flex mb-2">
          <span class="main_yellow_label">자격증</span>
        </div>

        <c:forEach items="${empLicense}" var="empLicense">
          <div class="mb-1">
            <div class="row">
              <div class="col-md-4">
                <div class="d-flex align-items-center mb-2">
                  <div class="BB"></div>
                  <span class="my_list">자격증명</span>
                  <p class="my_text">${empLicense.licenseName}</p>
                </div>
              </div>
              <div class="col-6 col-md-8">
                <div class="d-flex align-items-center mb-2"">
                            <div class=" BB"></div>
                <span class="my_list">발행처</span>
                <p class="my_text">${empLicense.licenseIssuer}</p>
              </div>
            </div>
          </div>
      </div>
      </c:forEach>



      <div>
        <div class="d-flex mb-2">
          <span class="main_yellow_label">기술스텍</span>
        </div>
        <c:forEach items="${empStack}" var="empStack">
          <div class="mb-1">
            <div class="row">
              <div class="col-md-4">
                <div class="d-flex align-items-center mb-2">
                  <div class="BB"></div>
                  <span class="my_list">기술명</span>
                  <p class="my_text">${empStack.stackName}</p>
                </div>
              </div>
              <div class="col-6 col-md-8">
                <div class="d-flex align-items-center">
                  <div class="BB"></div>
                  <span class="my_list">활용도</span>
                  <p class="my_text">${empStack.stackAcquisition}</p>
                </div>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>

      <div>
        <div class="d-flex mb-2">
          <span class="main_yellow_label">이력서</span>
        </div>
      </div>

      <c:forEach items="${resumes}" var="resume">
        <div id="resume-${resume.id}" class="my_yellow_box mb-3">
          <div class="my_info_box_margin">
            <div class="d-flex justify-content-between">
              <div class="col-sm-9">
                <div class="row my_end">
                  <div class="col-8 col-sm-6">
                    <div class="my_name" style="display: inline-block">
                      <h4><a href="/resume/${resume.id}/detail"
                          style="color: black; font-weight:400">${resume.resumeTitle}</a></h4>
                    </div>
                    <div>
                      <span class="my_info_title">희망연봉</span>
                      <span class="my_info">${resume.resumeSalary} (만원)</span>
                    </div>
                    <div>
                      <span class="my_info_title">최종학력</span>
                      <span class="my_info">${resume.schoolName == null ? "해당사항 없음" : resume.schoolName}</span>
                    </div>
                  </div>
                  <div class="col-4 col-sm-6">
                    <div>
                      <span class="my_info_title">경력</span>
                      <span class="my_info">${resume.careerCompany == null ? "해당사항 없음" : resume.careerCompany}</span>
                    </div>
                    <div>
                      <span class="my_info_title">자격증</span>
                      <span class="my_info">${resume.licenseName == null ? "해당사항 없음" : resume.licenseName}</span>
                    </div>
                    <div>
                      <span class="my_info_title">기술스택</span>
                      <span class="my_info">${resume.stackName == null ? "해당사항 없음" : resume.stackName}</span>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-sm-2">
                <a href=""></a>
                <a href="" onClick="deleteByResumeId(${resume.id})"" class=" my_main_blue_btn" type="submit">삭제</a>
              </div>
            </div>
          </div>
        </div>
      </c:forEach>
      <div>
        <div class="button_center d-flex justify-content-center">
          <button class="main_blue_btn" type="submit">이력서 등록</button>
        </div>
      </div>
    </div>
    </div>
    </div>

    <script>
      function deleteByResumeId(resumeId) {
        $.ajax({
          type: "delete",
          url: "/resume/" + resumeId,
          dataType: "json",
        })
        done((res) => { // 20X일 때
          alert(res.msg);
          $("resume-${resume.id}").remove();
        })
          .fail((err) => { // 40X, 50X일 때
            alert(err.responseJSON.msg);
          })
      }
    </script>

    <%@ include file="../layout/footer.jsp" %>