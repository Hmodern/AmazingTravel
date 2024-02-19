<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="at.vo.*" %>
<%@ page import="at.dto.*" %>
<%@page import="java.util.ArrayList"%>
<%@ include file="./include/head.jsp" %>
<%
String no = request.getParameter("no");
String ip = request.getRemoteAddr();

if ( no == null ) {
	
	out.println("������ ��ȣ�� ��ȸ���� �ʽ��ϴ�. ");
	return;
}

TourDesDTO dto = new TourDesDTO();
TourDesVO vo = dto.ReadTourDes(no);
KeyWordDTO kdto = new KeyWordDTO();
LikeyDTO likey = new LikeyDTO();
LikeyVO lvo = likey.getIp(no, ip);


ArrayList<KeyWordVO> list = dto.getKey(no);
ArrayList<KeyWordVO> klist = kdto.getCKey(no);

String key_list = "";
for( KeyWordVO kvo : klist ) {
	String keyword = kvo.getKeyword();
	String kcount = kvo.getKcount();
	
	String key = "{ text : '" + keyword + "', count : " + kcount + " }, ";
	
	key_list += key;
}
%>
<style>
#tourdes_pic
{
	width: 1000px;
	height: 400px;
	margin-top: 10px;
	margin-bottom: 40px;
}

#keyword
{
	width:100px;
	height:50px;
	background-color: darkgray;
	color: white;
	margin-right: 45px;
}

#keyword_title
{
	font-size: 32px;
	margin-bottom: 40px;
}
</style>
<script>
window.onload = function() {
			
	data = [ <%= key_list %> ];
	
	ViewCloud("wc",data);
}

function ViewCloud(id,data) {
	zingchart.MODULESDIR = 'https://cdn.zingchart.com/modules/';
	
	var myConfig = {
		type: 'wordcloud',
		options: {
			words: data,
			minLength: 5,
			ignore: [""],
			maxItems: 40,
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
	   height: 320,
	   width: 470
	 });
}

function Likey() {

	$.ajax({
		type: "post",
		url : "likey.jsp?ip=<%= ip %>&no=<%= no %>",
				
		dataType : "html",
		success : function(data) {

			document.location = "tourdes.jsp?ip=<%= ip %>&no=<%= no %>";
		}
	});
}
</script>
		<!-- �ߴ� ���̺� -->
		<table width="1200px" align="center" style="margin-bottom: 50px;">
			<tr>
			<!-- ������ ���� ���� -->
				<td align="center">
					<table border="0" style="width:1000px; hegiht:50px;">
						<tr>
							<th style="font-size: 32px;" align="left">
								<%= vo.getName() %>
							</th>
							<td id="likey" align="right">
							<%
							if( lvo == null ) {
								%>
								<img src="./icon/white_heart.png" style="width:50px; height:50px;" onclick="Likey();">
								<%
							}else if ( lvo.getPushed_ip().equals(ip) ) {
								%>
								<img src="./icon/red_heart.png" style="width:50px; height:50px;" onclick="Likey();">
								<%
							}
							%>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td align="center">
					<img id="tourdes_pic" src="<%= vo.getPic() %>">
				</td>
			<!-- ������ ���� ���� -->
			</tr>
			<tr>
				<td align="center">
					<table id="keyword_title" style="width:1000px;">
						<tr>
							<th align="left" colspan="5" style="">
								���� Ű����
							</th>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td align="left">
				<!-- Ű���� -->
					<table border="0" style="width:500px; margin-left:100px;">
						<tr>
						<%
						for ( KeyWordVO kvo :  list ) {
							String keyword = kvo.getKeyword();
							%>
							<td align="left" width="150px">
								<table  id="keyword" style="width:150px; height:50px;">
									<tr>
										<td align="center">
											# <%= keyword %>
										</td>
									</tr>
								</table>
							</td>
							<%
						}
						%>
						</tr>
					</table>
				<!-- Ű���� -->
				</td>
			</tr>
		</table>
		<!-- �ߴ� ���̺� -->
		<!-- �ϴ� ���̺� -->
		<table align="center" width="1000px">
			<tr>
				<td id="wc"></td>
				<td style="width:530px; height:320px;">
					<div id="map" style="width:100%;height:320px;"></div>
				</td>
			</tr>
			<tr>
				<td colspan="2" height="50px">
				</td>
			</tr>
			<tr>
				<th colspan="2" align="left" style="font-size: 32px;">
					������ ����
				</th>
			</tr>
			<tr>
				<td colspan="2" width="1000px">
					<%= vo.getOutline() %>
				</td>
			</tr>
			<tr>
				<td colspan="2" height="40px">
				</td>
			</tr>
			<tr>
				<th colspan="2" align="left" style="font-size: 32px;">
					������
				</th>
			</tr>
			<tr>
				<td colspan="2" width="1000px">
					<%= vo.getInfo() %>
				</td>
			</tr>
			<tr>
				<td colspan="2" height="110px">
				</td>
			</tr>
		</table>
		<!-- �ϴ� ���̺� -->
		<!-- ���ϴ� ���̺� -->
		<table border="0" style="width:1000px;" align="center">
			<tr>
				<td align="center">
				<!-- ���̹� ������ �� -->
					<table style="width:500px;">
						<tr>
							<th align="center" style="font-size: 32px;">���̹� ������ ��</th>
							<td>
							</td>
						</tr>
						<tr>
							<td height="110px">
							</td>
						</tr>
						<tr>
							<th align="center" style="font-size: 24px;">
								<a href="">
									<%= vo.getBcount() %>��
								</a>
							</th>
						</tr>
						<tr>
							<td height="160px">
							</td>
						</tr>
					</table>
				<!-- ���̹� ������ �� -->
				</td>
				<td align="center">
				<!-- �ν�Ÿ ��� �� -->
					<table style="width:500px;">
						<tr>
							<th align="center" style="font-size: 32px;">�ν�Ÿ�׷� ��� ��</th>
							<td>
							</td>
						</tr>
						<tr>
							<td height="110px">
							</td>
						</tr>
						<tr>
							<th align="center" style="font-size: 24px;">
								<a href="">
									38��
								</a>
							</th>
						</tr>
						<tr>
							<td height="160px">
							</td>
						</tr>
					</table>
				<!-- �ν�Ÿ ��� �� -->
				</td>
			</tr>
		</table>
		<!-- ���ϴ� ���̺� -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2448c68f3a0afb5763e4a2f4288d0175&libraries=services"></script>
		<script>
		// ��Ŀ�� Ŭ���ϸ� ��Ҹ��� ǥ���� ���������� �Դϴ�
		var infowindow = new kakao.maps.InfoWindow({zIndex:1});

		var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.566826, 126.9786567), // ������ �߽���ǥ
		        level: 3 // ������ Ȯ�� ����
		    };  

		// ������ �����մϴ�    
		var map = new kakao.maps.Map(mapContainer, mapOption); 

		// ��� �˻� ��ü�� �����մϴ�
		var ps = new kakao.maps.services.Places(); 

		// Ű����� ��Ҹ� �˻��մϴ�
		ps.keywordSearch('<%= vo.getName() %>', placesSearchCB); 

		// Ű���� �˻� �Ϸ� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
		function placesSearchCB (data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {

		        // �˻��� ��� ��ġ�� �������� ���� ������ �缳���ϱ�����
		        // LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
		        var bounds = new kakao.maps.LatLngBounds();

		        for (var i=0; i<data.length; i++) {
		            displayMarker(data[i]);    
		            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
		        }       

		        // �˻��� ��� ��ġ�� �������� ���� ������ �缳���մϴ�
		        map.setBounds(bounds);
		    } 
		}

		// ������ ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
		function displayMarker(place) {
		    
		    // ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
		    var marker = new kakao.maps.Marker({
		        map: map,
		        position: new kakao.maps.LatLng(place.y, place.x) 
		    });

		    // ��Ŀ�� Ŭ���̺�Ʈ�� ����մϴ�
		    kakao.maps.event.addListener(marker, 'click', function() {
		        // ��Ŀ�� Ŭ���ϸ� ��Ҹ��� ���������쿡 ǥ��˴ϴ�
		        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
		        infowindow.open(map, marker);
		    });
		}
		</script>
	</body>
</html>