<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>

    <link rel="stylesheet" href="/css/resumeForm.css">

    <div class="my_info_insert">
        <div class="my_title">
            <h2>이력서 등록</h2>
        </div>
        <div class="my_yellow_box">
            <div class="my_info_box_margin">
                <div>
                    <div class="d-flex justify-content-between">
                        <div>
                            <div class="my_name">
                                <h3>박지연</h3>
                            </div>

                            <div class="d-flex">
                                <div>
                                    <div>
                                        <span class="my_info_title">생년월일</span>
                                        <span class="my_info">1995-05-10</span>
                                    </div>
                                    <div>
                                        <span class="my_info_title">연락처</span>
                                        <span class="my_info">010-9626-4682</span>
                                    </div>
                                </div>
                                <div class="my_info_title_margin">
                                    <div>
                                        <span class="my_info_title">주소</span>
                                        <span class="my_info">부산 진구 중앙대로 서면 하이뷰 더파크 409호</span>
                                    </div>
                                    <div>
                                        <span class="my_info_title">이메일</span>
                                        <span class="my_info">siki4682@naver.com</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="my_info_thumbnail">
                            <img class="card-img-top" src="images/profile.jfif" alt="Card image">
                        </div>

                    </div>
                </div>
            </div>
        </div>



        <div>
            <div class="my_sub_title_form">
                <div class="mb-2">
                    <span class="main_yellow_label mb-2">제목</span>
                </div>
                <div>
                    <input class="form-control my_resume_title_form mb-2" type="text" placeholder="이력서 타이틀 입력">
                </div>
            </div>

            <div class="mb-3">
                <div>
                    <span class="main_yellow_label mb-2">최종학력</span>
                </div>
                <div class="d-flex">
                    <input class="form-control my_last_degree_input" type="text" readonly value="아무대학 졸업">
                    <div>
                        <select name="" id="" class="main_select_box p-2">
                            <option value="">고등학교 졸업</option>
                            <option value="">대학 (2,3년)</option>
                            <option value="">대학교 (4년)</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="mb-3">
                <div class="d-flex mb-2">
                    <span class="main_yellow_label">경력사항</span>
                    <div class="form-check my_check">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" readonly>
                    </div>
                </div>
                <div class="align-items-center d-flex mb-2">
                    <div class="AA"></div>
                    <span class="my_list">회사명</span>
                    <input class="form-control my_career_input" type="text" readonly>
                </div>
                <div class="align-items-center d-flex mb-2">
                    <div class="AA"></div>
                    <span class="my_list">재직기간</span>
                    <input class="form-control my_career_input" type="text" readonly>
                </div>
            </div>

            <div>
                <div class="d-flex mb-2">
                    <span class="main_yellow_label">자격증</span>
                    <div class="form-check my_check">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" readonly>
                    </div>
                </div>
                <div class="mb-1">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="d-flex align-items-center mb-2">
                                <div class="AA"></div>
                                <span class="my_list">자격증명</span>
                                <input class="form-control my_license" type="text" readonly>
                            </div>
                        </div>
                        <div class="col-6 col-md-8">
                            <div class="d-flex align-items-center">
                                <div class="AA"></div>
                                <span class="my_list">발행처</span>
                                <input class="form-control my_util" type="text" readonly>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mb-2">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="d-flex align-items-center mb-2">
                                <div class="AA"></div>
                                <span class="my_list">자격증명</span>
                                <input class="form-control my_license" type="text" readonly>
                            </div>
                        </div>
                        <div class="col-6 col-md-8">
                            <div class="d-flex align-items-center">
                                <div class="AA"></div>
                                <span class="my_list">발행처</span>
                                <input class="form-control my_util" type="text" readonly>
                            </div>
                        </div>
                    </div>
                </div>

                <div>
                    <div class="d-flex mb-2">
                        <span class="main_yellow_label">기술스텍</span>
                        <div class="form-check my_check">
                            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" readonly>
                        </div>
                    </div>
                    <div class="mb-1">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="d-flex align-items-center mb-2">
                                    <div class="AA"></div>
                                    <span class="my_list">기술명</span>
                                    <input class="form-control my_license" type="text" readonly>
                                </div>
                            </div>
                            <div class="col-6 col-md-8">
                                <div class="d-flex align-items-center">
                                    <div class="AA"></div>
                                    <span class="my_list">활용도</span>
                                    <input class="form-control my_util" type="text" readonly>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mb-1">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="d-flex align-items-center mb-2">
                                    <div class="AA"></div>
                                    <span class="my_list">기술명</span>
                                    <input class="form-control my_license" type="text" readonly>
                                </div>
                            </div>
                            <div class="col-6 col-md-8">
                                <div class="d-flex align-items-center">
                                    <div class="AA"></div>
                                    <span class="my_list">활용도</span>
                                    <input class="form-control my_util" type="text" readonly>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="my_sub_title_form">
                <div class="d-flex mb-3">
                    <span class="main_yellow_label">자기소개서</span>
                </div>
                <div class="form-group my_summernote">
                    <textarea class="form-control summernote" rows="5" id="content" name="content"></textarea>
                </div>
            </div>
            <div class="my_sub_title_form">
                <div class="d-flex mb-3">
                    <span class="main_yellow_label">파일등록</span>
                </div>
                <div class="my_yellow_box">
                    <div class="my_arrow_box">
                        <!-- <i class="fa-solid fa-circle-arrow-up my_arrow"></i> -->
                        <i class="fa-solid fa-circle-up my_arrow"></i>
                    </div>
                    <div class="my_file_comment">
                        <span>등록할 파일을 선택해 주세요 (최대 1개, 10MB)</span>
                    </div>
                </div>

                <div>
                    <div class="button_center d-flex justify-content-center">
                        <a href="" class="main_blue_btn" type="submit">등록</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $('.summernote').summernote({
            tabsize: 2,
            height: 400
        });
    </script>

     <%@ include file="../layout/footer.jsp" %>