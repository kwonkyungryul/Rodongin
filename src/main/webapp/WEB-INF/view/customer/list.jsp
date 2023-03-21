<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
        <link rel="stylesheet" href="/css/customer.css" />

        <div class=" d-flex justify-content-center" style="width: 100%;">
            <div class="slider">
                <div class="slideshow-container d-flex justify-content-center mt-5 mb-3">
                    <img class="mySlides" src="/images/001.jpg;" style="width: 50%;" />
                    <img class="mySlides" src="/images/004.jpg" style="width: 50%;" />
                </div>
            </div>
        </div>



        <div class=" d-flex justify-content-center" style="width: 100%">
            <div class="my_custom_list">
                <div>
                    <h5 class="border-bottom border-3 d-flex justify-content-center py-2" style="text-align: center;">
                        <b>무엇이든 물어보세요!</b>
                    </h5>
                </div>
                <div class="d-flex justify-content-center mt-3">
                    <table class="border border-1 mb-2" style="border-color: rgb(94, 94, 94);">
                        <tr class="border border-1" style="text-align: center; background-color: rgb(255, 246, 199);">
                            <th class="border border-1" style="width: 50px;"><b>번&nbsp;호</b></th>
                            <th class="border border-1" style="width: 350px;"><b>제&nbsp;&nbsp;목</b></th>
                            <th class=" border border-1" style="width: 80px;"><b>아이디</b></th>
                            <th class="border border-1" style="width: 100px;"><b>작성일자</b></th>
                        </tr>

                        <c:forEach items="${listDtos}" var="listDto">
                            <tr class="border border-1">
                                <td class="border border-1" style="text-align: center; ">${listDto.id}</td>

                                <td class="customer-link border border-1" style="text-align: left; font-size: small;"><a
                                        href="/customer/${listDto.id}">&nbsp;&nbsp;${listDto.customerTitle}</a>
                                </td>

                                <td class="border border-1" style="text-align: center; font-size: small;">
                                    ${listDto.employeeName}</td>
                                <td class="border border-1" style="text-align: center; font-size: small;">
                                    <fmt:formatDate value="${listDto.createdAt}" pattern="yyyy-MM-dd" />
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>


        <c:choose>
            <c:when test="${principal == null}">
            </c:when>
            <c:otherwise>
                <div class="d-flex justify-content-center mt-3 mb-5">
                    <button type="button" class="btnn main_yellow_label_customer"
                        style="border: none; text-align:center"><a href=" /customer/saveForm">글쓰기</a></button>
                </div>
            </c:otherwise>
        </c:choose>

        <%-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <ul class="pagination mt-3 d-flex justify-content-center">
            <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
        </ul> --%>
        <script>
            let slideIndex = 0;
            showSlides();

            function showSlides() {
                let slides = document.getElementsByClassName("mySlides");
                for (let i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                slideIndex++;
                if (slideIndex > slides.length) {
                    slideIndex = 1;
                }
                slides[slideIndex - 1].style.display = "block";
                setTimeout(showSlides, 2000);
            }
        </script>
        <%@ include file="../layout/footer.jsp" %>