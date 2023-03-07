<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ include file="../layout/header.jsp" %>
        <link rel="stylesheet" href="/css/customer.css" />

        <div class="container my-3">
            <form class="mb-1">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="제목을 입력해주세요" name="customerTitle"
                        id="customerTitle">
                </div>

                <div class="form-group">
                    <textarea class="form-control summernote" rows="5" name="customerContent"
                        id="customerContent"></textarea>
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
                    url: "/customer", //접속하겠다.
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