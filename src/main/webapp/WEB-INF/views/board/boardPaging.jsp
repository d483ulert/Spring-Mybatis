<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JS 자유게시판</title>
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
<div class="container">

	<table class="table table-hover" >
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>글쓴이</th>
            <th>작성일자</th>
            <th>조회수</th>
        </tr>
        <c:forEach var="row" items="${list}">
        <tr>
            <td>${row.bno}</td>
            <td><a href="${cp}/board/boardRead?bno=${row.bno}">${row.title}</a></td>
            <td>${row.writer}</td>
            <td>
             	<fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
            </td>
            <td>${row.viewcnt}</td>
        </tr>
        </c:forEach>
    </table>
   </div>
	<div style="text-align:center;">
  		<ul>
    		<c:if test="${PageMaker.prev}">
    			<li><a href="list${PageMaker.makeQuery(PageMaker.startPage - 1)}">이전</a></li>
    		</c:if> 

    		<c:forEach begin="${PageMaker.startPage}" end="${PageMaker.endPage}" var="idx">
    			<li><a href="list${PageMaker.makeQuery(idx)}">${idx}</a></li>
    		</c:forEach>

    		<c:if test="${PageMaker.next}">
    			<li><a href="list${PageMaker.makeQuery(PageMaker.endPage + 1)}">다음</a></li>
    		</c:if> 
  		</ul>
	</div>
    
    <div style="text-align:center;">
		<button class="btn btn-Light" onclick="location.href='${cp}/board/boardWrite';">글쓰기</button>
	</div>
</body>
</html>