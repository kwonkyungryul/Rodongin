<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp" %>


<div class="container my-3">
    <c:if test="${detailDto.employeeName == principal.id}">
        <div class="mb-3">
            <a href="/board/${detailDto.id}/updateForm" class="btn btn-warning">수정</a>
            <button onclick="deleteById(${detailDto.id})" class="btn btn-danger">삭제</button>
        </div>
    </c:if>


    <div class="mb-2">
        번호 :
        <span id="id">
            <i>${detailDto.id} </i>
        </span>
        작성자 :
        <span class="me-3">
            <i>${detailDto.employeeName} </i>
        </span>

    </div>

    <div>
        <h2><b>${detailDto.customerTitle}</b></h2>
    </div>
    <hr/>
    <div>
        <div>${detailDto.customerContent}</div>
    </div>
    <hr/>

        <i id="heart" class="fa-regular fa-heart my-xl my-cursor" value="no"></i>&nbsp;

    <div class="card">
        <form action="/reply" method="post">
                <input type="hidden" name="boardId" value="${detailDto.id}">
            <div class="card-body">
                <textarea id="reply-comment" name="comment" class="form-control" rows="1"></textarea>
            </div>
            <div class="card-footer">
                <button type="submit" id="btn-reply-save" class="btn btn-primary">등록</button>
            </div>
        </form>
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
            location.href = "/";
        }).fail((err) => { // 40X, 50X일때
            alert(err.responseJSON.msg);
        });
    }
</script>

<%@ include file="../layout/footer.jsp" %>