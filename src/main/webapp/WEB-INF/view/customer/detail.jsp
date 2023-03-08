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
                            <h5>${detailDto.customerTitle}</h5>
                        </div>
                        <div class="mb-2">
                            &nbsp;&nbsp;<b>번호</b> : <span id="${detailDto.id}">${detailDto.id}
                                </span>&nbsp;&nbsp;&nbsp;<b>작성자</b> :
                            <span class="me-3">${detailDto.employeeId}</span>
                        </div>


                        <div class="border border-1 p-3 mb-3"
                            style="border-radius: 10px; border-color: rgb(94, 94, 94); height: 200px; overflow:auto">
                            ${detailDto.customerContent}
                        </div>

                        <div style="text-align: right;">
                            <c:if test="${detailDto.employeeId == principal.id}">
                                <span>
                                    <a href=" /customer/${detailDto.id}/updateForm"
                                    class="btn main_yellow_label_customer">수정</a>
                                </span>
                                <span>
                                    <button onclick="deleteById(${detailDto.id})" class="btn main_gray_btn_customer 
                                    d-inline-flex">&nbsp;삭제</button>
                                </span>
                            </c:if>

                        </div>

                    </div>
                </div>
            </div>
        </div>
        </div>
<script>
    function deleteById(id) {
        $.ajax({
            type: "delete",
            url: "/customer/" + id,
            dataType: "json"
        }).done((res) => { // 20X일때
            alert(res.msg);
            location.href = "/customer/list";
        }).fail((err) => { // 40X, 50X일때
            alert(err.responseJSON.msg);
        });
    }
</script>

        <%@ include file="../layout/footer.jsp" %>