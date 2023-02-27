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



                            <div class="my_tab_content px-4" style="height: 250px">
                                <!-- 개인 로그인 시작 -->
                                <form action="/employee/login" method="post">
                                    <div id="employee_login_box">

                                        <div class="tab-pane fade show active mb-2" id=""
                                            aria-labelledby="employee_tab">
                                            <div class="mb-3">
                                                <label for="employee_id"><b>개인아이디</b></label>
                                                <input type="text" class="form-control" name="employeeName"
                                                    placeholder="아이디를 입력해주세요">
                                            </div>
                                            <div class="mb-3">
                                                <label for="password"><b>비밀번호</b></label>
                                                <input type="password" class="form-control" name="employeePassword"
                                                    placeholder="비밀번호를 입력해주세요">
                                            </div>
                                            <div class="mb-3">
                                                <input class="form-check-input" type="checkbox" id="employee-remember">
                                                <label class="form-check-label" for="employee-remember">
                                                    아이디 저장
                                                </label>
                                            </div>
                                            <div class="d-flex justify-content-end">
                                                <button type="submit" class="btn main_yellow_label">로그인</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <!-- 개인 로그인 종료 -->

                                <!-- 기업 로그인 시작 -->
                                <form action="/company/login" method="post">
                                    <div id="company_login_box">

                                        <div class="tab-pane fade show active" id="" aria-labelledby="company_tab">
                                            <div class="mb-3">
                                                <label for="company_id"><b>기업아이디</b></label>
                                                <input type="text" class="form-control" name="companyUsername"
                                                    placeholder="아이디를 입력해주세요">
                                            </div>
                                            <div class="mb-3">
                                                <label for="password"><b></b>비밀번호</label>
                                                <input type="password" class="form-control" name="companyPassword"
                                                    placeholder="비밀번호를 입력해주세요">
                                            </div>
                                            <div class="mb-3">
                                                <input class="form-check-input" type="checkbox" id="company-remember">
                                                <label class="form-check-label" for="company-remember">
                                                    아이디 저장
                                                </label>
                                            </div>
                                            <div class="d-flex justify-content-end">
                                                <button type="submit" class="btn main_yellow_label">로그인</button>
                                            </div>
                                        </div>

                                    </div>
                                </form>
                                <!-- 기업 로그인 종료 -->
                            </div>

                        </div>
                    </div>
                </div>
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
        <%@ include file="./layout/footer.jsp" %>