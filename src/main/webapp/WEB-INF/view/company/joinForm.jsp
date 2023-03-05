<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>

        <link rel="stylesheet" href="/css/joinForm.css">

        <br />
        <br />
        <div class="d-flex justify-content-center" style="width: 100%;">
            <div class="" style="width: 30%;">
                <form action="/company/join" method="post">
                    <div class="mb-4">
                        <h3>
                            기업 회원가입
                        </h3>
                    </div>
                    <div class="mb-1">

                        <div class="">
                            <div class="main_yellow_label mb-1">아이디</div>
                            <div class="mb-2">
                                <input class="form-control" type="text" id="company_username" placeholder="아이디를 입력하세요"
                                    name="companyUsername" required>
                            </div>
                        </div>

                        <div class="">
                            <div class="main_yellow_label mb-1">비밀번호</div>
                            <div class="mb-1">
                                <input class="form-control" type="password" id="company_password"
                                    placeholder="비밀번호를 입력하세요" name="companyPassword" required>
                            </div>
                            <div class="mb-2">
                                <input class="form-control" type="password" id="company_repassword"
                                    placeholder="비밀번호 확인" name="" required>
                            </div>
                        </div>

                        <div class="">
                            <div class="main_yellow_label mb-1">사업자등록번호</div>
                            <div class=" mb-2">
                                <input class="form-control" type="text" id="company_license_number"
                                    placeholder="사업자 등록번호를 입력하세요" name="companyLicenseNumber" required>
                            </div>
                        </div>

                        <div class="">
                            <div class="main_yellow_label mb-1">대표자 성함</div>
                            <div class=" mb-2">
                                <input class="form-control" type="text" id="company_ceo_name" placeholder="아이디를 입력하세요"
                                    name="companyCeoName" required>
                            </div>
                        </div>

                        <div class="">
                            <div class="main_yellow_label mb-1">기업명</div>
                            <div class="mb-2">
                                <input class="form-control" type="text" id="company_fullname" placeholder="아이디를 입력하세요"
                                    name="companyFullname" required>
                            </div>
                        </div>

                        <div class="mb-1">
                            <div class="main_yellow_label mb-1">기업 연락처</div><br />
                            <select id="employee_tel" class="main_select_box p-1" name="companyTel" style="width: 25%;">
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
                                id="company_tel" placeholder="'-'없이 입력해주세요" name="companyTel" required>
                        </div>
                        <div class="">
                            <div class="main_yellow_label mb-1">기업 주소</div>
                            <div>
                                <input class="form-control mb-2 d-inline-flex" style="width: 73.5%;" type=" text"
                                    id="company_address" placeholder="주소를 입력하세요" name="companyAddress" required>

                                <button type="button" class="main_gray_btn" style="width: 25%">주소찾기
                                </button>
                            </div>
                            <div>
                                <input class=" form-control mb-2" type="text" id="employee_address_add" rf
                                    placeholder="상세주소를 입력하세요" name="companyAddress" required>
                            </div>
                        </div>

                        <div class="">
                            <div class="main_yellow_label mb-1">이메일</div>
                            <div class="my_flex mb-1">
                                <input class="form-control d-inline-flex" style="width: 60%;" type="text" id="emp_email"
                                    placeholder="이메일을 입력하세요" name="companyEmail" required>
                                <select id="email_class" class="main_select_box p-1 mb-2" name="companyEmail"
                                    style="width: 38.8%;">
                                    <option value="@naver.com">@naver.com</option>
                                    <option value="@nate.com">@nate.com</option>
                                    <option value="@gmail.com">@gmail.com</option>
                                    <option value="@daum.net">@daum.net</option>
                                    <option value="@hanmail.net">@hanmail.com</option>
                                </select>
                            </div>
                        </div>

                        <div class="">
                            <div class=" main_yellow_label mb-1">약&nbsp;관
                            </div>
                            <div class="checkall border border-1" style="border-radius: 10px;">
                                <div class="ms-3 me-3 mt-3 mb-3">
                                    <!-- <div class="black-3"> 이걸로 설정시에는 약관의 패딩이 없어짐-->
                                    <div class="h6" style="color: rgb(94, 94, 94);">
                                        <input type='checkbox' name='check' value='selectall' id="checkbox"
                                            onclick='selectAll(this)'>
                                        <b>&nbsp;전체동의</b>
                                    </div>
                                    <div>
                                        <input type='checkbox' name='check' value='check_1' />&nbsp;(필수) 개인회원
                                        약관에
                                        동의<br />
                                        <textarea name="" id="" cols="30" rows="3" class="mt-1"
                                            style="text-align: left; width: 100%;">여러분을 환영합니다. 로동인 서비스 및 제품(이하 '서비스')을 이용해 주셔서 갑사합니다. 본 약관은 다양한 로동인 서비스의 이용과 관련하여 로동인 서비스를 제공하는 로동인과 이를 이용하는 로동인 서비스 회원또는 비회원, 기업회원과의 관계를 설명하며, 아울러 여러분의 로동인 서비스 이용에 도움이 될 수 있는 이용 약관입니다.</textarea>
                                    </div>
                                    <div>
                                        <input type='checkbox' name='check' value='check_1' />&nbsp;(필수) 개인회원 약관에
                                        동의<br />
                                        <textarea name="" id="" cols="30" rows="3" class="mt-1"
                                            style="text-align: left; width: 100%;">여러분을 환영합니다. 로동인 서비스 및 제품(이하 '서비스')을 이용해 주셔서 갑사합니다. 본 약관은 다양한 로동인 서비스의 이용과 관련하여 로동인 서비스를 제공하는 로동인과 이를 이용하는 로동인 서비스 회원또는 비회원, 기업회원과의 관계를 설명하며, 아울러 여러분의 로동인 서비스 이용에 도움이 될 수 있는 이용 약관입니다.</textarea>
                                    </div>
                                    <div>
                                        <input type='checkbox' name='check' value='select_2' />&nbsp;(필수) 개인회원 약관에
                                        동의<br />
                                        <textarea name="" id="" cols=" 30" rows="3" class="mt-1"
                                            style="text-align: left; width: 100%;">여러분을 환영합니다. 로동인 서비스 및 제품(이하 '서비스')을
                                        이용해 주셔서 갑사합니다. 본 약관은 다양한 로동인 서비스의 이용과 관련하여 로동인 서비스를 제공하는 로동인과 이를 이용하는 로동인 서비스
                                        회원또는 비회원, 기업회원과의 관계를 설명하며, 아울러 여러분의 로동인 서비스 이용에 도움이 될 수 있는 이용 약관입니다.</textarea>
                                    </div>
                                    <div>
                                        <input type='checkbox' name='check' value="select_3" />&nbsp;(필수) 개인회원 약관에
                                        동의<br />
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

        <script>
            function selectAll(selectAll) {
                const checkboxes
                    = document.getElementsByName('check');

                checkboxes.forEach((checkbox) => {
                    checkbox.checked = selectAll.checked;
                })
            }

        </script>

        <%@ include file="../layout/footer.jsp" %>