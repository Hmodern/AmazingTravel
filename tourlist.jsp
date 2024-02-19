<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="at.vo.*" %>
<%@ page import="at.dto.*" %>
<%@page import="java.util.ArrayList"%>
<%
String cate = request.getParameter("cate");
String sort = request.getParameter("sort");
int page_no = 1;
try
{
	page_no = Integer.parseInt(request.getParameter("page"));
}catch(Exception e){}
if( sort == null ) sort = "X";

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


%>

