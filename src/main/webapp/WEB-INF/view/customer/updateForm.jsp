<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ include file="../layout/header.jsp" %>
        <link rel="stylesheet" href="/css/customer.css" />

        <div class="container my-3">
            <form>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Enter title" name="customerTitle"
                        id="customerTitle" value="${updatedDto.customerTitle}">
                </div>

                <div class="form-group">
                    <textarea class="form-control summernote" rows="5" id="customerContent" name="customerContent">
                    ${updatedDto.customerContent}
                </textarea>
                </div>
                <button onclick="updateById(${updatedDto.employeeId})" type="button"
                    class="main_yellow_label_customer; float: right; ">글수정</button>
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
                    location.href = "/customer"
                }).fail((err) => { // 40X, 50X 일때
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