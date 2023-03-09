<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ include file="../layout/header.jsp" %>

    <link rel="stylesheet" href="/css/announcementDetail.css" />



    <div class="my_centerbox">
      <div class="my_campname_d_day">
        <div class="d-flex">
          <div class="my_campname">
            <div>${announcement.companyFullname}</div>
            <div class="d-flex">
              <h1 class="mb-0">${announcement.companyFullname} </h1>
            </div>
          </div>
          
        </div>
        <!--  -->
            <c:if test="${comPrincipal == null}" >
          
              <div class="my_buttonsize d-flex align-items-end">
                  <div id="starBox" class="">
                    <button onclick="subscribe(${isSubscribe}, ${announcement.id})" class="star_box text-center d-flex justify-content-center px-3 ms-5 me-3 btn btn-outline-primary text-center">
                      <div class="">
                        <i class="${isSubscribe ? "fa-solid" : "fa-regular"} fa-star fs-5"></i>
                        <p class="m-0">${count}</p>
                      </div>
                    </button> 
                  </div>
                    <input id="isSubscribe" type="hidden" value="${isSubscribe}">
                    <input id="isSubscribe" type="hidden" value="${announcement.id}">
            <div class="my_d_day">
              <div class="my_ddaybox">
                <div>D-7</div>
              </div>
              <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#myModal" id="applyBtn"  >
                지원하기
              </button>
            </c:if>
            <input type="hidden" id="principalId" value="${principal.id == null ? 0 : 1}">
          </div>
        </div>
      </div>
    </div>

    

    <!-- 모달 창 -->
    <c:if test="${principal != null}" >
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
                  <input type="hidden" name="announcementId" value="${announcement.id}">
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
    </c:if>













    <!-- box -->
    <div class="my_inputboxsixa">
      <div class="my_inputboxsix">
        <div class="input-group input-group-sm mb-3">
          <span class="input-group-text main_yellow_label" id="inputGroup-sizing-sm">경력사항</span>
          <span class="m-1 ms-2" style="font-weight: bold;">${announcement.announcementCarrer}</span>

        </div>
        <div class="input-group input-group-sm mb-3">
          <span class="input-group-text main_yellow_label" id="inputGroup-sizing-sm">급여사항</span>
          <span class="m-1 ms-2" style="font-weight: bold;">${announcement.announcementSalary}</span>
        </div>
      </div>
    </div>


    <!-- box -->
    <div class="my_inputboxsixa">
      <div class="my_inputboxsix">
        <div class="input-group input-group-sm mb-3">
          <span class="input-group-text main_yellow_label" id="inputGroup-sizing-sm">근무형태</span>
          <span class="m-1 ms-2" style="font-weight: bold;">${announcement.announcementHireType}</span>
        </div>
        <div class="input-group input-group-sm mb-3">
          <span class="input-group-text main_yellow_label" id="inputGroup-sizing-sm">기술스택</span>
          <span class="m-1 ms-2" style="font-weight: bold;">${tostack.stackName}</span>

        </div>
      </div>
    </div>

    <div class="my_inputboxsixa">
      <div class="my_inputboxsix">
        <div class="input-group input-group-sm mb-3">
          <span class="input-group-text main_yellow_label" id="inputGroup-sizing-sm">근무지역</span>
          <span class="m-1 ms-2" style="font-weight: bold;">${announcement.announcementArea}</span>
        </div>
        <div class="input-group input-group-sm mb-3">
          <span class="input-group-text main_yellow_label" id="inputGroup-sizing-sm">모집인원</span>
          <span class="m-1 ms-2" style="font-weight: bold;">${announcement.announcementRecNum}</span>

        </div>
      </div>
    </div>



    <!-- box22 -->

    <!-- 정보box -->
    <form class="my_formlongtext1">
      <div class="my_formlongtext" style="border: 0px solid #949494; border-radius: 5px; width: 940px; margin: 0 auto;">
        ${announcement.announcementContent} 
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
       <img src="${announcement.companyThumbnail}" width="250"
          height="200" class="card-img-top" alt="sk" style="border-radius: 20px; box-shadow: 2px 2px 5px;" />
      </div>
      <!-- img 삽입 -->

      <!--정보box2  -->

      <div class="my_down">
        <div class="my_inputboxsixadown">
          <div class="my_inputboxsixdown">
            <div class="input-group input-group-sm mb-3">
              <span class="input-group-text main_yellow_label" id="inputGroup-sizing-sm">대표자명</span>
              <div class="m-1 ms-2" style="font-weight: bold ;">${announcement.companyCeoName}</div>
            </div>
            <div class="input-group input-group-sm mb-3" style="width: 400px;">
              <span class="input-group-text main_yellow_label" id="inputGroup-sizing-sm">설립일</span>
              <div class="m-1 ms-2" style="font-weight: bold; ">${announcement.companyEstablish}</div>
            </div>
          </div>
        </div>

        <div class="my_inputboxsixadown">
          <div class="my_inputboxsixdown">
            <div class="input-group input-group-sm mb-3" ">
              <span class="input-group-text main_yellow_label" id="inputGroup-sizing-sm">기업주소</span>
              <div class="m-1 ms-2" style="font-weight: bold; ">${announcement.companyAddress}</div>
            </div>
            <div class="input-group input-group-sm mb-3"style="width: 400px;">
              <span class="input-group-text main_yellow_label" id="inputGroup-sizing-sm">사원수</span>
              <div class="m-1 ms-2" style="font-weight: bold; ">${announcement.announcementRecNum}</div>
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
        <c:if test="${announcement.companyId == comPrincipal.id}" >
        <a href="/announcement/${announcement.id}/updateForm" class="btn btn-warning">수정하기</a>
      </c:if>

      </div>
      <div class="my_lastbutton">
        <a href="/company/${announcement.companyId}" class="btn btn-primary " style="background-color: rgb(51, 80, 200)">기업정보 </a>
      </div>

    </div>

    <script src="/js/announcementDetail.js"></script>


    <%@ include file="../layout/footer.jsp" %>