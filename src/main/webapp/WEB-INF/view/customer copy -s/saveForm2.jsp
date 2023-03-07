<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ include file="../layout/header.jsp" %>


        <div class="container mt-3">
            <form action="d-flex justify-content-center" style="width: 100%;">
                <div class="d-flex justify-content-center mt-3" style="width: 100%">
                    <div class="mb-2" style="width: 70%;">
                        <div class="form-group mb-2">
                            <label for="username" class="form-label">아이디</label>
                            <input type="text" class="form-control" id="username" name="employeeName" value="${employee.employeeName}" readonly="readonly">
                        </div>
                        <div class="form-group mb-2">
                            <label for="email" class="form-label">이메일</label>
                            <input type="text" class="form-control" id="email" name="employeeEmail" value="${employee.employeeEmail}" readonly="readonly">
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
                    "customerTitle": $("#customerTitle").val(),
                    "customerContent": $("#customerContent").val()
                };
                $.ajax({
                    type: "post", //명시적으로 적어야함!
                    url: "/customer/save", //접속하겠다.
                    data: JSON.stringify(data), //서버로 전송해야 하는 data는 
                    contentType: "application/json; charset=utf-8",
                    dataType: "json" // default : 응답의 mime 타입으로 유추함
                }).done((res) => { // 20X 일때
                    alert(res.msg);
                    location.href = "/customer";
                }).fail((err) => {
                    alert(err.responseJSON.msg);
                });
                console.log(data);
            }
        </script>


        <%@ include file="../layout/footer.jsp" %>