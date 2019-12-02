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
	<div style="float: right;">
		<select id="cntPerPage" name="sel" onchange="selChange()">
			<option value="5"
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
			<option value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
			<option value="15"
				<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
			<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
		</select>
	</div> <!-- 옵션선택 끝 -->
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
              <!-- 데이터 타입을 사용하는 방법 -->
             	<fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
            </td>
            <td>${row.viewcnt}</td>
        </tr>
        </c:forEach>
    </table>
   </div>
   <div style="text-align:center;">
  	<ul>
    	<c:if test="${pageMaker.prev}">
    		<li><a href="list${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
    	</c:if> 

    	<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    		<li><a href="list${pageMaker.makeQuery(idx)}">${idx}</a></li>
    	</c:forEach>

    	<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    		<li><a href="list${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
    	</c:if> 
  	</ul>
   </div>

    
    <div style="text-align:center;">
		<button class="btn btn-Light" onclick="location.href='${cp}/board/boardWrite';">글쓰기</button>
	</div>
</body>
</html>