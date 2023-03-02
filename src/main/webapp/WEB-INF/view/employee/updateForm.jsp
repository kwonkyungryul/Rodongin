<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ include file="../layout/header.jsp" %>

    <link rel="stylesheet" href="/css/employeeInfoForm.css">

    <div class="my_title">
      <h2>개인정보 수정</h2>
    </div>
    <div class="my_yellow_box">
      <div class="d-flex justify-content-between my_info_update_margin">
        <div>
          <div class="mb-2 d-flex align-items-center">
            <span class="my_info_update_span">아이디</span>
            <input class="form-control my_info_update_input" type="text" placeholder="Enter username"
              value="${empInfo.employeeName}" readonly />
          </div>
          <div class="mb-2 d-flex align-items-center">
            <span class="my_info_update_span">비밀번호</span>
            <input class="form-control my_info_update_input" type="password" value="${empInfo.employeePassword}"
              id="employeePassword" />
          </div>
          <div class="mb-2 d-flex align-items-center">
            <span class="my_info_update_span">이메일</span>
            <input class="form-control my_info_update_input" type="email" value="${empInfo.employeeEmail}"
              id="employeeEmail" />
          </div>
          <div class="mb-2 d-flex align-items-center">
            <span class="my_info_update_span">생년월일</span>
            <input class="form-control my_info_update_input" type="date" value="${empInfo.employeeBirth}"
              id="employeeBirth" />
          </div>
          <div class="mb-2 d-flex align-items-center">
            <span class="my_info_update_span">연락처</span>
            <input class="form-control my_info_update_input" type="text" value="${empInfo.employeeTel}"
              id="employeeTel" />
          </div>
          <div class="d-flex align-items-center">
            <span class="my_info_update_span">주소</span>
            <input class="form-control my_info_update_input" type="text" value="${empInfo.employeeAddress}"
              id="employeeAddress" />
          </div>
        </div>
        <div class="d-flex align-items-center">
          <div class="my_info_thumbnail me-4">
            <div class="form-group">
              <img
                src="${empInfo.employeeThumbnail == null ? '/images/Kakao.jpg' : empInfo.employeeThumbnail}"
                alt="Current Photo" class="img-fluid" id="imagePreview">
            </div>
            <%-- <input type="file" class="card-img-top" id="profile" name="profile" onchange="chooseImage(this)"> --%>
          </div>
        </div>
      </div>
    </div>

    <div class="button_center">
      <a href=""></a>
      <a onClick="updateById(${empInfo.id})" class="main_blue_btn" type="submit">수정</a>
    </div>
    <script>

      function updateById(id) {
        let data = {
          employeePassword: $("#employeePassword").val(),
          employeeEmail: $("#employeeEmail").val(),
          employeeBirth: $("#employeeBirth").val(),
          employeeTel: $("#employeeTel").val(),
          employeeAddress: $("#employeeAddress").val()
        };
        console.log(data.employeeBirth);
        $.ajax({
          type: "put",
          url: "/employee/" + id,
          data: JSON.stringify(data),
          contentType: "application/json; charset=utf-8",
          dataType: "json" // default : 응답의 mime 타입으로 유추함
        }).done((res) => { // 20X 일때
          alert(res.msg);
          location.href = "/employee/updateForm";
        }).fail((err) => { // 40X, 50X 일때
          alert(err.responseJSON.msg);
        });
      }
      // }
      // function chooseImage(obj) {
      //   //console.log(obj);
      //   //console.log(obj.files);
      //   let f = obj.files[0];
      //   if (!f.type.match("image.*")) {
      //     alert("이미지를 등록해야 합니다.");
      //     return;
      //   }
      //   let reader = new FileReader();
      //   reader.readAsDataURL(f);
      //   // 콜스택이 다 비워지고, 이벤트 루프로 가서 readAsDataURL 이벤트가 끝나면 콜백시켜주는 함수
      //   reader.onload = function (e) {
      //     console.log(e);
      //     console.log(e.target.result);
      //     $("#imagePreview").attr("src", e.target.result);
      //   }
      // }
    </script>

    <form action="/employee/save" method="post">
      <div class="my_info_insert">
        <div class="mb-3">
          <div>
            <span class="main_yellow_label mb-2">최종학력</span>
          </div>
          <div class="d-flex">
            <select name="schoolId" id="schoolId" class="main_select_box_school">
            <option value="0">선택해주세요</option>
              <c:forEach items="${schools}" var="school">
                <option value="${school.id}">${school.schoolName}</option>
              </c:forEach>
            </select>
            <div>
              <select name="schoolGraduate" id="schoolGraduate" class="main_select_box p-2">
                <option value="고등학교 졸업">고등학교 졸업</option>
                <option value="대학 (2,3년)">대학 (2,3년)</option>
                <option value="대학교 (4년)">대학교 (4년)</option>
              </select>
            </div>
          </div>
        </div>
    </form>

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
        <input name="careerCompany" id="careerCompany" class="form-control my_career_input" type="text" />
      </div>
      <div class="align-items-center d-flex mb-2">
        <div class="AA"></div>
        <span class="my_list">재직기간</span>
        <div class="d-flex my_career_input">
          <input name="careerStart" id="careerStart" class="form-control" type="date" value="0001-01-01" />
          <input name="careerEnd" id="careerEnd" class="form-control" type="date" value="0001-01-01"/>
        </div>
      </div>
    </div>

    <div>
      <div class="d-flex mb-2">
        <span class="main_yellow_label">자격증</span>
        <div class="form-check my_check">
          <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" />
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
              <input name="licenseIssuer" id="licenseIssuer" class="form-control my_util" type="text" />
            </div>
          </div>
        </div>
      </div>

      <div>
        <div class="d-flex mb-2">
          <span class="main_yellow_label">기술스텍</span>
          <div class="form-check my_check">
            <input class="form-check-input" type="checkbox" id="flexCheckDefault" />
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
                <input name="stackAcquistion" id="stackAcquistion" class="form-control my_util" type="text" />
              </div>
            </div>
          </div>
        </div>

      </div>
    </div>
    <div class="button_center">
      <button class="main_blue_btn" type="submit">등록</button>
    </div>
    </div>
    </form>


    <%@ include file="../layout/footer.jsp" %>