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


%>

