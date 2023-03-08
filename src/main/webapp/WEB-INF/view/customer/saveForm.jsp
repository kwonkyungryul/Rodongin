<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ include file="../layout/header.jsp" %>
<link rel="stylesheet" href="/css/customer.css" />

<div class="container my-3">
  <form class="mb-1">
    <div class="form-group">
      <input
        type="text"
        class="form-control"
        name="customerTitle"
        id="customerTitle"
        placeholder="제목을 입력해 주세요"
      />
    </div>

    <div class="form-group">
      <textarea
        class="form-control summernote"
        rows="5"
        name="customerContent"
        id="customerContent"
        placeholder=""
      ></textarea>
    </div>
    <div>
      <button
        onclick="save()"
        type="button"
        class="btn btn-primary main_blue_btn_customer mt-3"
        style="margin-left: 95%"
      >
        글쓰기
      </button>
    </div>
  </form>
</div>

<script>
  function save() {
    //save함수호출
    let data = {
      customerTitle: $("#customerTitle").val(),
      customerContent: $("#customerContent").val(),
    };
    $.ajax({
      type: "post",
      url: "/customer",
      data: JSON.stringify(data),
      contentType: "application/json; charset=utf-8",
      dataType: "json", // default : 응답의 mime 타입으로 유추함
    })
      .done((res) => {
        // 20X 일때
        alert(res.msg);
        location.href = "/customer";
      })
      .fail((err) => {
        alert(err.responseJSON.msg);
      });
    console.log(data);
  }
</script>
<script>
  $(".summernote").summernote({
    tabsize: 2,
    height: 400,
  });
</script>

<%@ include file="../layout/footer.jsp" %>
