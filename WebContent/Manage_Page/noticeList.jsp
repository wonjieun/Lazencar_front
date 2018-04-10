<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import ="dto.Car" %>
<%@ page import ="dao.adminDao.CarCheckListDaoImpl" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import ="java.util.List" %>
<%@ page import ="dao.adminDao.CarCheckListDao" %>
<!DOCTYPE html>


<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lazencar | 믿음을 주는 고품격 카셰어링</title>

	<link rel="stylesheet" type="text/css" href="/Manage_Page/css/main.css" />
	<link rel="stylesheet" type="text/css" href="/Manage_Page/css/paging.css" />  
	<link rel="stylesheet" href="/Manage_Page/css/daterangepicker.css" />

	<script  src="/Manage_Page/js/jquery.js"></script>
	<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
	
	<style>
	.demo { margin:30px 0;}
	.date-picker-wrapper .month-wrapper table .day.lalala { background-color:orange; }
	.options { display:none; border-left:6px solid #8ae; padding:10px; font-size:12px; line-height:1.4; background-color:#eee; border-radius:4px;}
	.date-picker-wrapper.date-range-picker19 .day.first-date-selected { background-color: red !important; }
	.date-picker-wrapper.date-range-picker19 .day.last-date-selected { background-color: orange !important; }
	
	#table2 th:first-child{
	    background: #f1c40f;
	    height: 30px;
	    background-repeat: no-repeat;
	    color: white;
	    text-align: center;
	    width: 20%;
	}
	#table2 th:last-child{
	background:#f1c40f;
	height:30px;
	background-repeat:no-repeat;
	color:white;
	text-align: center;   
	width: 10%;}
	
	.level1 :nth-child(4) .fly {background: #ffb505 !important;}
	
	
	tr.hiddenTr{
 	display:none;  
/*  	display:table-row;  */
	}
	tr.hiddenTr td{
		padding: 15px 0 15px 100px;
	
	}
	tr.hiddenTr td div{    
	text-align: left;
	float: left; 
	width: 33%;
	margin-left:30px;
	}
	tr.hiddenTr td div font{
		font-size:17px;
	}
	tr.hiddenTr td div button{
		text-align:right;
	}
	</style>
	
  <script type="text/javascript">
  
  //리스트 하단에 추가로 출력해주기 위해서 토글 함수 생성
  	function showDetail(id){
		  obj = document.getElementById(id);
		  
		  if(obj.style.display == "none"){
			  obj.style.display = "table-row";
		  }else{
			  obj.style.display="none";
		  }
  	}
//   	검색창에 값이 있는가 판별
	function checkSearch_content(){
		if($("#search_content").val()==''){
			return false;
		}else{
			return true;
		}
	}
	//수정 버튼 눌렀을시 실행
	function update_clicked(a){
		if(confirm("수정하시겠습니까?")){
			var btnEdit = "updateNot";
			var font_notNum =$("#font_notNum_"+a).text();
			var edit_notTitle = $("#edit_not_Title_"+a).val();		
			var edit_notContent = $("#edit_not_Content_"+a).val();
// 			var edit_notFile = $("#edit_not_File").val();
			
			console.log(font_notNum);
			console.log(edit_notTitle);
			console.log(edit_notContent);
			
			var $form3 = $("<form>").attr("action","/admin/noticeList.do").attr("method","get");
			$("<input>").attr("type","hidden").attr("name","font_notNum").attr("value",font_notNum).appendTo($form3);
			$("<input>").attr("type","hidden").attr("name","edit_notTitle").attr("value",edit_notTitle).appendTo($form3);
			$("<input>").attr("type","hidden").attr("name","edit_notContent").attr("value",edit_notContent).appendTo($form3);
// 			$("<input>").attr("type","hidden").attr("name","edit_notFile").appendTo($form3);
			$("<input>").attr("type","hidden").attr("name","btnEdit").attr("value",btnEdit).appendTo($form3);
			$form3.appendTo($(document.body));
			
			$form3.submit();
		}else return;
	}
	//삭제 버튼 눌렸을시 실행
	function delete_clicked(a){
		if(confirm("삭제하시겠습니까?")){
			var font_notNum = $("#font_notNum_"+a).text();
			var btnEdit ="deleteNot";
			
			var $form2 = $("<form>").attr("action","/admin/noticeList.do").attr("method","get");
			$("<input>").attr("type","hidden").attr("name","font_notNum").attr("value",font_notNum).appendTo($form2);
			$("<input>").attr("type","hidden").attr("name","btnEdit").attr("value",btnEdit).appendTo($form2);
			$form2.appendTo($(document.body));
			
			$form2.submit();	
		}
		else return;
	}
	$(function(){	

		var onSampleResized = function(e){
			var columns = $(e.currentTarget).find("th");
			var msg = "columns widths: ";
			columns.each(function(){ msg += $(this).width() + "px; "; })
			$("#table2Txt").html(msg);
			
		};
	});
	
	
// 	검색 및 정렬하는 ajax
$(document).ready(function(){
	$("#searchNot").click(function(){
		//번호 제목 내용 날짜
		var category =$("#category").val();
		var sort=$("#sort").val();
		var content=$("#search_content").val();
		var clicked="clicked";
<%-- 		<%=request.setAttribute("content",content)%> --%>
		console.log("카테고리:"+category);
		console.log("정렬기준:"+sort);
		console.log("입력내용:"+content);
		if(checkSearch_content()==true){
			console.log("내용있음");
			
			var $form = $("<form>").attr("action", "/admin/noticeList.do").attr("method", "get");
			$("<input>").attr("type", "hidden").attr("name", "category").attr("value", category).appendTo($form);
			$("<input>").attr("type", "hidden").attr("name", "content").attr("value", content).appendTo($form);
			$("<input>").attr("type", "hidden").attr("name", "sort").attr("value", sort).appendTo($form);
			$("<input>").attr("type", "hidden").attr("name", "clicked").attr("value", clicked).appendTo($form);
			$form.appendTo($(document.body));
			
			$form.submit();	
			
		}else{
			alert("검색어를 입력하세요");
			console.log("내용을 채워주세요");
		}
	});
});
  </script>
</head>
<body>

<jsp:include page="/Manage_Page/util/sideMenu.jsp" />

<div class="wrap">

<div class="header">
라젠카 관리자 페이지

</div>		<!-- header end -->


<div class="contain">


<div class="content">
         <div class="subtop-content bg_subvisual_02_01">
          <h3 class="subtit">공지사항 조회/수정</h3>
          <p class="subtxt"><strong>공지사항을 관리합니다</strong><br /></p>
        </div>
        
	<div class="center">
					<table class="table1">
						<tr>
							<th>카테고리</th>
							<th>검색 내용</th>
							<th>정렬</th>
						</tr>
						<tr>
							<td class="left"><select class="sort" id="category">
									<option value="not_Title">제목</option>
									<option value="not_Content">내용</option>
									<option value="not_Date">날짜</option>
							</select></td>
							<td>
								<input size='30' id="search_content"  >
							</td>
							<td class="right">
								<!-- 정렬 --> <select class="sort" id="sort">
									<option value="not_Num">번호</option>
									<option value="not_Title">제목</option>
									<option value="not_Date">날짜</option>
							</select>
							</td>
						</tr>
					</table>
				</div>
				<button class="btnSearch" id="searchNot" type="button">공지사항 검색</button>
				<div class="clear"></div>
				<div>
					<table id="table2">
					<thead>
						<tr>
							<th style="width:40px;">번호</th>
							<th>제목</th>
							<th>내용</th>
							<th style="width:150px;">등록날짜</th>
							<th>파일</th>
							<th></th>
						</tr>
					</thead>
					<tbody>

							
						<c:forEach items="${list }" begin="0" end="${paging.listCount }" var="i" varStatus="listNumber">
								
							<tr>
								<td id="font_notNum_${listNumber.count}">${i.notNum }</td>
								<td>${i.notTitle }</td>
								<td>
									<textArea style="width:250px;" cols="100" disabled>${i.notContent}</textArea>
								</td>
								<td>${i.notDate }</td>
								<td>
								<img width="160px" height="120px" src="/upload/${i.notFile }"></td>	
								<td>
								<button id="btn_listDown" onclick="showDetail('hiddenTr_${listNumber.count}');" style="margin:auto 0;">수정</button><br>
								<button id="btn_delete_${listNumber.count}" onclick="delete_clicked(${listNumber.count});" style="margin:auto 0;">삭제</button>
								</td>
							</tr>
							<tr class="hiddenTr" id="hiddenTr_${listNumber.count }">
								<td colspan="7">
								<div style="width:90px" >
								<font>번호: </font><br>
								<font>제목: </font><br>
								<font>내용: </font><br>
<!-- 								<font>파일: </font><br> -->
								</div>
								<div>
	
									<font id="font_not_Num_${listNumber.count }"> ${i.notNum}</font><br>
<!-- 									<form id="editForm" action="/admin/noticeList.do" method="POST"> -->
										<input type="text" id="edit_not_Title_${listNumber.count }" value="${i.notTitle }"/>
										<textArea  id="edit_not_Content_${listNumber.count }" cols="100" >${i.notContent}</textArea>
<%-- 										<input name="edit_notFile" type="File" id="edit_not_File_${listNumber.count }" value="${i.notFile}"/> --%>
<!-- 									</form> -->
								</div>
								<div>
									<button id="btn_update_${listNumber.count }"
									 onclick="update_clicked(${listNumber.count })">수정완료</button>
								</div>
								</td>
							</tr>	
						</c:forEach>
							

					</tbody>
						
					</table>
				</div>
				
				<jsp:include page="/Manage_Page/util/notListPaging.jsp" />
			</div>

</div>		<!-- content end -->

</div>		<!-- contain end -->




</body>
</html>