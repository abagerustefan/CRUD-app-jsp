<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Adauga film</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body class="container mt-5">
	<%
	String nume = request.getParameter("nume");
	String an_lansare = request.getParameter("an_lansare");
	String buget = request.getParameter("buget");
	String rating = request.getParameter("rating");
	if (nume != null) {
		jb.connect();
		jb.adaugaFilm(nume, Integer.parseInt(an_lansare), Integer.parseInt(buget), Float.parseFloat(rating));
		jb.disconnect();
	%>
	<div class="alert alert-success">
		Datele au fost adaugate.
	</div>
	<%
	} else {
	%>
	<h1 class="text-center mb-5">Suntem in tabela Film</h1>
	<form action="nou_Film.jsp" method="post">
		 <table class="table table-bordered table-striped mx-auto" style="width: 80%">
			<tr>
				<td class ="text-center" style ="width:20%">Nume film:</td>
				<td><input type="text" name="nume" class="form-control" /></td>
			</tr>
			<tr>
				<td class ="text-center" style ="width:20%">An lansare:</td>
				<td><input type="text" name="an_lansare" class="form-control" /></td>
			</tr>
			<tr>
				<td class ="text-center" style ="width:20%">Buget:</td>
				<td><input type="text" name="buget" class="form-control" /></td>
			</tr>
			<tr>
				<td class ="text-center" style ="width:20%">Rating:</td>
				<td><input type="text" name="rating" class="form-control" /></td>
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