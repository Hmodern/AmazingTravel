<%@page import="at.vo.LikeyVO"%>
<%@page import="at.dto.LikeyDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String no = request.getParameter("no");
String ip = request.getParameter("ip");

if ( no == null || ip == null ) {
	
	out.println("������ ��ȣ�� Ȯ�����ּ���.");
	return;
}

LikeyDTO dto = new LikeyDTO();
LikeyVO vo = new LikeyVO();

vo.setNo(no);
vo.setPushed_ip(ip);
dto.Likey(vo);

out.println("likey");


%>