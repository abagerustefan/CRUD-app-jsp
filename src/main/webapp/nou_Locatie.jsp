<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adauga locatie</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body class="container mt-5">
	<%
	String oras = request.getParameter("oras");
	String tara = request.getParameter("tara");
	if (oras != null) {
		jb.connect();
		jb.adaugaLocatie(oras, tara);
		jb.disconnect();
	%>
	<div class="alert alert-success">
		Datele au fost adaugate.
	</div>
	<%
	} else {
	%>
	<h1 class="text-center mb-5">Suntem in tabela Locatie.</h1>
	<form action="nou_Locatie.jsp" method="post">
		<table class="table table-bordered table-striped mx-auto" style="width: 80%">
			<tr>
				<td class ="text-center" style ="width:20%">Nume oras:</td>
				<td><input type="text" name="oras" class="form-control" /></td>
			</tr>
			<tr>
				<td class ="text-center" style ="width:20%">Nume tara:</td>
				<td><input type="text" name="tara" class="form-control" /></td>
			</tr>
		</table>
		<p class ="text-center">
			<input type="submit" value="Adauga filmul" class="btn btn-primary mt-3" />
		</p>
	</form>
	<%
	}
	%>
	<p class="text-center">
      <a href="index.html" class="btn btn-secondary"><b>Home</b></a>
    </p>
</body>
</html>