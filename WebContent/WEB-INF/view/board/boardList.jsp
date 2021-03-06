<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="user.model.vo.User, java.util.ArrayList, board.model.vo.Board"%>

<%
	User loginUser2 = (User) session.getAttribute("loginUser");
	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");


%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>MyPT</title>

<link href="css/style.css" rel="stylesheet">
<script src="lib/jquery-3.6.0.min.js"></script>

<style>
#content {
	display: none;
	border-style: solid;
	border-color: DarkCyan;
	position: absolute;
	left: 250px;
	padding: 20px;
	border-radius: 20px;
}
.bNum {
	display: none;
}
.class-text > p{
	display:block;
	height:75px;
}
</style>
</head>
<body>
	<%@ include file="../common/menu.jsp"%>

	<!-- Page Header Start -->
	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<h2>Board</h2>
				</div>
				<div class="col-12">
					<a href="">Home</a> <a href="">Board</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Page Header End -->


	<!-- Class Start -->
	<div class="class">
		<div class="container">
			<div class="section-header text-center wow zoomIn"
				data-wow-delay="0.1s">
				<p>Community</p>
				<h2>Work Member</h2>
			</div>
			<div class="row">
				<div class="col-12">
					<ul id="class-filter">
						<li data-filter="*" class="filter-active" value="10">모두 보기</li>
						<li data-filter=".filter-1">수영</li>
						<li data-filter=".filter-2">산책</li>
						<li data-filter=".filter-3">자전거</li>
						<li data-filter=".filter-4">헬스장</li>
						<li data-filter=".filter-5">테니스</li>
						<li data-filter=".filter-6">배드민턴</li>
					</ul>
				</div>
			</div>
			<!-- Class End -->

			<!--  게시판 시작 -->
			<% if (!list.isEmpty()) { %>
			<div class="row class-container">
				<% for (Board b :list) { %>
				<div
					class="col-lg-4 col-md-6 col-sm-12 class-item <%=b.getCategory()%> wow fadeInUp" data-wow-delay="0.0s">
					<div class="class-wrap">
						<div class="class-text">
							<h2><%=b.getPsTitle()%></h2>
							<div class="class-meta">
								<p><i class="far fa-user"></i><%=b.getPsWriter()%></p>
								<p><i class="far fa-calendar-alt"></i><%=b.getPsDate()%></p>
								<p><i class="far fa-comments"></i><span class="cnt"></span></p>
							</div>
							<p><%=b.getPsContent()%></p>
							<a id="<%=b.getbNo()%>" class="detailBtn">Read More<i class="fa fa-angle-right"></i></a>
						</div>
					</div>
				</div>
			
				<% } %>
				</div>
				<% } else { %>
					<div class="col-12 text-center"> 
						<h3>조회할 게시물이 없습니다.</h3>
					</div>
				<% } %>
				<!-- 게시판 끝 -->

			<% if (loginUser2 != null) { %>
				<input type="button" onclick="location.href='<%=request.getContextPath()%>/writeNoticeForm.me'" class="btn btn-outline-primary" value="글쓰기">
			<% } %>

			
		</div>
	</div>
	<!-- Class End -->

	<%@ include file="../common/footer.jsp"%>

	<script>
		$(".detailBtn").on('click', function() { 
			var num = $(this).attr('id');
			location.href="<%=request.getContextPath()%>/boardDetail.no?no="+num;
		});
		
		$(function(){
			$('#board').addClass('active');
			$('.menus').not('#board').removeClass('active');
		});
		
		$(function(){
			var bno = new Array();
			$('.detailBtn').each(function(i){
				bno[i] = $(this).attr('id');
			});
			
			console.log(bno);
			
			$.ajax({
				url:'countReply.count',
	            traditional :true, 
	            dataType:"JSON",
				data:{'bno':bno}, 
				success:function(data){
					var d = new Array();
					for(var i in data){
						d[i] = data[i];
						console.log(i +  " = "+data[i]);
				
					}
			
					
					$('.detailBtn').each(function(i){
						$(this).siblings('div').children().find('.cnt').text(d[i]);
					});
				},error : function(data) {
					console.log('실패');
				}
				
			});
			
		});
		
	</script>


</body>
</html>
