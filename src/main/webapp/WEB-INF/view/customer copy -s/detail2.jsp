<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp" %>


<div class="container my-3">
    <c:if test="${detailDto.employeeId == principal.id}">
        <div class="mb-3">
            <a href="/customer/${detailDto.id}/updateForm" class="btn btn-warning">수정</a>
            <button onclick="deleteById(${detailDto.id})" class="btn btn-danger">삭제</button>
        </div>
    </c:if>

    <div>
        <h4>${detailDtos.customerTitle}</h4>
    </div>
    <div class="mb-2">
        번호 : <span id="${detailDtos.id}"><i>${detailDtos.id}
            </i></span>&nbsp;&nbsp;&nbsp;작성자 :
        <span class="me-3"><i>${detailDtos.employeeName}</i></span>
    </div>

    </div>

    <div>
        <h2><b>${detailDto.customerTitle}</b></h2>
    </div>
    <hr/>
    <div>
        <div>${detailDto.customerContent}</div>
    </div>
    <hr/>
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