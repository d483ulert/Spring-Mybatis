<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게시글 보기</title>
<link rel="stylesheet" type="text/css" href="${cp}/resources/css/normal.css" />
<script src="${cp}/resources/js/js.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<nav class="navbar navbar-default">
	<div class="navbar-header">
		<a class="navbar-brand" href="${cp}"> JS커뮤니티 </a>
	</div>
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

		<ul class="nav navbar-nav">
			<li class="liright"><a href="${cp}/member/modifyForm">정보수정</a></li>
			<li class="liright"><a href="${cp}/member/logout">로그아웃</a></li>
			<li class="liright"><a href="${cp}/member/removeForm">회원탈퇴</a></li>	
			<li class="liright"><a href="${cp}/board/boardList">자유게시판</a></li>
		</ul>
	</div>
</nav>
	<table border="1">
        <tr>
        	<th>>${data.bno}</th>
            <th>내용</th>
        </tr>
        <tr>
        	<td>작성일자</td>
        	<td><fmt:formatDate value="${data.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
        </tr>
        <tr>
        	<td>글제목</td><td>${data.title}</td>
        </tr>
         <tr>
        	<td>글내용</td><td>${data.content}</td>
        </tr>
         <tr>
        	<td>글쓴이</td><td>${data.writer}</td>
        </tr>
         <tr>
        	<td>조회수</td><td>${data.viewcnt}</td>
        </tr>
    </table>
	<a href="#">수정</a>
	<a href="#">삭제</a>
</body>
</html>