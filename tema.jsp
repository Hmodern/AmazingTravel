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
		type = "��ü ������";
		break;
	case "H" :
		type = "������";
		break;
	case "M" :
		type = "�ڹ���/���ð�";
		break;
	case "D" :
		type = "��󸶼�Ʈ��";
		break;
	case "P" :
		type = "����/�����ü�";
		break;
	case "C" :
		type = "��ȭü���ü�";
		break;
	case "R" :
		type = "����ü��ü�";
		break;
	case "T" :
		type = "�������";
		break;
	case "E" :
		type = "��Ÿ";
		break;

}
ListDTO dto = new ListDTO();
ArrayList<TourDesVO> clist = dto.GetCateWords(type);

//����¡ 1�ܰ� : ��ü �Խù� ������ ��´�.
int totalData = dto.GetTotal(type,key);

//����¡ 2�ܰ� : ��ü ������ ������ ����Ѵ�.
int totalPage =  totalData / 9;
if(totalData % 10 != 0)
{
	//10���� ���� �������� 0�� �ƴϸ�
	//��ü ������ ���� ����
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

		//����Ŭ���� ������
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
	    
	     
	    // select element���� ���õ� option�� value�� ����ȴ�.
	    var sort = langSelect.options[langSelect.selectedIndex].value;
	    // LoadTourList(sort);
	    document.location = "tema.jsp?cate=<%= cate %>&page=<%= page_no %>&sort=" + sort + "&key=<%= key %>";
	 
	    // select element���� ���õ� option�� text�� ����ȴ�.
	    var selectText = langSelect.options[langSelect.selectedIndex].text;
	}
	
	function search() {

		var key = $("#key").val();
		key = key.trim();
		key = decodeURI(key);
		
		document.location = "tema.jsp?cate=<%= cate %>&page=<%= page_no %>&sort=<%= sort %>&key=" + key;
	}
	
	
	
	

	
	

	</script>
		<!-- �ߴ� ���̺� -->
		<table border="0" align="center" style="width:1200px;">
			<tr>
				<td align="center" style="width:400px; height:360px;">
					<table border="0" style="width:600px; margin-bottom: 40px;">
						<tr>
							<td align="center" id="wordCloud"></td>
						</tr>
						<tr>
							<th align="center" id="plot_title" height="60px"><%= type %> �� ���� Ű���� �м�</th>
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
								onclick="location.href='tema.jsp?cate=A&page=1&sort=X'">��ü</div>
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
								onclick="location.href='tema.jsp?cate=H&page=1&sort=X'">������</div>
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
								onclick="location.href='tema.jsp?cate=M&page=1&sort=X'">�ڹ���</div>
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
								onclick="location.href='tema.jsp?cate=D&page=1&sort=X'">��� ��Ʈ��</div>
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
								onclick="location.href='tema.jsp?cate=P&page=1&sort=X'">����/�����ü�</div>
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
								onclick="location.href='tema.jsp?cate=C&page=1&sort=X'">��ȭü���ü�</div>
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
								onclick="location.href='tema.jsp?cate=R&page=1&sort=X'">����ü��ü�</div>
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
								onclick="location.href='tema.jsp?cate=T&page=1&sort=X'">�������</div>
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
								onclick="location.href='tema.jsp?cate=E&page=1&sort=X'">��Ÿ</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<!-- �ߴ� ���̺� -->
		<!-- �ϴ� ���̺� -->
		<table border="0" align="center" style="width:1100px;">
			<tr>
				<!-- �� �Խù� �� & ���ı��� -->
				<td align="left">
					<table border="0" style="width:250px;">
						<tr>
							<th id="total_bNum" align="left">
								<font size="2">
									�� �Խù� <%= tvo.getCount() %>
								</font>
							</th>
							<td style="width:150px; height:40px;">
								<select id="sort" name="sort" style="width:150px; height:40px;" onchange="sortSelect()">	
									<option value="X" style="text-align:center;" <%= sort.equals("X") ? "selected" : "" %>>
									����
									</option>
									<option value="L" <%= sort.equals("L") ? "selected" : "" %>>���ƿ� ���� ��</option>
									<option value="RL" <%= sort.equals("RL") ? "selected" : "" %>>���ƿ� ���� ��</option>
									<option value="N" <%= sort.equals("N") ? "selected" : "" %>>���̹� ������ ���� ��</option>
									<option value="RN" <%= sort.equals("RN") ? "selected" : "" %>>���̹� ������ ���� ��</option>
									<option value="I" <%= sort.equals("I") ? "selected" : "" %>>�ν�Ÿ ��� ���� ��</option>
									<option value="RI" <%= sort.equals("RI") ? "selected" : "" %>>�ν�Ÿ ��� ���� ��</option>
								</select>
							</td>
						</tr>
					</table>
				</td>
				<!-- �� �Խù� �� & ���ı��� -->
				<!-- �˻� -->
				<td align="right" >
					<table style="width:400px;">
						<tr>
							<!-- <td>
								<table style="width:100px;">
									<tr>
										<td style="width:80px; height:40px;">
											<select id="search_title" name="search_title" style="width:100px; height:40px;">
												<option value="X">�˻� �׸�</option>
												<option value="K">Ű����</option>
												<option value="TN">������ ��</option>
											</select>
										</td>
									</tr>
								</table>
							</td> -->
							<td align="right">
								<table id="search_table" style="width:320px;" align="right">
									<tr>
										<td align="center" width="250px">
											<input id="key" name="key" type="text" style="width:240px; height:40px;" placeholder="�˻�� �Է��ϼ���.">
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
				<!-- �˻� -->
			</tr>
			<tr>
				<td height="40px" colspan="2">
				</td>
			</tr>
			<tr>
				<!-- ������ -->
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
												<div style="width:50px; height:30px;">��<%= likey %></div>
												<%
											}else {
												%>
												<div style="width:50px; height:30px;">��<%= likey %></div>
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
				<!-- ������ -->
			</tr>
			<tr>
				<td height="65px" colspan="3">
				</td>
			</tr>
			<tr>
				<!-- ����¡ -->
				<td align="center" colspan="3" style="width:1200px;">
					<table border="0" style="width:300px; table-layout:fixed;">
						<tr>
						<%
						//����¡ 5�ܰ� : ���� �� �������� ���� �� ������ ���
						//���� ������ ��ȣ�� 16�϶� ���� �� ������ : 11 , ���� �� ������ : 20 ���� ���
						int startBlock = ((page_no-1)/10)*10; //���� ��� ������
						startBlock += 1;
						int endBlock = startBlock  + 10 - 1;  //���� ��� ������
						if( endBlock > totalPage)
						{
							//���� ��� �������� ��ü ���������� ũ��....
						    endBlock = totalPage;
						}		
						
						//����¡ 6�ܰ� : ����  [ ������ ��ȣ ��� ] ����  �� ǥ���Ѵ�.
						//���� �� ǥ���ϱ�
						if(startBlock > 10)
						{
							%>
							<td id="btn_pNum" align="center"
							onclick="location.href='tema.jsp?cate=<%= cate %>&page=<%= startBlock - 1 %>&sort=<%= sort %>'">
								��
							</td>
							<%				
						}		
						for(int i = startBlock; i <= endBlock; i++)
						{
							if( i == page_no )
							{
								//���� ��������
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
						
						//���� �� ǥ���ϱ�
						if(endBlock < totalPage)
						{
							%>
							<td id="btn_pNum" align="center"
							onclick="location.href='tema.jsp?cate=<%= cate %>&page=<%= endBlock + 1 %>&sort=<%= sort %>'">
								��
							</td>
							<%					
						}		
						%>
						</tr>
					</table>
				</td>
				<!-- ����¡ -->
			</tr>
			<tr>
				<td colspan="3" height="40px">
				</td>
			</tr>
		</table>
		<!-- �ϴ� ���̺� -->
	</body>
</html>