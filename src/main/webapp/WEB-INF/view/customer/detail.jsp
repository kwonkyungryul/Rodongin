<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ include file="../layout/header.jsp" %>

        <div class="container my-3">
            <div class="mb-3">
                <a href="/customer/1/updateForm" class="btn btn-warning">수정</a>
                <button id="btn-delete" class="btn btn-danger">삭제</button>
            </div>



            <div class="mb-2">
                글 번호 : <span id="id"><i>3 </i></span> 작성자 : <span class="me-3"><i>ssar </i></span>

                <i id="heart" class="fa-regular fa-heart my-xl my-cursor" value="no"></i>
            </div>

            <div>
                <h3>제목입니다</h3>
            </div>
            <hr />
            <div>
                <div>내용입니다</div>
            </div>
            <hr />

            <div class="card">
                <%-- <form>
                    <div class="card-body">
                        <textarea id="reply-content" class="form-control" rows="1"></textarea>
                    </div>
                    <div class="card-footer">
                        <button type="button" id="btn-reply-save" class="btn btn-primary">등록</button>
                    </div>
                </form> --%>
            </div>
        </div>

        <%@ include file="../layout/footer.jsp" %>