<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Filme</title>
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body class="container mt-5">
    <h1 class="text-center mb-5">Tabela Filme</h1>
    <p class="text-center">
      <a href="nou_Film.jsp" class="btn btn-primary mr-3"><b>Adauga un nou film</b></a> 
      <a href="index.html" class="btn btn-secondary"><b>Home</b></a>
    </p>
	<%
	jb.connect();
	int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
	ResultSet rs = jb.intoarceLinieDupaId("filme", "idfilme", aux);
	rs.first();
	String nume = rs.getString("nume");
	String an_lansare = rs.getString("an_lansare");
	String buget = rs.getString("buget");
	String rating = rs.getString("rating");
	rs.close();
	jb.disconnect();
	%>
	<form action="m2_Film.jsp" method="post">
		 <table class="table table-bordered table-striped mx-auto" style="width: 80%">
			<tr>
				<td class ="text-center" style ="width:20%">IdFilm:</td>
				<td><input type="text" name="idfilme" class="form-control" value="<%=aux%>" readonly /></td>
			</tr>
			<tr>
				<td class ="text-center" style ="width:20%">Nume:</td>
				<td><input type="text" name="nume" class="form-control" value="<%=nume%>" /></td>
			</tr>
			<tr>
				<td class ="text-center" style ="width:20%">An Lansare:</td>
				<td><input type="text" name="an_lansare" class="form-control" value="<%=an_lansare%>" /></td>
			</tr>
			<tr>
				<td class ="text-center" style ="width:20%">Buget:</td>
				<td><input type="text" name="buget" class="form-control" value="<%=buget%>" /></td>
			</tr>
			<tr>
				<td class ="text-center" style ="width:20%">Rating:</td>
				<td><input type="text" name="rating" class="form-control" value="<%=rating%>" /></td>
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