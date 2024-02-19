<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="./include/head.jsp" %>
<%@page import="com.mysql.cj.protocol.a.NativeConstants.StringLengthDataType"%>
<%@page import="com.mysql.cj.protocol.a.NativeConstants.StringLengthDataType"%>

<%
String cate = request.getParameter("cate");
String sort = request.getParameter("sort");

String key = request.getParameter("key");

response.setCharacterEncoding("EUC-KR");

if(key == null) key = "";

if(sort.equals("") || sort == null) sort = "X";

int page_no = 1;
try
{
	page_no = Integer.parseInt(request.getParameter("page"));
}catch(Exception e){}

if( cate == null ) cate = "A";

String type = "";

switch(cate) {
	case "A" :
		type = "전체 관광지";
		break;
	case "H" :
		type = "유적지";
		break;
	case "M" :
		type = "박물관/전시관";
		break;
	case "D" :
		type = "드라마세트장";
		break;
	case "P" :
		type = "공원/유원시설";
		break;
	case "C" :
		type = "문화체육시설";
		break;
	case "R" :
		type = "농촌체험시설";
		break;
	case "T" :
		type = "전통시장";
		break;
	case "E" :
		type = "기타";
		break;

}
ListDTO dto = new ListDTO();
ArrayList<TourDesVO> clist = dto.GetCateWords(type);

//페이징 1단계 : 전체 게시물 갯수를 얻는다.
int totalData = dto.GetTotal(type,key);

//페이징 2단계 : 전체 페이지 갯수를 계산한다.
int totalPage =  totalData / 9;
if(totalData % 10 != 0)
{
	//10으로 나눈 나머지가 0이 아니면
	//전체 페이지 갯수 증가
	totalPage++;
}




String dic_list = "";
for ( TourDesVO vo : clist ) {
	String name = vo.getName();
	String bcount = vo.getBcount();
	
	String dic = "{ text : '" + name + "', count : " + bcount + " },";
	
	dic_list += dic;
	}
%>


<style>
	#plot_title
	{
		font-size: 36px;
	}
	#cate_table
	{
		margin-bottom: 40px;
	}
	
	#total_bNum
	{
		width:100px;
		height:20px;
	}
	
	#col_button
	{
		background-color: darkgray;
		color: white;
	}
	
</style>
<script>
	window.onload = function() {

		<%-- LoadTourList("<%= sort %>"); --%>
		
		data = [ <%= dic_list %> ];
		
		ViewCloud("wordCloud",data);
		
	}
	
	function ViewCloud(id,data) {
		zingchart.MODULESDIR = 'https://cdn.zingchart.com/modules/';
		
		var myConfig = {
			type: 'wordcloud',
			options: {
				words: data,
				minLength: 5,
				ignore: [""],
				maxItems: 50,
				aspect: 'spiral', // 'flow-top' | 'flow-center'
		  
		     colorType: 'palette',
		     palette: ['#D32F2F', '#5D4037', '#1976D2', '#E53935', '#6D4C41', '#1E88E5', '#F44336', '#795548', '#2196F3', '#EF5350', '#8D6E63', '#42A5F5'],
		  
		     style: {
		       fontFamily: 'Crete Round',
		  
		       hoverState: {
		         backgroundColor: '#D32F2F',
		         borderRadius: 2,
		         fontColor: 'white'
		       },
		       tooltip: {
		         text: '%text: %hits',
		         visible: true,
		         alpha: 0.9,
		         backgroundColor: '#1976D2',
		         borderRadius: 2,
		         borderColor: 'none',
		         fontColor: 'white',
		         fontFamily: 'Georgia',
		         textAlpha: 1
		       }
		     }
		   },
		  
		   source: {
		     fontColor: '#64B5F6',
		     fontSize: 10,
		     fontFamily: 'Georgia',
		     fontWeight: 'normal',
		     marginBottom: '10%'
		   }
		 };

		//워드클라우드 렌더링
		 zingchart.render({
		   id: id,
		   data: myConfig,
		   height: 300,
		   width: 1000
		 });
	}
	
	<%-- function LoadTourList(sort) {

		$.ajax({
			type: "get",
			url : "tourlist.jsp?sort=" + sort + "&cate=<%= cate %>&page=<%= page_no %>",
			dataType : "html",
			success : function(data) {
				data = data.trim();
				//alert(data);
				$("#tourlist").html(data);
			}
		});	
	} --%>
	
	function sortSelect(){
	    var langSelect = document.getElementById("sort");
	    
	     
	    // select element에서 선택된 option의 value가 저장된다.
	    var sort = langSelect.options[langSelect.selectedIndex].value;
	    // LoadTourList(sort);
	    document.location = "tema.jsp?cate=<%= cate %>&page=<%= page_no %>&sort=" + sort + "&key=<%= key %>";
	 
	    // select element에서 선택된 option의 text가 저장된다.
	    var selectText = langSelect.options[langSelect.selectedIndex].text;
	}
	
	function search() {

		var key = $("#key").val();
		key = key.trim();
		key = decodeURI(key);
		
		document.location = "tema.jsp?cate=<%= cate %>&page=<%= page_no %>&sort=<%= sort %>&key=" + key;
	}
	
	
	
	

	
	

	</script>
		<!-- 중단 테이블 -->
		<table border="0" align="center" style="width:1200px;">
			<tr>
				<td align="center" style="width:400px; height:360px;">
					<table border="0" style="width:600px; margin-bottom: 40px;">
						<tr>
							<td align="center" id="wordCloud"></td>
						</tr>
						<tr>
							<th align="center" id="plot_title" height="60px"><%= type %> 에 대한 키워드 분석</th>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td align="center">
					<table border="0" id="cate_table" style="width:1100px; height:40px;">
						<tr>
						<%
						if ( cate.equals("A") ) {
							%>
							<td id="Pcate_btn" width="11%" height="40px">
							<%
						}else {
							%>
							<td id="cate_btn" width="11%" height="40px">
							<%
						}
						%>
								<div align="center" style="width:111px; height:30px; margin-top: 5px;"
								onclick="location.href='tema.jsp?cate=A&page=1&sort=X'">전체</div>
							</td>
						
						
						<%
						if ( cate.equals("H") ) {
							%>
							<td id="Pcate_btn" width="11%" height="40px">
							<%
						}else {
							%>
							<td id="cate_btn" width="11%" height="40px">
							<%
						}
						%>
								<div align="center" style="width:111px; height:30px; margin-top: 5px;"
								onclick="location.href='tema.jsp?cate=H&page=1&sort=X'">유적지</div>
							</td>
							
							
						<%
						if ( cate.equals("M") ) {
							%>
							<td id="Pcate_btn" width="11%" height="40px">
							<%
						}else {
							%>
							<td id="cate_btn" width="11%" height="40px">
							<%
						}
						%>
								<div align="center" style="width:111px; height:30px; margin-top: 5px;"
								onclick="location.href='tema.jsp?cate=M&page=1&sort=X'">박물관</div>
							</td>
							
						<%
						if ( cate.equals("D") ) {
							%>
							<td id="Pcate_btn" width="11%" height="40px">
							<%
						}else {
							%>
							<td id="cate_btn" width="11%" height="40px">
							<%
						}
						%>
								<div align="center" style="width:111px; height:30px; margin-top: 5px;"
								onclick="location.href='tema.jsp?cate=D&page=1&sort=X'">드라마 세트장</div>
							</td>
							
						<%
						if ( cate.equals("P") ) {
							%>
							<td id="Pcate_btn" width="11%" height="40px">
							<%
						}else {
							%>
							<td id="cate_btn" width="11%" height="40px">
							<%
						}
						%>
								<div align="center" style="width:111px; height:30px; margin-top: 5px;"
								onclick="location.href='tema.jsp?cate=P&page=1&sort=X'">공원/유원시설</div>
							</td>
							
						<%
						if ( cate.equals("C") ) {
							%>
							<td id="Pcate_btn" width="11%" height="40px">
							<%
						}else {
							%>
							<td id="cate_btn" width="11%" height="40px">
							<%
						}
						%>
								<div align="center" style="width:111px; height:30px; margin-top: 5px;"
								onclick="location.href='tema.jsp?cate=C&page=1&sort=X'">문화체육시설</div>
							</td>
							
						<%
						if ( cate.equals("R") ) {
							%>
							<td id="Pcate_btn" width="11%" height="40px">
							<%
						}else {
							%>
							<td id="cate_btn" width="11%" height="40px">
							<%
						}
						%>
								<div align="center" style="width:111px; height:30px; margin-top: 5px;"
								onclick="location.href='tema.jsp?cate=R&page=1&sort=X'">농촌체험시설</div>
							</td>
							
						<%
						if ( cate.equals("T") ) {
							%>
							<td id="Pcate_btn" width="11%" height="40px">
							<%
						}else {
							%>
							<td id="cate_btn" width="11%" height="40px">
							<%
						}
						%>
								<div align="center" style="width:111px; height:30px; margin-top: 5px;"
								onclick="location.href='tema.jsp?cate=T&page=1&sort=X'">전통시장</div>
							</td>
							
						<%
						if ( cate.equals("E") ) {
							%>
							<td id="Pcate_btn" width="11%" height="40px">
							<%
						}else {
							%>
							<td id="cate_btn" width="11%" height="40px">
							<%
						}
						%>
								<div align="center" style="width:111px; height:30px; margin-top: 5px;"
								onclick="location.href='tema.jsp?cate=E&page=1&sort=X'">기타</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<!-- 중단 테이블 -->
		<!-- 하단 테이블 -->
		<table border="0" align="center" style="width:1100px;">
			<tr>
				<!-- 총 게시물 수 & 정렬기준 -->
				<td align="left">
					<table border="0" style="width:250px;">
						<tr>
							<th id="total_bNum" align="left">
								<font size="2">
									총 게시물 <%= tvo.getCount() %>
								</font>
							</th>
							<td style="width:150px; height:40px;">
								<select id="sort" name="sort" style="width:150px; height:40px;" onchange="sortSelect()">	
									<option value="X" style="text-align:center;" <%= sort.equals("X") ? "selected" : "" %>>
									정렬
									</option>
									<option value="L" <%= sort.equals("L") ? "selected" : "" %>>좋아요 많은 순</option>
									<option value="RL" <%= sort.equals("RL") ? "selected" : "" %>>좋아요 적은 순</option>
									<option value="N" <%= sort.equals("N") ? "selected" : "" %>>네이버 포스팅 많은 순</option>
									<option value="RN" <%= sort.equals("RN") ? "selected" : "" %>>네이버 포스팅 적은 순</option>
									<option value="I" <%= sort.equals("I") ? "selected" : "" %>>인스타 언급 많은 순</option>
									<option value="RI" <%= sort.equals("RI") ? "selected" : "" %>>인스타 언급 적은 순</option>
								</select>
							</td>
						</tr>
					</table>
				</td>
				<!-- 총 게시물 수 & 정렬기준 -->
				<!-- 검색 -->
				<td align="right" >
					<table style="width:400px;">
						<tr>
							<!-- <td>
								<table style="width:100px;">
									<tr>
										<td style="width:80px; height:40px;">
											<select id="search_title" name="search_title" style="width:100px; height:40px;">
												<option value="X">검색 항목</option>
												<option value="K">키워드</option>
												<option value="TN">관광지 명</option>
											</select>
										</td>
									</tr>
								</table>
							</td> -->
							<td align="right">
								<table id="search_table" style="width:320px;" align="right">
									<tr>
										<td align="center" width="250px">
											<input id="key" name="key" type="text" style="width:240px; height:40px;" placeholder="검색어를 입력하세요.">
										</td>
										<td id="search_icon" align="center" style="width:50px; height:25px;"
										onclick="search();">
											<input type="image" src="./icon/search.png" style="width:35px; height:30px;">
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
				<!-- 검색 -->
			</tr>
			<tr>
				<td height="40px" colspan="2">
				</td>
			</tr>
			<tr>
				<!-- 관광지 -->
				<td colspan="2" id="tourlist" align="center">
					<table  style="width:1100px; table-layout: fixed;">
						<tr>
						<%
						
						ArrayList<TourDesVO> list = dto.GetList(page_no,type,sort,key,9);
						int colNo = 0;
						for (TourDesVO vo : list) {
							
							String no = vo.getNo();
							String name = vo.getName();
							String pic = vo.getPic();
							String likey = vo.getLikey();
							
							if(colNo % 3 == 0)
							{
								%>
								<tr>
								<%
							}
							%>
								<td align="center">
									<table id="tureDes_table" onclick="location.href='tourdes.jsp?no=<%= no %>'"
									style="margin:20px;">
										<tr>
											<td colspan="2" align="center">
												<img src="<%= pic %>" style="width:300px; height:200px; margin-bottom: 10px;">
											</td>
										</tr>
										<tr>
											<td style="width:200px; height:30px;">
												<div style="width:250px; height:30px;"><%= name %></div>
											</td>
											<td align="right" style="width:100px; height:30px;">
											<%
											if (likey.equals("0")) {
												%>
												<div style="width:50px; height:30px;">♡<%= likey %></div>
												<%
											}else {
												%>
												<div style="width:50px; height:30px;">♥<%= likey %></div>
												<%
											}
											%>
											</td>
										</tr>
									</table>
								</td>
							
							<%
							if(colNo % 5 == 2)
							{
								%>
								</tr>
								<!-- <tr>
									<td height="20px" colspan="3">
									</td>
								</tr> -->
								<%
								colNo = 0;
							}else
							{
								colNo++;
							}
						}
						%>
					</table>
				</td>
				<!-- 관광지 -->
			</tr>
			<tr>
				<td height="65px" colspan="3">
				</td>
			</tr>
			<tr>
				<!-- 페이징 -->
				<td align="center" colspan="3" style="width:1200px;">
					<table border="0" style="width:300px; table-layout:fixed;">
						<tr>
						<%
						//페이징 5단계 : 시작 블럭 페이지와 종료 블럭 페이지 계산
						//현재 페이지 번호가 16일때 시작 블럭 페이지 : 11 , 종료 블럭 페이지 : 20 으로 계산
						int startBlock = ((page_no-1)/10)*10; //시작 블록 페이지
						startBlock += 1;
						int endBlock = startBlock  + 10 - 1;  //종료 블록 페이지
						if( endBlock > totalPage)
						{
							//종료 블록 페이지가 전체 페이지보다 크면....
						    endBlock = totalPage;
						}		
						
						//페이징 6단계 : 이전  [ 페이지 번호 목록 ] 다음  을 표시한다.
						//이전 블럭 표시하기
						if(startBlock > 10)
						{
							%>
							<td id="btn_pNum" align="center"
							onclick="location.href='tema.jsp?cate=<%= cate %>&page=<%= startBlock - 1 %>&sort=<%= sort %>'">
								◀
							</td>
							<%				
						}		
						for(int i = startBlock; i <= endBlock; i++)
						{
							if( i == page_no )
							{
								//현재 페이지임
								%>
								<td id="btn_thisPage" align="center" 
								onclick="location.href='tema.jsp?cate=<%= cate %>&page=<%= i %>&sort=<%= sort %>'">
									<%= i %>
								</td>
								<%
							}else
							{
								%>
								<td id="btn_anotherPage" align="center"
								onclick="location.href='tema.jsp?cate=<%= cate %>&page=<%= i %>&sort=<%= sort %>'">
									<%= i %>
								</td>
								<%
							}
						}
						
						//다음 블럭 표시하기
						if(endBlock < totalPage)
						{
							%>
							<td id="btn_pNum" align="center"
							onclick="location.href='tema.jsp?cate=<%= cate %>&page=<%= endBlock + 1 %>&sort=<%= sort %>'">
								▶
							</td>
							<%					
						}		
						%>
						</tr>
					</table>
				</td>
				<!-- 페이징 -->
			</tr>
			<tr>
				<td colspan="3" height="40px">
				</td>
			</tr>
		</table>
		<!-- 하단 테이블 -->
	</body>
</html>