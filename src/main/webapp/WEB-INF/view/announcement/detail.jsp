<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ include file="../layout/header.jsp" %>

    <link rel="stylesheet" href="/css/announcementDetail.css" />


    <div class="my_centerbox">
      <div class="my_campname_d_day">
        <div class="my_campname">
          <div>${announcement.companyFullname}</div>
          <h1>${announcement.companyFullname}</h3>
        </div>
        <!--  -->
        <div class="my_d_day">
          <div class="my_ddaybox">
            <div>D-7</div>
          </div>
          <div class="my_buttonsize">
            <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#myModal">
              지원하기
            </button>
          </div>
        </div>
      </div>
    </div>

    <!-- 모달 창 -->
    <div class="modal fade" id="myModal" tabindex="-1">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">이력서 리스트</h4>
            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
          </div>


          <form action="/apply" method="post">
            <div class="modal-body">
              <c:forEach items="${resumes}" var="resume">
                <span>${resume.resumeTitle}</span> <input type="radio" name="resumeId" value="${resume.id}" id="">
                <br />
                <input type="hidden" name="announcementId" value="${delete.id}">
              </c:forEach>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
              <button type="submit" class="btn btn-primary">저장</button>
            </div>
          </form>


        </div>
      </div>
    </div>













    <!-- box -->
    <div class="my_inputboxsixa">
      <div class="my_inputboxsix">
        <div class="input-group input-group-sm mb-3">
          <span class="input-group-text" id="inputGroup-sizing-sm">경력사항</span>
          <span style="font-weight: bold;">${announcement.announcementCarrer}</span>

        </div>
        <div class="input-group input-group-sm mb-3">
          <span class="input-group-text" id="inputGroup-sizing-sm">급여사항</span>
          <span style="font-weight: bold;">${announcement.announcementSalary}</span>
        </div>
      </div>
    </div>


    <!-- box -->
    <div class="my_inputboxsixa">
      <div class="my_inputboxsix">
        <div class="input-group input-group-sm mb-3">
          <span class="input-group-text" id="inputGroup-sizing-sm">근무형태</span>
          <span style="font-weight: bold;">${announcement.announcementHireType}</span>
        </div>
        <div class="input-group input-group-sm mb-3">
          <span class="input-group-text" id="inputGroup-sizing-sm">기술스택</span>
          <span style="font-weight: bold;">${tostack.stackName}</span>

        </div>
      </div>
    </div>

    <div class="my_inputboxsixa">
      <div class="my_inputboxsix">
        <div class="input-group input-group-sm mb-3">
          <span class="input-group-text" id="inputGroup-sizing-sm">근무지역</span>
          <span style="font-weight: bold;">${announcement.announcementArea}</span>
        </div>
        <div class="input-group input-group-sm mb-3">
          <span class="input-group-text" id="inputGroup-sizing-sm">모집인원</span>
          <span style="font-weight: bold;">${announcement.announcementRecNum}</span>

        </div>
      </div>
    </div>



    <!-- box22 -->

    <!-- 정보box -->
    <form class="my_formlongtext1">
      <input class="my_formlongtext" type="text" value="${announcement.companyVision}">
      <div>

      </div>
    </form>

    <!-- 정보box -->
    <!-- 정보box2 -->
    <div class="my_endtext22">
      <div class="my_endtext">
        <div>${announcement.companyFullname}</div>
      </div>
    </div>

    <div class="my-fullbox">
      <!-- img 삽입 -->
      <div class="my_insertimg">
        <img src="${announcement.companyThumbnail}" class="card-img-top" alt="sk" />
      </div>
      <!-- img 삽입 -->

      <!--정보box2  -->

      <div class="my_down">
        <div class="my_inputboxsixadown">
          <div class="my_inputboxsixdown">
            <div class="input-group input-group-sm mb-3">
              <span class="input-group-text" id="inputGroup-sizing-sm">대표자명</span>
              <div style="font-weight: bold; ">${announcement.companyCeoName}</div>
            </div>
            <div class="input-group input-group-sm mb-3">
              <span class="input-group-text" id="inputGroup-sizing-sm">설립일</span>
              <div style="font-weight: bold; ">${announcement.companyEstablish}</div>
            </div>
          </div>
        </div>

        <div class="my_inputboxsixadown">
          <div class="my_inputboxsixdown">
            <div class="input-group input-group-sm mb-3">
              <span class="input-group-text" id="inputGroup-sizing-sm">기업주소</span>
              <div style="font-weight: bold; ">${announcement.companyAddress}</div>
            </div>
            <div class="input-group input-group-sm mb-3">
              <span class="input-group-text" id="inputGroup-sizing-sm">사원수</span>
              <div style="font-weight: bold; ">${announcement.announcementRecNum}</div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--  -->
    </div>

    <!-- 버튼 -->
    <div class="my_lastbuttonbig">
      <div class="my_lastbutton">
        <a href="/announcement/${announcement.id}/updateForm" class="btn btn-warning">수정하기</a>
      </div>
      <div class="my_lastbutton">
        <button type="button" class="btn btn-primary ">기업정보 ></button>
      </div>

    </div>
    <!--  -->



    <%@ include file="../layout/footer.jsp" %>