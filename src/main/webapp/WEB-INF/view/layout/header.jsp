<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rodongin</title>
    <link rel="icon" href="/images/rodonginfavicon.png">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/32aa2b8683.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    
    <script src="/js/header.js"></script>

    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/header.css">
</head>
<body>
    <header class="bg_color_main">
        <div class="container d-flex flex-column justify-content-end">
            <div class="header-top d-flex justify-content-between align-items-center mt-1">
                <div class="logo fs-1 fw-bold font_color_point"><a href="/"><img src="/images/Logo.png" alt="" style="width: 170px; height: 39px;"></a></div>
                <div class="d-flex">
                    <c:choose>
                       <c:when test="${not empty principal}">
                        <div class="buttons pe-2">
                            <img src="${principal.employeeThumbnail == null ? '/images/profile.png' : principal.employeeThumbnail}" style="border-radius: 50%; width: 30px; height: 30px;">
                        </div>
                        <div class="buttons pe-3"><a href="/employee/detail">${principal.employeeFullname}</a></div>
                        <div class="buttons"><a href="/logout"><b>로그아웃</b></a></div>

                       </c:when>

                       <c:when test="${not empty comPrincipal}">
                        <div class="buttons pe-2">
                            <img src="${comPrincipal.companyThumbnail}" style="border-radius: 50%; width: 30px; height: 30px;">
                        </div>
                        <div class="buttons pe-3"><a href="/company/${comPrincipal.id}">${comPrincipal.companyFullname}</a></div>
                        <div class="buttons"><a href="/logout"><b>로그아웃</b></a></div>
                       </c:when>
                    
                       <c:otherwise>
                        <div class="buttons pe-3"><a href="/loginForm"><b>로그인</b></a></div>
                        <div class="buttons"><a href="/employee/joinForm"><b>개인/</b></a></div>
                        <div class="buttons"><a href="/company/joinForm"><b>기업 </b></a> 회원가입&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>

                       </c:otherwise>
                    </c:choose>
                </div>
            </div>
            
            <nav class="d-flex justify-content-center mt-auto pt-3 pb-1">
                <ul class="nav my_nav">
                 <c:choose>
                       <c:when test="${not empty principal}">
                            <li class="nav-item active"><a class="nav-link fw-bold font1" href="/">채용공고</a></li>
                            <li class="nav-item"><a class="nav-link fw-bold" href="/empolyee/detail">개인정보</a></li>
                            <li class="nav-item"><a class="nav-link fw-bold" href="/customer/list">고객센터</a></li>
                    </c:when>
                    <c:when test="${not empty comPrincipal}">
                            <li class="nav-item active"><a class="nav-link fw-bold font1" href="/">채용공고</a></li>
                            <li class="nav-item"><a class="nav-link fw-bold" href="#">기업 리스트</a></li>
                            <li class="nav-item"><a class="nav-link fw-bold" href="#">이력서 리스트</a></li>
                            <li class="nav-item"><a class="nav-link fw-bold" href="/customer/list">고객센터</a></li>
                    </c:when>

                    <c:otherwise>
                        <!-- 비로그인 메뉴 -->
                        <li class="nav-item active"><a class="nav-link fw-bold font1" href="/">채용공고</a></li>
                        <li class="nav-item"><a class="nav-link fw-bold" href="/customer/list">고객센터</a></li>
                    </c:otherwise>
                </c:choose>
                    <!-- <li class="nav-item"><a class="nav-link fw-bold" href="#">취업난에 지친 구직자들을 위한 쉼터😘</a></li> -->
                </ul>
            </nav>
        </div>
    </header>