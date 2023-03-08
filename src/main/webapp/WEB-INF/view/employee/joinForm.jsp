<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
    
        <link rel="stylesheet" href="/css/joinForm.css">
        
        <br />
        <br />
        <div class="d-flex justify-content-center" style="width: 100%;">
            <div class="" style="width: 30%">
                <form action="/employee/join" method="post">
                    <div class="mb-4">
                        <h3>
                            개인 회원가입
                        </h3>
                    </div>
                    <div class="mb-1">

                        <div class="">
                            <div class="main_yellow_label mb-1">아이디</div>
                            <div class="mb-2">
                                <input class="form-control" type="text" id="employee_username" placeholder="아이디를 입력하세요"
                                    name="employeeName" required>
                            </div>
                        </div>

                        <div class="">
                            <div class="main_yellow_label mb-1">비밀번호</div>
                            <div class="mb-1">
                                <input class="form-control" type="password" id="employee_password"
                                    placeholder="비밀번호를 입력하세요" name="employeePassword" required>
                            </div>
                            <div class="mb-2">
                                <input class="form-control" type="password" id="employee_repassword" placeholder="비밀번호 확인"
                                    required>
                            </div>
                        </div>

                        <div class="">
                            <div class="main_yellow_label mb-1">이메일</div>
                            <div class="my_flex mb-2">
                                <input class="form-control d-inline-flex" style="width: 60%;" type="text"
                                    id="employeeEmail" placeholder="이메일을 입력하세요" name="employeeEmail" required>
                                <select id="email_class" name="employeeEmail" class="main_select_box p-1" style="width: 38.8%">
                                    <option value="@naver.com">naver.com</option>
                                    <option value="@nate.com">nate.com</option>
                                    <option value="@gmail.com">gmail.com</option>
                                    <option value="@daum.net">daum.net</option>
                                    <option value="@hanmail.net">hanmail.net</option>
                                </select>
                            </div>
                        </div>
                        <div class="mb-1">
                            <div class="main_yellow_label mb-1">이름</div>
                            <input class="form-control mb-2" type="text" id="employee_fullname" placeholder="이름을 입력하세요"
                                name="employeeFullname" required>
                        </div>

                        <div class="mb-1">
                            <div class="main_yellow_label mb-1">생일</div>
                            <input class="form-control mb-2" type="date" id="employee_birth" name="employeeBirth"></label>
                        </div>
                        <div class="mb-1">
                            <div class="main_yellow_label mb-1">연락처</div><br />
                            <select name="employeeTel" id="employee_tel_first" class="main_select_box me-1 p-1" style="width: 25%">
                                <option value="010">010</option>
                                <option value="016">016</option>
                                <option value="011">011</option>
                                <option value="02">02</option>
                                <option value="051">051</option>
                                <option value="052">052</option>
                                <option value="053">053</option>
                                <option value="054">054</option>
                                <option value="031">031</option>
                                <option value="032">032</option>
                            </select>
                            <input class="form-control d-inline-flex mb-2" style="width: 72.5%;" type="tel"
                                id="employee_tel_last" placeholder="'-'없이 입력해주세요" name="employeeTel" required>
                        </div>
                        <div class="mb-1">
                            <div class="main_yellow_label mb-2">성별</div>
                            <div class="d-flex justify-content-end">
                                <label class="px-4">
                                    <input type="radio" name="employeeGender" value="M" checked>남성
                                </label>
                                <label>
                                    <input type="radio" name="employeeGender" value="F">여성
                                </label>
                            </div>
                        </div>
                        <div class="">
                            <div class="main_yellow_label mb-1">주소</div> <br />
                            <div>
                                <input class="form-control mb-1 d-inline-flex" style="width: 73.5%;" type=" text"
                                    id="employee_address" placeholder="주소를 입력하세요"  name="addr2" value="${address2}" required>
                                <button type="button"  onclick="execPostCode();" class="main_gray_btn" style="width: 25%">주소찾기
                                </button>
                            </div>

                            <div>
                                <input class=" form-control mb-2" type="text" id="employee_address_add"
                                    placeholder="상세주소를 입력하세요" name="employeeAddress" required>
                            </div>
                        </div>

                        <div class="">
                            <div class=" main_yellow_label mb-1">약&nbsp;관
                            </div>
                            <div class="border border-1" style="border-radius: 10px;">
                                <div class="ms-3 me-3 mt-3 mb-3">
                                    <div class="h6" style="color: rgb(94, 94, 94);">
                                        <input type="checkbox" id="check-all">
                                        <b>&nbsp;전체동의</b>
                                    </div>

                                    <div>
                                        <input type='checkbox' name='check' />&nbsp;(필수) 개인회원 약관에 동의<br />
                                        <textarea name="" id="" cols="30" rows="3" class="mt-1"
                                            style="text-align: left; width: 100%;">여러분을 환영합니다. 로동인 서비스 및 제품(이하 '서비스')을 이용해 주셔서 갑사합니다. 본 약관은 다양한 로동인 서비스의 이용과 관련하여 로동인 서비스를 제공하는 로동인과 이를 이용하는 로동인 서비스 회원또는 비회원, 기업회원과의 관계를 설명하며, 아울러 여러분의 로동인 서비스 이용에 도움이 될 수 있는 이용 약관입니다.</textarea>
                                    </div>
                                    <div>
                                        <input type='checkbox' name='check' />&nbsp;(필수) 개인회원 약관에 동의<br />
                                        <textarea name="" id="" cols="30" rows="3" class="mt-1"
                                            style="text-align: left; width: 100%;">여러분을 환영합니다. 로동인 서비스 및 제품(이하 '서비스')을 이용해 주셔서 갑사합니다. 본 약관은 다양한 로동인 서비스의 이용과 관련하여 로동인 서비스를 제공하는 로동인과 이를 이용하는 로동인 서비스 회원또는 비회원, 기업회원과의 관계를 설명하며, 아울러 여러분의 로동인 서비스 이용에 도움이 될 수 있는 이용 약관입니다.</textarea>
                                    </div>
                                    <div>
                                        <input type='checkbox' name='check' />&nbsp;(필수) 개인회원 약관에 동의<br />
                                        <textarea name="" id="" cols="30" rows="3" class="mt-1"
                                            style="text-align: left; width: 100%;">여러분을 환영합니다. 로동인 서비스 및 제품(이하 '서비스')을 이용해 주셔서 갑사합니다. 본 약관은 다양한 로동인 서비스의 이용과 관련하여 로동인 서비스를 제공하는 로동인과 이를 이용하는 로동인 서비스 회원또는 비회원, 기업회원과의 관계를 설명하며, 아울러 여러분의 로동인 서비스 이용에 도움이 될 수 있는 이용 약관입니다.</textarea>
                                    </div>
                                    <div>
                                        <input type='checkbox' name='check' />&nbsp;(필수) 개인회원 약관에 동의<br />
                                        <textarea name="" id="" cols="30" rows="3" class="mt-1"
                                            style="text-align: left; width: 100%;">여러분을 환영합니다. 로동인 서비스 및 제품(이하 '서비스')을 이용해 주셔서 갑사합니다. 본 약관은 다양한 로동인 서비스의 이용과 관련하여 로동인 서비스를 제공하는 로동인과 이를 이용하는 로동인 서비스 회원또는 비회원, 기업회원과의 관계를 설명하며, 아울러 여러분의 로동인 서비스 이용에 도움이 될 수 있는 이용 약관입니다.</textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex justify-content-center mt-3 mb-5">
                        <button class="main_blue_btn" type="submit" style="border:none;">
                            회원가입
                        </button>
                    </div>
                </form>
            </div>
        </div>


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
<script>
   function execPostCode() {
         new daum.Postcode({
             oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                console.log(data.zonecode);
                console.log(fullRoadAddr);
                
                
                $("[name=addr1]").val(data.zonecode);
                $("[name=addr2]").val(fullRoadAddr);
                
                /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
                document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
            }
         }).open();
     }

     </script>
        <%@ include file="../layout/footer.jsp" %>