<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ include file="../layout/header.jsp" %>

        <div class="container my-3">
            <form>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Enter title" name="customerTitle"
                        id="customerTitle" value="${updatedDto.customerTitle}">
                </div>

                <div class="form-group">
                    <textarea class="form-control" rows="5" id="customerContent" name="customerContent">
                    ${updatedDto.customerContent}
                </textarea>
                </div>
                <button onclick="updateById(${updatedDto.id})" type="button" class="btn btn-primary">글수정</button>
            </form>
        </div>


        <script>
            function updateById(id) {
                let data = {
                    "customerTitle": $("#customerTitle").val(),
                    "customerContent": $("#customerContent").val()
                };
                $.ajax({
                    type: "put",
                    url: "/customer/" + id,
                    data: JSON.stringify(data),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json" // default : 응답의 mime 타입으로 유추함
                }).done((res) => { // 20X 일때
                    alert(res.msg);
                    location.href = "/customer/" + id;
                }).fail((err) => { // 40X, 50X 일때
                    alert(err.responseJSON.msg);
                });
            }
        </script>

        <%@ include file="../layout/footer.jsp" %>