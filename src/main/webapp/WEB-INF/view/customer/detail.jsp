<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ include file="../layout/header.jsp" %>


        <div class="container mt-3">
            <div class="d-flex justify-content-center" style="width: 100%;">
                <h3 class="border-bottom border-3 py-2" style="width: 70%; text-align: lift;">
                    <div class="container my-3">
                        <c:if test="${listDeails.employeeId == principal.id}">
                            <div class="mb-3">
                                <a href="/customer/${listDeails.id}/updateForm" class="btn bg_color_main">수정</a>
                                <button onclick="deleteById" ${listDeails.id}" class=" btn main_blue_btn
                                    d-inline-flex">삭제</button>
                            </div>
                        </c:if>
                    </div>
            </div>
        </div>

        <!-- <%-- <div class="card-footer">
            <button type="button" id="btn-reply-save" class="btn btn-primary">등록</button>
            </div> --%> -->
        <div class="mb-2">
            번호 : <span id="${listDeails.id}"><i>${listDeails.id} </i></span>&nbsp;&nbsp;&nbsp;작성자 : <span
                class="me-3"><i>${listDeails.employeeName}</i></span>
        </div>

        <!-- <%-- <i id="heart" class="fa-regular fa-heart my-xl my-cursor" value="no"></i> --%> -->

        <div>
            <h3>${listDeails.customerTitle}</h3>
        </div>
        <hr />
        <div>
            <div>${listDeails.customerContent}</div>
        </div>
        <hr />

        <div class="card">
            <!-- <%-- <form>
                        <div class="card-body">
                            <textarea id="reply-content" class="form-control" rows="1"></textarea>
                        </div>
                        <div class="card-footer">
                            <button type="button" id="btn-reply-save" class="btn btn-primary">등록</button>
                        </div>
                        </form> --%> -->
        </div>


        <%@ include file="../layout/footer.jsp" %>