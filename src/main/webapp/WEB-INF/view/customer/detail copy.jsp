<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ include file="../layout/header.jsp" %>
        <link rel="stylesheet" href="/css/customer.css">

        <div class="container mt-3">
            <div class="d-flex justify-content-center" style="width: 100%;">
                <div class="" style="width: 70%">
                    <div class="customercenter">
                        <h3 class="border-bottom border-3 py-2" style="width: 100%; text-align: lift;">고객센터</h3>
                    </div>
                    <div class="container my-3" style="width: 100%">
                    <div class="mb-3">

                        <!-- <%-- <i id="heart" class="fa-regular fa-heart my-xl my-cursor" value="no"></i> --%> -->
                        <div>
                            <h4>${detailDtos.customerTitle}</h4>
                        </div>
                        <div class="mb-2">
                            번호 : <span id="${detailDtos.id}"><i>${detailDtos.id}
                                </i></span>&nbsp;&nbsp;&nbsp;작성자 :
                            <span class="me-3"><i>${detailDtos.employeeName}</i></span>
                        </div>


                        <div class="border border-1 p-3 mb-3"
                            style="border-radius: 10px; border-color: rgb(94, 94, 94); height: 300px; overflow:auto">
                            ${detailDtos.customerContent}
                        </div>

                        <div style="text-align: right;">
                            <c:if test="${employeeDto.employeeId == principal.id}">
                                <span>
                                    <a href=" /customer/${detailDtos.id}/updateForm"
                                    class="btn main_yellow_label_customer">수정</a>
                                </span>
                                <span>
                                    <button onclick="deleteById" ${detailDtos.id}" class="btn main_gray_btn_customer 
                                    d-inline-flex">&nbsp;삭제</button>
                                </span>
                            </c:if>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        </div>


        <!-- <%-- <form>
<div class="card-body">
    <textarea id="reply-content" class="form-control" rows="1"></textarea>
</div>
<div class="card-footer">
    <button type="button" id="btn-reply-save" class="btn btn-primary">등록</button>
</div>
</form> --%> -->
        <%@ include file="../layout/footer.jsp" %>