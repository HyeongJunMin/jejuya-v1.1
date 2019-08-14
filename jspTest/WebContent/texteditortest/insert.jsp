<%@page import="common.db.DBClose"%>
<%@page import="common.db.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String str = request.getParameter("txtContent");
	
	String sql = " INSERT INTO NOTICE_JEJU VALUES(SEQ_NOTICE_JEJU.NEXTVAL, 'testtitle', ?, '', '', 'admin', SYSDATE) ";
	
	boolean dbInsertDone = false;
	
	Connection conn = null;
	PreparedStatement psmt = null;
	
	conn = DBConnection.getConnection();
	psmt = conn.prepareStatement(sql);
	psmt.setString(1, str);
	psmt.executeQuery();
	
	DBClose.close(conn, psmt, null);
	
	dbInsertDone = true;
%>
<%=str %>
<br>
dbInsertDone : <%=dbInsertDone %>

</body>
</html>