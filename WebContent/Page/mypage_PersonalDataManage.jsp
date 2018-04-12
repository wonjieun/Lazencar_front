<%@page import="javax.websocket.SendResult"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.MemberModifyDataDao"%>
<%@ page import="dao.MemberModifyDataDaoImpl"%>
<%@ page import="dto.Member"%>
<%
		if(session.getAttribute("id") == null){
			response.sendRedirect("login.jsp");
		}else{
			String id = session.getAttribute("id").toString();
			MemberModifyDataDao dao = new MemberModifyDataDaoImpl();
			Member mem = dao.getMemData(id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" media="all" href="/Page/css/main.css">
<link type="text/css" rel="stylesheet" media="all" href="/Page/css/layout_01.css">
<link type="text/css" rel="stylesheet" media="all" href="/Page/css/mypage_ex.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lazencar | 믿음을 주는 고품격 카셰어링</title>


<script type="text/javascript" src="./js/lib/jquery-1.9.1.js"></script>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>


<title>요금안내 &lt; 라젠카 소개</title>

</head>

<body>

	<!-- Begin #wrap -->

	<div id="wrap">

		

		<!-- [e]top_banner -->



		<!-- Begin #header -->

		<jsp:include page="header.jsp" />

		<!-- // End #header -->



		<!-- Begin #container -->

		<div id="container">

			<div class="content-wrap">

				<jsp:include page="mypage_sidebar.jsp" />

				<div class="contentbox">
					<!-- contentbox로 묶기 -->


					<div class="location">
						<div class="location_in">
							<p>
								<span>그린카 소개</span>&gt; <strong>요금안내</strong>
							</p>
						</div>
					</div>
					<div class="subtop-content">
						<h3 class="subtit">개인정보 관리</h3>
					</div>
					<div class="bodystart">

						<!-- bodystart 	=========================================컨텐츠 변경가능 영역!!================================================  -->
		
						<div class="charges-wrap">
							<ul class="tabs">
								<li class="tabLink current" data-tab="tab1">개인정보 수정</li>
								<li class="tabLink" data-tab="tab2">면허정보 관리</li>
							</ul>
							<div id="tab1" class="tabContent current">
								<div class="section02">
									<!-- S:table //-->
									<div class="tbl01">

										<table summary="">
											<colgroup>
												<col width="22%" />
												<col width="78%" />
											</colgroup>
											<tbody>
												<tr>
													<th><label>사용자 아이디</label></th>
													<td><%=mem.getMemId()%><input type="hidden"
														id="mem_id" value="<%=mem.getMemId()%>" /></td>
												</tr>
												<tr>
													<th><label>이름(실명)</label></th>
													<td><%=mem.getMemName()%><input type="hidden"
														id="mem_name" value="<%=mem.getMemName()%>" /></td>
												</tr>
												<tr>
													<th><label>주민번호</label></th>
													<td><%=mem.getMemJumin1()%><input type="hidden"
														id="mem_jumin1" value="<%=mem.getMemJumin1()%>" /> - <%=mem.getMemJumin2()%><input
														type="hidden" id="mem_jumin2"
														value="<%=mem.getMemJumin2()%>" /></td>
												</tr>
												<tr>
													<th><em title="필수입력">*</em>휴대폰번호</th>
													<td><span class="formatIn"> <input type="text"
															id="mem_phone1" class="w100" title="휴대폰번호 앞자리."
															maxlength="3" value="<%=mem.getMemPhone1()%>" /> - <input
															type="text" id="mem_phone2" class="w100"
															title="휴대폰번호 중간자리." maxlength="4"
															value="<%=mem.getMemPhone2()%>" /> - <input type="text"
															class="w100" id="mem_phone3" title="휴대폰번호 뒷자리."
															maxlength="4" value="<%=mem.getMemPhone3()%>" />
													</span></td>
												</tr>
												<tr>
													<th><em title="필수입력">*</em>주소</th>
													<td><span class="formatIn"><input type="text"
															name="homeZipCode" id="homeZipCode" class="w50"
															maxlength="6" readonly="readonly"
															value="<%=mem.getMemZip()%>" /><a href="#homeZipCode"
															id="postcodify_search_button" class="btnTbl01 ml5">우편번호검색</a></span>
														<p class="formatIn tblp">
															<input type="text" name="mem_addr1" id="mem_addr1"
																class="w200 kor" maxlength="50"
																value="<%=mem.getMemAddr1()%>" /> <input type="text"
																name="mem_addr2" id="mem_addr2" class="w200 kor"
																maxlength="50" value="<%=mem.getMemAddr2()%>" />
														</p></td>
												</tr>
												<tr>
													<th><em title="필수입력">*</em> 이메일</th>
													<td>
														<form name="form">
															<span class="formatIn"><input type="text"
																id="mem_email1" name="EMAIL_1" class="w100"
																maxlength="30" value="<%=mem.getMemEmail1()%>" /><span
																class="ml5">@</span><input type="text" id="mem_email2"
																name="EMAIL_2" class="w150 ml5" maxlength="20"
																value="<%=mem.getMemEmail2()%>" /> <select
																name="emailSelect" id="emailSelect" class="ml5">
																	<option value="">직접입력</option>
																	<option value="daum.net">daum.net</option>
																	<option value="empal.com">empal.com</option>
																	<option value="gmail.com">gmail.com</option>
																	<option value="hanmail.net">hanmail.net</option>
																	<option value="msn.com">msn.com</option>
																	<option value="naver.com">naver.com</option>
																	<option value="nate.com">nate.com</option>
															</select> </span>



														</form>

													</td>
												</tr>

											</tbody>
										</table>
									</div>
									<!--// E:table -->
								</div>

								<h6>-안전한 비밀번호 관리를 위하여 월 1회 주기적으로 비밀번호를 변경하여 주시기 바랍니다.</h6>
								<div class="section02">
									<!-- S:table //-->
									<div class="tbl01">
										<table summary="">
											<colgroup>
												<col width="22%" />
												<col width="78%" />
											</colgroup>
											<tbody>
												<tr>
													<th><em title="필수입력">*</em><label for="">비밀번호</label></th>
													<td><span class="formatIn"><input
															type="password" name="PASSWORD" id="mem_pw1" class="w100"
															title="비밀번호를 입력하세요." maxlength="20"
															value="<%=mem.getMemPw()%>" /></span> <span class="exp ml10">*
															영문,숫자,특수문자 혼합하여 6-12자 이내 이어야 합니다.</span></td>
												</tr>
												<tr>
													<th><em title="필수입력">*</em><label for="">비밀번호
															확인</label></th>
													<td><span class="formatIn"><input
															type="password" name="PASSWORD2" id="mem_pw2"
															class="w100" title="비밀번호를 재입력하세요." maxlength="20"
															value="<%=mem.getMemPw()%>" /></span> <span class="exp ml10 alert_pwCheck" id="alert_pwCheck"></span></td>
												</tr>
											</tbody>
										</table>

									</div>
									<!--// E:table -->

								</div>
								<div class="btnArea02">
									<a href="javascript:void(0);" id="btn_modifyData"
										class="btnP01" onclick="btn_modifyData;">수정</a>
								</div>
							</div>

							<div id="tab2" class="tabContent">
								<div class="tbl01" style="font-size: 11px">
									<table summary="운전면허증번호 성명 (실명) 생년월일" class="">
										<colgroup>
											<col width="45%" />
											<col width="17%" />
											<col width="42%" />
										</colgroup>
										<tbody>
											<tr>
												<td rowspan="8" class=""><img
													src="./images/license/mypage_license_v2.gif"
													alt="운전면허증 예시 이미지" /></td>
												<th scope="row">이름</th>
												<td><%=mem.getMemName()%><input type="hidden"
													id="mem_name" value="<%=mem.getMemName()%>" /></td>
											</tr>
											<tr>
												<th scope="row">주민등록번호</th>
												<td><%=mem.getMemJumin1()%><input type="hidden"
													id="mem_jumin1" value="<%=mem.getMemJumin1()%>" /> - <%=mem.getMemJumin2()%><input
													type="hidden" id="mem_jumin2"
													value="<%=mem.getMemJumin2()%>" />
											</tr>
											<tr>
												<th scope="row">면허 종류</th>
												<td><select id="licen_type" name="licen_type" class="" >
														<option value="" >선택</option>
														<option value="2" >2종 보통</option>
														<option value="1" >1종 보통</option>
														<option value="0" >1종 대형</option>
												</select></td>
											</tr>

											<tr>
												<th scope="row">면허 번호</th>
												<td>
													<p class="mgb3">
														<select id="licen_no1" name="licen_no1" class=""
															title="코드">
															<option value="">코드</option>
															<option value="11">11</option>
															<option value="12">12</option>
															<option value="13">13</option>
															<option value="14">14</option>
															<option value="15">15</option>
															<option value="16">16</option>
															<option value="17">17</option>
															<option value="18">18</option>
															<option value="19">19</option>
															<option value="20">20</option>
															<option value="21">21</option>
															<option value="22">22</option>
															<option value="23">23</option>
															<option value="24">24</option>
															<option value="25">25</option>
															<option value="26">26</option>
															<option value="28">28</option>
														</select>&nbsp;or &nbsp;&nbsp; <select id="licen_no1_1" class=""
															title="지역">
															<option value="">지역</option>
															<option value="서울">서울</option>
															<option value="경기">경기</option>
															<option value="인천">인천</option>
															<option value="부산">부산</option>
															<option value="대구">대구</option>
															<option value="대전">대전</option>
															<option value="광주">광주</option>
															<option value="울산">울산</option>
															<option value="경남">경남</option>
															<option value="경북">경북</option>
															<option value="전북">전북</option>
															<option value="전남">전남</option>
															<option value="충남">충남</option>
															<option value="충북">충북</option>
															<option value="강원">강원</option>
															<option value="제주">제주</option>
														</select>
													</p> <input type="text" class="" title="면허번호 10자리"
													name="licen_no2" id="licen_no2" value="" />
												</td>
											</tr>

											<tr>
												<th scope="row">발급일</th>

												<td><input title="발급연도" type="text" class=""
													name="licen_IssueDtYear" id="licen_IssueDtYear"
													maxlength="4" /> <span>년</span> <input title="발급월"
													type="text" class="" name="licen_IssueDtMonth"
													id="licen_IssueDtMonth" value="" maxlength="2" /> <span>월</span>
													<input title="발급일" type="text" class=""
													name="licen_IssueDtDay" id="licen_IssueDtDay" maxlength="2" />
													<span>일</span></td>
											</tr>

											<tr>
												<th scope="row">갱신기간<br />만료일
												</th>
												<td><input title="갱신기간 만료 연도" type="text" class=""
													name="licen_LimitDtYear" id="licen_LimitDtYear"
													maxlength="4" /> <span>년</span> <input title="갱신기간 만료 월"
													type="text" class="" name="licen_LimitDtMonth"
													id="licen_LimitDtMonth" value="" maxlength="2" /> <span>월</span>
													<input title="갱신기간 만료일" type="text" class=""
													name="licen_LimitDtDay" id="licen_LimitDtDay" maxlength="2" />
													<span>일</span></td>
											</tr>

											<tr>
												<th scope="row">주소</th>
												<td>
													<p class="mgb3">
														<input type="text" class="" title="우편번호"
															name="licenZipCode" id="licenZipCode" readonly="readonly" />
														<a href="#licenZipCode" id="postcodify_search_button2"
															class="btnTbl01 ml5"
															style="width: 50px; text-align: center;"><span>주소찾기</span></a>
													</p> <input type="text" class="" title="주소" name="licen_addr1"
													id="licen_addr1" style="width: 80%;" readonly="readonly" />
													<input type="text" class="" title="상세주소" name="licen_addr2"
													id="licen_addr2" style="width: 80%;" />
												</td>
											</tr>

										</tbody>
									</table>
								</div>
								<div class="btnArea02">
									<a href="javascript:void(0);" id="btn_LicenData"
										class="btnP01" onclick="btn_LicenData;">입력</a>
								</div>
							</div>
							<!-- 							<div class="btnArea02"> -->
							<!-- 								<a href="javascript:void(0);" id="btn_modifyData" class="btnP01" -->
							<!-- 									onclick="btn_modifyData;">수정</a> -->
							<!-- 							</div> -->

						</div>


					</div>
					<!-- charges-wrap -->

				</div>
				<!-- // bodyend -->
			</div>
			<!-- // end contentBox -->


			<!-- // End #content-wrap -->


			<!-- // End #container -->


			<!-- Begin #footer -->

			<jsp:include page="footer.jsp" />
		</div>
		<!-- // End #footer -->
	</div>
	<!-- // End #wrap -->


	<!-- 	select text input 스크립트  start -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script>
		//회원 기본 주소 검색
		$(function() {
			$("#postcodify_search_button").postcodifyPopUp({
				insertPostcode5 : "#homeZipCode",
				insertAddress : "#mem_addr1",
				insertDetails : "#mem_addr2"
			});
		});

		//회원 면허 주소 검색
		$(function() {
			$("#postcodify_search_button2").postcodifyPopUp({
				insertPostcode5 : "#licenZipCode",
				insertAddress : "#licen_addr1",
				insertDetails : "#licen_addr2"
			});
		});
	</script>



	<script type="text/javascript">
		$(document).ready(function() {

			//이메일 셀렉트
			$("#emailSelect").on("change", function() {
				form.EMAIL_2.value = $(this).val();
			});

			//탭
			$('ul.tabs li').click(function() {
				var tab_id = $(this).attr('data-tab');

				$('ul.tabs li').removeClass('current');
				$('.tabContent').removeClass('current');

				$(this).addClass('current');
				$("#" + tab_id).addClass('current');
			})

		})

		function checkAllDataInsert() {
			if ($("#mem_pw1").val() != "" && $("#mem_pw2").val() != ""
					&& $("#mem_addr1").val() != ""
					&& $("#mem_addr2").val() != ""
					&& $("#mem_phone1").val() != ""
					&& $("#mem_phone2").val() != ""
					&& $("#mem_phone3").val() != ""
					&& $("#mem_email1").val() != ""
					&& $("#mem_email2").val() != "") {
				//모든 칸이 채워져 있으면 return true
				return true;
			} else {
				return false;
			}
		}
		function checkLicenData() {
			if ($("#licen_type").val() != "" && $("#licen_no1").val() != ""
					&& $("#licen_no1").val() != ""
					&& $("#licen_no1_1").val() != ""
					&& $("#licen_no2").val() != ""
					&& $("#licen_IssueDtYear").val() != ""
					&& $("#licen_IssueDtMonth").val() != ""
					&& $("#licen_IssueDtDay").val() != ""
					&& $("#licen_LimitDtYear").val() != ""
					&& $("#licen_LimitDtMonth").val() != ""
					&& $("#licen_LimitDtDay").val() != ""
					&& $("#licenZipCode").val() != ""
					&& $("#licen_addr1").val() != ""
					&& $("#licen_addr2").val() != "") {
				return true;
			} else {
				return false;
			}
		}
		
		$("#mem_pw2").blur(function(){
			var memPw1 = $("#mem_pw1").val();
			var memPw2 = $("#mem_pw2").val();
			if(memPw1 == memPw2){
				$("#alert_pwCheck").html("비밀번호 확인완료.");
			}else{
				$("#alert_pwCheck").html("비밀번호가 다릅니다.");
			}
		});
		
		$("#btn_LicenData").click(function() {
			if (checkLicenData()) {
				var mem_id = $("#mem_id").val();
				var mem_name = $("#mem_name").val();
				var mem_jumin = $("#mem_jumin1").val() + $("#mem_jumin2").val();
				var licen_type = $("#licen_type").val();
				var licen_num = $("#licen_no1").val() + $("#licen_no1_1").val()	+ $("#licen_no2").val();
				var licen_issuedate = $("#licen_IssueDtYear").val()	+ $("#licen_IssueDtMonth").val() + $("#licen_IssueDtDay").val();
				var licen_limitdate = $("#licen_LimitDtYear").val()	+ $("#licen_LimitDtMonth").val() + $("#licen_LimitDtDay").val();
				var licen_addr = $("#licenZipCode").val() + "/"	+ $("#licen_addr1").val() + "/"	+ $("#licen_addr2").val();
				
				console.log("이름  : " + mem_name);
				console.log("주민 : " + mem_jumin);
				console.log("면허 종류 :" + licen_type);
				console.log("면허 번호 :" + licen_num);
				console.log("면허 생성날 :" + licen_issuedate);
				console.log("면허 갱신날 :" + licen_limitdate);
				console.log("면허 주소 :" + licen_addr);
				
				$.ajax({
					type : "POST",
					url : "/LicenData.do",
					dataType : "json",
					data : {
						memId : mem_id,
						memName : mem_name,
						memJumin : mem_jumin,
						licenType : licen_type,
						licenNum : licen_num,
						licenIssueDate : licen_issuedate,
						licenLimitDate : licen_limitdate,
						licenAddr : licen_addr
					},

					success : function(data) {
						alert("면허정보 입력 성공");
					},
					error : function(e) {
						console.log("------error------");
						console.log(e.responseText);
					}
				});
			} else {
				alert("필수 항목 에러");
				return;
			}
		});
		
		$("#btn_modifyData").click(
				function() {
					//모든값이 채워져있을때만 (true) 발동하게 변경. false면 alert 발생
					if (checkAllDataInsert() == true) {
						var mem_id = $("#mem_id").val();
						var mem_pw = $("#mem_pw2").val(); //mem_pw2는 비밀번호를 확인한 다음값이기 때문에 2로 값을불러옴
						var mem_name = $("#mem_name").val();
						var mem_jumin = $("#mem_jumin1").val() + $("#mem_jumin2").val();
						var mem_phone = $("#mem_phone1").val() + $("#mem_phone2").val() + $("#mem_phone3").val();
						var mem_addr = $("#homeZipCode").val() + "/" + $("#mem_addr1").val() + "/" + $("#mem_addr2").val();
						var mem_email = $("#mem_email1").val() + "@" + $("#mem_email2").val();
						

						//입력 데이터 확인 코드
						console.log("아이디 : " + mem_id);
						console.log("패스워드 : " + mem_pw);
						console.log("이름  : " + mem_name);
						console.log("주민 : " + mem_jumin);
						console.log("핸드폰 : " + mem_phone);
						console.log("주소 : " + mem_addr);
						console.log("이메일 : " + mem_email);
						
						$.ajax({
							type : "POST",
							url : "/modifyData.do",
							dataType : "json",
							data : {
								memName : mem_name,
								memJumin : mem_jumin,
								memId : mem_id,
								memPw : mem_pw,
								memPhone : mem_phone,
								memAddr : mem_addr,
								memEmail : mem_email,
								licenType : licen_type,
								licenNum : licen_num,
								licenIssueDate : licen_issuedate,
								licenLimitDate : licen_limitdate,
								licenAddr : licen_addr
							},

							success : function(data) {
								alert("회원정보 수정 성공");
							},
							error : function(e) {
								console.log("------error------");
								console.log(e.responseText);
							}
						});
					} else {
						alert("필수 항목을 모두 채워주세요.");
						return;
					}
				});
	</script>

</body>

</html>

<%} %>
<!-- 로그인 세션 끄읕~ -->
