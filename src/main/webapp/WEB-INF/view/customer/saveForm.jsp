<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ include file="../layout/header.jsp" %>


        <div class="container mt-3">
            <div class="d-flex justify-content-center" style="width: 100%;">
                <div class="d-flex justify-content-center mt-3" style="width: 100%">
                    <div class="mb-2" style="width: 70%;">
                        <form action="/employee/join" method="post">
                            <div class="mb-2">
                                <label for="username" class="form-label">아이디</label>
                                <input type="text" class="form-control" id="username" name="username"
                                    value="${user.username}" required>
                            </div>
                            <div class="mb-2">
                                <label for="email" class="form-label">이메일</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>
                            <div class="mb-2">
                                <label for="title" class="form-label">제목</label>
                                <input type="text" class="form-control" id="title" name="title" required>
                            </div>
                            <div class="mb-2">
                                <label for="content" class="form-label">문의내용</label>
                                <textarea class="form-control" id="content" name="content" rows="4" required></textarea>
                            </div>
                            <button onclick="save()" type="button" class="btn btn-primary">글쓰기완료</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function save() { //save함수호출 
                let data = {
                    "username": $("#username").val(),
                    "email": $("#email").val(),
                    "title": $("#title").val(),
                    "content": $("#content").val()
                };
                $.ajax({
                    type: "post", //명시적으로 적어야함!
                    url: "/board", //접속하겠다.
                    data: JSON.stringify(data), //서버로 전송해야 하는 data는 
                    contentType: "application/json; charset=utf-8",
                    dataType: "json" // default : 응답의 mime 타입으로 유추함
                }).done((res) => { // 20X 일때
                    alert(res.msg);
                    location.href = "/";
                }).fail((err) => {
                    alert(err.responseJSON.msg);
                });
            }
        </script>
        <script>
            $('.summernote').summernote({
                tabsize: 2,
                height: 400
            });
        </script>

        <%@ include file="../layout/footer.jsp" %>