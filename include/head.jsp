<%@page import="at.dto.BlogcdDTO"%>
<%@page import="at.vo.BlogcdVO"%>
<%@page import="at.dto.TourDesDTO"%>
<%@page import="at.vo.TourDesVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="at.dto.ListDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="at.*" %>
<%
ListDTO ldto = new ListDTO();
ArrayList<TourDesVO> tlist = ldto.GetCateCount();
TourDesDTO tdto = new TourDesDTO();
TourDesVO tvo = tdto.GetTotal();
BlogcdDTO bdto = new BlogcdDTO();
BlogcdVO bvo = bdto.GetTotal();

String cate_list = "";
String link_cate = "";
for ( TourDesVO vo : tlist ) {
	String cate = vo.getCate();
	String count = vo.getCcount();
	String cate_dic = "{ text : '" + cate + "', count : " + count + " },";
	String link_dic = "'" + cate + "',";
	
	cate_list += cate_dic;
	link_cate += link_dic;
	
	
}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Amazing Travel</title>
		<link href="https://fonts.googleapis.com/css?family=Crete+Round" rel="stylesheet">
		<link rel="stylesheet" href="./css/jquery-ui.css">
  		<script src="https://cdn.zingchart.com/zingchart.min.js"></script>
  		<script src="https://cdn.amcharts.com/lib/5/index.js"></script>
		<script src="https://cdn.amcharts.com/lib/5/hierarchy.js"></script>
		<script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>
		<script src="./js/jquery-3.7.1.js"></script>
		<script src="./js/jquery-ui.js"></script>
	</head>
	<style>
	#sub_title
	{
		font-size: 24px;
		color: #8E44AD;
	}
	
	#title
	{
		font-size: 30px;
	}
	
	#logo
	{
		margin: 10px;
	}
	
	#plot_title
	{
		font-size: 32px;
	}
	
	#logo_div
	{
		margin-top: 30px;
		margin-bottom: 80px;
	}
	
	#logo_div:hover,#likey:hover
	{
		cursor: pointer;
	}
	
	#bottom_table
	{
		margin-top: 110px;
	}
	
	#wordN 
	{
	  width: 580px;
	  height: 400px;
	}
	
	#tema_table,#tureDes_table,#cate_btn,#btn_pNum,#search_icon,#btn_thisPage,#btn_anotherPage
	{
		box-shadow: 1px 1px 3px 2px #dadce0;
	}
	
	#tema_table:hover,#tureDes_table:hover,#cate_btn:hover,#btn_pNum:hover,#search_icon:hover,#btn_anotherPage:hover
	{
		box-shadow: 1px 1px 3px 2px #dadce0 inset;
		cursor: pointer;
	}
	
	#cate_btn,#Pcate_btn
	{
		border: 1px solid black;
		/* background-color: #27AE60;
		color: white; */
	}
	
	#btn_pNum,#btn_anotherPage,#btn_thisPage
	{
		width:	43px;
		height:	40px;
		border: 1px solid black;
		table-layout: fixed;
	}
	
	#btn_thisPage,#Pcate_btn
	{
		box-shadow: 1px 1px 3px 2px #dadce0 inset;
		cursor: pointer;
	}
	
	#search_icon,#wordCloud
	{
		border: 1px solid black;
	}
	
	#logo_ama
	{
		color: #8E44AD;
	}
	
	#logo_zing
	{
		color: #C785C8;
	}
	
	#logo_T
	{
		color: #D35400;
	}
	
	#logo_r
	{
		color: #3498DB;
	}
	
	#logo_a
	{
		color: #27AE60;
	}
	
	#logo_v
	{
		color: #C0392B;
	}
	
	#logo_e
	{
		color: #F1C40F;
	}
	
	#logo_l
	{
		color: #34495E;
	}
	</style>
	<body>
	<script>
		window.onload = function() {
					
			data = [ <%= cate_list %> ];
			
			ViewCloud("wordC",data);
			ViewNet();
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

			//워드클라우드 렌더링
			 zingchart.render({
			   id: id,
			   data: myConfig,
			   height: 400,
			   width: 480
			 });
		}
		
		function ViewNet() {

			am5.ready(function() {

				// Create root element
				// https://www.amcharts.com/docs/v5/getting-started/#Root_element
				var root = am5.Root.new("wordN");

				// Set themes
				// https://www.amcharts.com/docs/v5/concepts/themes/
				root.setThemes([
				  am5themes_Animated.new(root)
				]);

				var data = {
				  name: "Root",
				  value: 1,
				  children: [
						{
							name: "익산 지역 관광지",
							value: <%= bvo.getCount() %>,
							linkWith: [<%= link_cate %>],
						},
						<%
						for ( TourDesVO vo : tlist ) {
							String cate = vo.getCate();
						%>
						{
							name: "<%= cate %>",
							children: [
								<%
								ArrayList<TourDesVO> clist = ldto.GetWDdata(cate);
								for ( TourDesVO svo : clist ) {
									String name = svo.getName();
									String count = svo.getBcount();
									%>
									{ name: "<%= name %>",  value: <%= count %>},
									<%
								}
								%>
							]
						},
						<%
						}
						%>
					]
				};

				// Create wrapper container
				var container = root.container.children.push(
				  am5.Container.new(root, {
				    width: am5.percent(100),
				    height: am5.percent(100),
				    layout: root.verticalLayout
				  })
				);

				// Create series
				// https://www.amcharts.com/docs/v5/charts/hierarchy/#Adding
				var series = container.children.push(
				  am5hierarchy.ForceDirected.new(root, {
				    singleBranchOnly: false,
				    downDepth: 1,
				    topDepth: 1,
				    maxRadius: 45,
				    minRadius: 30,
				    valueField: "value",
				    categoryField: "name",
				    childDataField: "children",
				    idField: "name",
				    linkWithStrength: 0.3,
				    linkWithField: "linkWith",
				    manyBodyStrength: -15,
				    centerStrength: 0.5
				  })
				);

				series.get("colors").set("step", 2);

				series.data.setAll([data]);
				series.set("selectedDataItem", series.dataItems[0]);

				// Make stuff animate on load
				series.appear(1000, 100);

				}); // end am5.ready()
		}
	</script>
	<!-- 상단 테이블 -->
		<table width="1200px" align="center">
			<tr>
				<td align="center">
				<!-- 로고 -->
					<div id="logo_div" style="width:570px; height:100px;" onclick="location.href='main.jsp'" >
						<table id="logo_table" style="width:570px; height:100px;">
							<tr>
								<td rowspan="2" id="logo">
									<img src="./icon/iksan_logo.jpg" style="width:160px; height:100px;">
								</td>
								<th id="sub_title" align="left">
										<span id="logo_ama">Ama</span><span id="logo_zing">zing</span><span id="logo_T">T</span><span id="logo_r">r</span><span id="logo_a">a</span><span id="logo_v">v</span><span id="logo_e">e</span><span id="logo_l">l</span>
								</th>
							</tr>
							<tr>
								<th id="title">AI기반 익산시 관광명소 추천</th>
							</tr>
						</table>
					</div>
				<!-- 로고 -->
				</td>
			</tr>
		</table>
	<!-- 상단 테이블 -->