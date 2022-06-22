<%@page import="board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//  --------------------- 페이징 처리 ---------------------------------
int pageNum = 1;

if(request.getParameter("page") != null) {
	pageNum = Integer.parseInt(request.getParameter("page"));
}

int listLimit = 10;	// 한 페이지 당 표시할 목록 갯수
int pageLimit = 10;	// 한 페이지 당 표시할 페이지 갯수

// BoardDAO 객체의 selectListCount()메서드를 호출하여 게시물 전체 목록 갯수 조회
BoardDAO boardDAO = new BoardDAO();
int listCount = boardDAO.selectListCount();

// int maxPage =  (int)((double)listCount / listLimit + 0.9);
int maxPage = (int)Math.ceil((double)listCount / listLimit);
int startPage = ((int)((double)pageNum / pageLimit + 0.9) - 1) * pageLimit + 1;
int endPage = startPage + pageLimit - 1;

if(endPage > maxPage) {
	endPage = maxPage;
}

//BoardDAO 객체의 selectBoardList()메서드를 호출하여 게시물 목록 조회
ArrayList<BoardBean> boardList = boardDAO.selectBoardList(pageNum, listLimit);


%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>center/notice.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="wrap">
		<!-- 헤더 들어가는곳 -->
		<jsp:include page="../inc/top.jsp" />
		<!-- 헤더 들어가는곳 -->

		<!-- 본문들어가는 곳 -->
		<!-- 본문 메인 이미지 -->
		<div id="sub_img_center"></div>
		<!-- 왼쪽 메뉴 -->
		<nav id="sub_menu">
			<ul>
				<li><a href="notice.jsp">고객 게시판</a></li>
				<li><a href="news.jsp">공지사항</a></li>
				<li><a href="driver_download.jsp">Driver Download</a></li>
				<li><a href="#">Service Policy</a></li>
			</ul>
		</nav>
		<!-- 본문 내용 -->
		<article>
			<h1>고객 게시판</h1>
			<table id="notice">
				<tr>
					<th class="tno">No.</th>
					<th class="ttitle">Title</th>
					<th class="twrite">Write</th>
					<th class="tdate">Date</th>
					<th class="tread">Read</th>
				</tr>
				<!-- 반복문을 사용하여 ArrayList 객체만큼 반복하면서 -->
				<!-- ArrayList 객체 내의 BoardBean 객체를 꺼내서 저장한 후 -->
				<!-- 각 레코드를 tr 태그의 td 태그에 출력하기-->
				<%
// 				for(int i = 0; i < boardList.size(); i++) {
// 					BoardBean boardBean = boardList.get(i);

				for(BoardBean boardBean : boardList) {
					
				%>
				<tr onclick="location.href = 'notice_content.jsp?num=<%=boardBean.getNum() %>&page=<%=pageNum %>'">
					<td><%=boardBean.getNum() %></td>
					<td class="left"><%=boardBean.getSubject() %></td>
					<td><%=boardBean.getName() %></td>
					<td><%=boardBean.getDate() %></td>
					<td><%=boardBean.getReadcount() %></td>
				</tr>
				<%
				}
				%>
			</table>
			<div id="table_search">
				<input type="button" value="글쓰기" class="btn" onclick="location.href = 'notice_write.jsp'">
			</div>
			<div id="table_search">
				<form action="notice_search.jsp" method="get">
					<select name="searchType">
						<option value="subject">제목</option>
						<option value="name">작성자</option>
					</select>
					<input type="text" name="search" class="input_box" required="required">
					<input type="submit" value="Search" class="btn">
				</form>
			</div>
			<!-- 페이징 처리 -->
			<div class="clear"></div>
			<div id="page_control">
				<!-- 
				현재 페이지 번호가 1보다 클 경우에만 Prev 링크 동작
				=> 클릭시 notice.jsp로 이동하면서 
				   현재 페이지번호 - 1 값을 page 파라미터로 전달
				 -->
				<%if(pageNum > 1) { // 이전페이지가 존재할 경우 %>	
					<a href="notice.jsp?page=<%=pageNum - 1 %>">Prev</a>
				<%} else { // 이전페이지가 존재하지 않을경우 %>	
					Prev&nbsp;
				
				<%} %>
				
				<%for(int i = startPage; i <= endPage; i++){%>
					<%if(pageNum == i) {%>
						&nbsp;&nbsp;<%=i %>&nbsp;&nbsp;
					<%} else {%>
						<a href="notice.jsp?page=<%=i %>"><%=i %></a>
					<%}%>
				<%}%>
				
				<%if(pageNum < maxPage) {%>
					<a href="notice.jsp?page=<%=pageNum + 1 %>">Next</a>
				<%} else {%>
					&nbsp;Next
				<%} %>
			</div>
		</article>

		<div class="clear"></div>
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>


