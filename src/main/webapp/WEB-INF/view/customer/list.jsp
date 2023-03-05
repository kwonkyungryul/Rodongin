<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>



        <div class="container mt-3">
            <div class="d-flex justify-content-center" style="width: 100%;">
                <h3 class="border-bottom border-3 py-2" style="width: 70%; text-align: lift;">
                    <b>고객센터</b>
                </h3>
            </div>
            <div class="d-flex justify-content-center mt-3" style="width: 100%;">
                <table class="mb-2" style="width: 70%;">
                    <thead style="border-color: rgb(94, 94, 94);">
                        <tr>
                            <th><b>번호</b></th>
                            <th><b>제목</b></th>
                            <th><b>아이디</b></th>
                            <th><b>작성일자</b></th>
                        </tr>
                    </thead>

                    <c:forEach items="${listDtos}" var="listDto">
                        <tbody class="border border-1">
                            <tr>
                                <td class="card-title">${listDto.id}</td>
                                <td class="my-text-ellipsis"><a
                                        href="/customer/${listDto.id}">${listDto.customerTitle}</a>
                                </td>
                                <td>${listDto.employeeName}</td>
                                <td>
                                    <fmt:formatDate value="${listDto.createdAt}" pattern="yyyy-MM-dd HH:mm" />
                                </td>
                            </tr>
                        </tbody>
                    </c:forEach>
                </table>
            </div>
        </div>


        <c:choose>
            <c:when test="${principal == null}">
            </c:when>
            <c:otherwise>
                <div class="d-flex justify-content-center mt-3 mb-5">
                    <button type="button" class="btnn main_yellow_label" style="border:none;"><a
                            href="/customer/saveForm">글쓰기</a></button>
                </div>
            </c:otherwise>
        </c:choose>


        <ul class="pagination mt-3 d-flex justify-content-center">
            <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
        </ul>


        <%@ include file="../layout/footer.jsp" %>