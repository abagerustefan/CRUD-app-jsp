<%--
 Document : sterge_Pacient
 Created on : Nov 14, 2016, 1:32:42 PM
 Author : vali
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Adauga film</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Film</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body class="container mt-5">
	<%
	String[] s = request.getParameterValues("primarykey");
	jb.connect();
	jb.stergeDateTabela(s, "filme", "idfilme");
	jb.disconnect();
	%>
	<p class="text-center">
      <a href="index.html" class="btn btn-secondary"><b>Home</b></a>
    </p>
</body>
</html>