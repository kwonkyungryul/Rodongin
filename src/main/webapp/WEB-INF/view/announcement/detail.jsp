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
              <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#myModal" id="applyBtn">
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
    </c:if>













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
      <p class="my_formlongtext" style="border: 0px solid #949494; border-radius: 5px">
        ${announcement.announcementContent} Lorem ipsum dolor sit amet consectetur, adipisicing elit. Eum minus, eligendi at libero ex perferendis iusto laborum excepturi ratione exercitationem provident unde voluptatum deleniti eveniet repellendus tempora ducimus odio corporis neque ea facilis quas commodi quia aliquam! Tempora consectetur aspernatur dolorum dolore, minima voluptates error, itaque nostrum, officia minus dicta explicabo. Voluptatem odit praesentium laudantium velit debitis harum, numquam expedita sequi, vitae aut provident possimus rerum tempora. Recusandae, laboriosam voluptates. Quos accusantium sapiente quasi nihil. Pariatur sunt magnam perspiciatis, tempore neque nam iure assumenda molestias rem laborum vitae aut repellendus vero voluptate rerum. Hic provident rerum dolores. Explicabo, pariatur ipsa! Et quisquam fugit ipsa sapiente corrupti similique sint pariatur. Nihil provident deserunt delectus impedit numquam quaerat reiciendis eius dolorum deleniti, quis eum eaque in officiis dolor vel iste corrupti labore natus aperiam consectetur. Deleniti libero officia culpa fuga dolorum minima? Voluptate quos nam tenetur asperiores! Cum iusto sunt, quae suscipit nostrum deserunt amet cupiditate, commodi animi, beatae mollitia earum nobis id voluptate provident recusandae repellat molestias labore? Ad veniam ipsa fuga sint, suscipit quibusdam quisquam esse neque quia? Sed quos maxime dolorum tempora exercitationem odio magnam dicta recusandae assumenda. Illum id eveniet odio, beatae dolores rerum obcaecati harum tenetur nobis aperiam eum ut doloremque, molestias fuga magnam, ipsam quam autem. Nisi distinctio libero vel explicabo modi corporis laboriosam sed, veritatis nostrum neque, quisquam dolorum fugit similique quasi in, nobis ab molestias. Sed excepturi saepe quo perspiciatis impedit harum libero, delectus quidem laudantium blanditiis iusto et nobis quis necessitatibus praesentium molestias corrupti quos! Hic, enim aliquam atque accusamus sint natus pariatur nostrum blanditiis, voluptas iste magnam fuga iusto ducimus? Culpa voluptates quibusdam possimus quas dolorum autem quod, hic suscipit. Quos consectetur, commodi recusandae tempore distinctio delectus eum accusantium repellendus quod voluptas aspernatur ducimus rerum, vitae tenetur fuga quas alias animi vero nam officia harum? Dolores iure molestiae tenetur, repellendus repudiandae suscipit inventore officiis dolorem alias magnam obcaecati ex vero quae quo ad? Quidem voluptatem placeat aperiam ut similique architecto mollitia laudantium id, voluptate aut esse, aspernatur nam fugiat neque quaerat nobis cum a? Explicabo exercitationem tempore debitis ullam quam asperiores hic voluptate vero, fugit alias necessitatibus dolor neque nobis labore esse dolorum optio, ab sed non officia beatae, cumque corporis! Beatae, nam eos. Harum pariatur iure eos facilis voluptatibus placeat! Exercitationem itaque numquam possimus totam veniam voluptates temporibus sequi eaque molestiae. Animi vitae molestias vero illo repudiandae, iusto placeat commodi? Modi at consequuntur culpa delectus dolor rerum? Inventore, quo odit! Ducimus deleniti eius officia laborum beatae quae distinctio earum? Consequatur eum qui exercitationem, rem quidem quis? Consequatur sapiente cupiditate quidem ipsam illo debitis iure? Reprehenderit architecto nisi laudantium animi provident sequi? Recusandae id nobis itaque optio quis beatae, natus hic cumque nam, nisi necessitatibus! Modi quo incidunt adipisci inventore deleniti deserunt pariatur debitis laborum, et aliquid ea consequatur itaque earum, fugiat ipsam laboriosam tempora fugit! Officia harum eveniet quod molestiae cupiditate earum ad, assumenda facilis dolorem reprehenderit exercitationem nam esse repellendus. Quos dolorem vero facilis facere itaque, illo blanditiis odit dignissimos eaque, in optio, accusamus alias modi deserunt veritatis vel quae unde similique earum ab sint? Tempora sed cupiditate reprehenderit ea expedita incidunt animi a esse eaque cumque? Accusantium nisi omnis placeat quasi consequuntur exercitationem ad repellat velit commodi quas optio aperiam provident, magni ipsum totam minus dolores alias illo a quibusdam temporibus voluptatem eligendi labore! Odit adipisci similique dignissimos quia alias, ad, veniam totam libero odio quo, dolore assumenda qui tenetur asperiores eius aliquid id ullam sint hic! Mollitia iusto ad ipsa hic? Dolores eligendi cum laboriosam repudiandae nulla, eveniet quam! Sapiente, non. Velit laudantium ipsam enim explicabo consequatur, cumque ab aspernatur eaque incidunt, tempore, inventore nesciunt sapiente unde suscipit quae nemo. Nihil ea molestiae quae delectus repellat impedit magni saepe. Aut at ratione ipsa obcaecati nobis vero non numquam repudiandae sapiente eum placeat explicabo, quos, iusto porro omnis totam nisi sequi! Explicabo inventore, pariatur et nesciunt expedita quaerat at accusamus magnam vitae nihil minus officiis, eos ea magni mollitia qui ad dicta impedit sunt voluptates libero aliquid maiores? Quos corporis excepturi, blanditiis eius et obcaecati facere, qui beatae quae quas assumenda distinctio voluptatibus ea labore! Veritatis corporis ad dolorum fugiat aliquid, tempore explicabo aspernatur earum labore quam quasi ut inventore modi? Blanditiis dolorum sit adipisci architecto. Fugiat labore exercitationem voluptatum deserunt laborum aperiam iure dolore iusto numquam, explicabo aspernatur reiciendis eum corporis aliquid dolorum atque nam veritatis nisi! Cum accusantium beatae possimus fugit dolores vel amet suscipit blanditiis eius quo quidem dignissimos exercitationem eos fuga velit consectetur laboriosam ipsum perferendis, sapiente sunt corrupti. Ex dolores sed nihil. Atque velit molestias totam natus fugit exercitationem illo magnam earum nostrum incidunt labore recusandae ex optio, nihil molestiae tempora sunt consequuntur dolore, iure quasi aperiam neque. Fuga consequuntur totam rem natus. Officiis quae expedita illum nostrum dolores, modi atque facilis commodi voluptatum possimus earum animi rem ipsa, placeat ab odit soluta obcaecati dignissimos ipsum magnam aliquam ad sunt dolorum qui? Sint saepe ipsa fugiat autem! Maiores, optio facilis. Aut iste, quibusdam reprehenderit molestias est sint itaque, tenetur iusto deserunt minus illum ipsum aperiam, officia eius neque eveniet at totam adipisci non deleniti quod doloribus! Error vel asperiores commodi laboriosam corrupti harum iste fuga debitis animi possimus? Sint atque quos nulla, culpa molestias quod quibusdam nemo tempore excepturi iure animi perferendis explicabo commodi saepe in. Nemo, doloribus. Illo quod reiciendis temporibus cupiditate dolorem, porro suscipit quaerat repudiandae! Ducimus placeat dolor iure, molestiae aliquam exercitationem cumque rerum blanditiis recusandae quia ut soluta libero consequatur debitis suscipit qui. Amet veniam culpa dolorum voluptatum officiis tempora incidunt, molestiae explicabo! Praesentium nemo cum perspiciatis, odio perferendis error maiores qui quisquam officia, excepturi illo aperiam fugit vero amet voluptates aliquid. Velit quis cumque, autem veniam ipsam vitae impedit nemo aperiam commodi in placeat minus saepe quae nostrum earum ratione accusamus eos ipsum, debitis quasi nulla. Perferendis temporibus repellat rem harum fuga porro iste quae eveniet sequi sit, blanditiis laudantium dolore, quod, modi officiis tempore. Quia soluta fugiat tempore est. Velit nostrum accusamus impedit fugiat, aspernatur odit in dicta.
      </p>
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
        <c:if test="${announcement.companyId == comPrincipal.id}" >
        <a href="/announcement/${announcement.id}/updateForm" class="btn btn-warning">수정하기</a>
      </c:if>

      </div>
      <div class="my_lastbutton">
        <a href="/company/${announcement.companyId}" class="btn btn-primary ">기업정보 ></a>
      </div>

    </div>

    <script src="/js/announcementDetail.js"></script>


    <%@ include file="../layout/footer.jsp" %>