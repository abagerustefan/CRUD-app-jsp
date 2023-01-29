<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Locatii</title>
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body class="container mt-5">
	<h1 class="text-center mb-5">Tabela Locatii</h1>
    <p class="text-center mb-3">
      <a href="nou_Locatie.jsp" class="btn btn-primary mr-3"><b>Adauga o noua locatie</b></a> 
      <a href="index.html" class="btn btn-secondary"><b>Home</b></a>
    </p>
	<%
	jb.connect();
	int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
	ResultSet rs = jb.intoarceLinieDupaId("locatii", "idlocatii", aux);
	rs.first();
	String oras = rs.getString("oras");
	String tara = rs.getString("tara");
	rs.close();
	jb.disconnect();
	%>
	<form action="m2_Locatie.jsp" method="post">
		<table class="table table-bordered table-striped mx-auto" style="width: 80%">
			<tr>
				<td class ="text-center" style ="width:20%">IdLocatie:</td>
				<td><input type="text" name="idlocatii" class="form-control" value="<%=aux%>" readonly /></td>
			</tr>
			<tr>
				<td class ="text-center" style ="width:20%">Nume oras:</td>
				<td><input type="text" name="oras" class="form-control" value="<%=oras%>" /></td>
			</tr>
			<tr>
				<td class ="text-center" style ="width:20%">Nume tara:</td>
				<td><input type="text" name="tara" class="form-control" value="<%=tara%>" /></td>
			</tr>
		</table>
		<p class ="text-center">
			<input type="submit" value="Modifica linia" class="btn btn-primary mt-3" />
		</p>
	</form>
	<p class="text-center">
      <a href="index.html" class="btn btn-secondary"><b>Home</b></a>
    </p>
</body>
</html>