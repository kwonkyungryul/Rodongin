<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ include file="../layout/header.jsp" %>


        <div class="container mt-3">
            <form action="d-flex justify-content-center" style="width: 100%;">
                <div class="d-flex justify-content-center mt-3" style="width: 100%">
                    <div class="mb-2" style="width: 70%;">
                        <div class="form-group mb-2">
                            <label for="username" class="form-label">아이디</label>
                            <input type="text" class="form-control" id="username" name="employeeName" required>
                        </div>
                        <div class="form-group mb-2">
                            <label for="email" class="form-label">이메일</label>
                            <input type="text" class="form-control" id="email" name="employeeEmail" required>
                        </div>
                        <div class="form-group">
                            <label for="title" class="form-label">제목</label>
                            <input type="text" class="form-control" id="title" name="customerTitle" required>
                        </div>
                        <div class="form-group mb-2">
                            <label for="content" class="form-label">문의내용</label>
                            <div>
                                <textarea class="form-control summernote" rows="5" id="customerContent"
                                    name="content"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <button onclick="save()" type="button" class="btn btn-primary">글쓰기</button>
            </form>
        </div>

        <script>
            function save() { //save함수호출 
                let data = {
                    "username": $("#employeeName").val(),
                    "email": $("#employeeEmail").val(),
                    "title": $("#customerTitle").val(),
                    "content": $("#customerContent").val()
                };
                $.ajax({
                    type: "post",
                    url: "/customer",
                    data: JSON.stringify(data),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json"
                }).done((res) => {
                    alert(res.msg);
                    location.href = "/";
                }).fail((err) => {
                    alert(err.responseJSON.msg);
                });
            }
        </script>


        <%@ include file="../layout/footer.jsp" %>