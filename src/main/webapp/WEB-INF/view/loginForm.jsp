<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="./layout/header.jsp" %>

        <link rel="stylesheet" href="/css/loginForm.css">


        <div class="my_container">
            <div class="col" style="height: 80px;">
            </div>
            <div class="row justify-content-center">
                <div class="col-md-9" style="width: 400px">
                    <div class="my_login_box">
                        <div class="my_border_radius">

                            <div class="my_login_nav mb-4 px-4">
                                <div class="mt-3 me-2">
                                    <button class="nav-link active" id="employee_tabs" data-bs-toggle="tab"
                                        data-bs-target="#employee_username"
                                        style="border: none; background-color: transparent;">
                                        <h3 class="me-1">개인</h3>
                                    </button>
                                </div>
                                <div class="md-1 mt-3">
                                    <button class="nav-link col" id="company_tabs" data-bs-toggle="tab"
                                        data-bs-target="#company_username"
                                        style="border: none; background-color: transparent;">
                                        <h3>기업</h3>
                                    </button>
                                </div>
                            </div>

                            <script>
                                $(document).ready(() => {
                                    $('#company_login_box').hide();
                                })
                                $('#employee_tabs').click(() => {
                                    $('#company_login_box').hide();
                                    $('#employee_login_box').show();
                                });

                                $('#company_tabs').click(() => {
                                    $('#employee_login_box').hide();
                                    $('#company_login_box').show();
                                });
                            </script>

                            <div class="my_tab_content px-4" style="height: 250px">
                                <!-- 개인 로그인 시작 -->
                                <div id="employee_login_box">

                                    <div class="tab-pane fade show active mb-2" id="employee_username"
                                        aria-labelledby="employee_tab">
                                        <div class="my_employee_container mb-3">
                                            <label for="employee_id"><b>개인아이디</b></label>
                                            <input type="text" class="form-control" name="employee_id"
                                                placeholder="아이디를 입력해주세요">
                                        </div>
                                        <div class="my_employee_container mb-3">
                                            <label for="password"><b>비밀번호</b></label>
                                            <input type="password" class="form-control" name="employee_password"
                                                placeholder="비밀번호를 입력해주세요">
                                        </div>
                                        <div class="my_employee_container mb-3">
                                            <input class="form-check-input" type="checkbox" id="employee-remember">
                                            <label class="form-check-label" for="employee-remember">
                                                아이디 저장
                                            </label>
                                        </div>
                                        <div class="my_employee_container d-flex justify-content-end">
                                            <button type="submit" class="btn"
                                                style="background-color: rgb(255, 230, 104); border: none">로그인</button>
                                        </div>
                                    </div>
                                </div>
                                <!-- 개인 로그인 종료 -->

                                <!-- 기업 로그인 시작 -->
                                <div id="company_login_box">
                                    <div class="tab-pane" id="company_username" aria-labelledby="company_tab">
                                        <div class="my_company_container">
                                            <label for="company_id">기업아이디</label>
                                            <input type="text" class="form-control" id="company_id"
                                                placeholder="아이디를 입력해주세요">
                                        </div>
                                        <div class="my_company_container">
                                            <label for="company_password">비밀번호</label>
                                            <input type="password" class="form-control" id="company_password"
                                                placeholder="비밀번호를 입력해주세요">
                                        </div>
                                        <div class="my_company_container mb-3">
                                            <input class="form-check-input" type="checkbox" id="company-remember">
                                            <label class="form-check-label" for="company-remember">
                                                아이디 저장
                                            </label>
                                        </div>
                                        <div class=" d-flex justify-content-end">
                                            <button type="submit" class="btn main_yellow_label">로그인</button>
                                        </div>
                                    </div>

                                </div>
                                <!-- 기업 로그인 종료 -->
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="./layout/footer.jsp" %>