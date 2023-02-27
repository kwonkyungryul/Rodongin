<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
    
        <link rel="stylesheet" href="/css/joinForm.css">
        
        <br />
        <br />
        <div class="d-flex justify-content-center" style="width: 100%;">
            <div class="" style="width: 30%">
                <form>
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
                                    name="employee_username" required>
                            </div>
                        </div>

                        <div class="">
                            <div class="main_yellow_label mb-1">비밀번호</div>
                            <div class="mb-1">
                                <input class="form-control" type="password" id="employee_password"
                                    placeholder="비밀번호를 입력하세요" name="employee_password" required>
                            </div>
                            <div class="mb-2">
                                <input class="form-control" type="password" id="employee_repassword" placeholder="비밀번호 확인"
                                    name="employee_repassword" required>
                            </div>
                        </div>

                        <div class="">
                            <div class="main_yellow_label mb-1">이메일</div>
                            <div class="my_flex mb-2">
                                <input class="form-control d-inline-flex" style="width: 60%;" type="email"
                                    id="employee_email" placeholder="이메일을 입력하세요" name="employee_email" required>
                                <select id="email_class" class="main_select_box" style="width: 38.8%">
                                    <option value="naver">naver.com</option>
                                    <option value="naver">nate.com</option>
                                    <option value="naver">gmail.com</option>
                                    <option value="naver">daum.net</option>
                                    <option value="naver">naver.com</option>
                                </select>
                            </div>
                        </div>
                        <div class="mb-1">
                            <div class="main_yellow_label mb-1">이름</div>
                            <input class="form-control mb-2" type="text" id="employee_fullname" placeholder="이름을 입력하세요"
                                name="employee_fullname" required>
                        </div>

                        <div class="mb-1">
                            <div class="main_yellow_label mb-1">생일</div>
                            <input class="form-control mb-2" type="date" id="employee_birth" name="employee_birth"></label>
                        </div>
                        <div class="mb-1">
                            <div class="main_yellow_label mb-1">연락처</div><br />
                            <select id="employee_tel_first" class="main_select_box me-1" style="width: 25%">
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
                                id="employee_tel_last" placeholder="'-'없이 입력해주세요" name="employee_tel_last" required>
                        </div>
                        <div class="mb-1">
                            <div class="main_yellow_label mb-2">성별</div>
                            <div class="d-flex justify-content-end">
                                <label class="px-4">
                                    <input type="radio" name="employee_gender" value="male" checked>남성
                                </label>
                                <label>
                                    <input type="radio" name="employee_gender" value="female">여성
                                </label>
                            </div>
                        </div>
                        <div class="">
                            <div class="main_yellow_label mb-1">주소</div> <br />
                            <div>
                                <input class="form-control mb-1 d-inline-flex" style="width: 73.5%;" type=" text"
                                    id="employee_address" placeholder="주소를 입력하세요" name="employee_address" required>
                                <button type="submit" class="main_gray_btn" style="width: 25%">주소찾기
                                </button>
                            </div>

                            <div>
                                <input class=" form-control mb-2" type="text" id="employee_address_add"
                                    placeholder="상세주소를 입력하세요" name="employtee_address_add" required>
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

        <%@ include file="../layout/footer.jsp" %>