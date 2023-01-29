<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Tabela Film-Locatie</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean"/>
<jsp:setProperty name="jb" property="*" />
<body class="container mt-5">
	<h1 class="text-center mb-5">Tabela Filme-Locatii</h1>
	<p class="text-center">
		<a href="nou_Film_Locatie.jsp" class="btn btn-primary mr-3"><b>Adauga o noua locatie la un film</b></a> 
		<a href="index.html" class="btn btn-secondary"><b>Home</b></a>
	</p>
	<form action="m1_Film_Locatie.jsp" method="post">
		<table class="table table-bordered table-striped mx-auto" style="width: 80%">
		<thread>
			<tr>
				<td><b>Mark:</b></td>
				<td><b>IdFilm_Locatie:</b></td>
				<td><b>IdFilm:</b></td>
				<td><b>Nume film:</b></td>
				<td><b>An lansare:</b></td>
				<td><b>Buget:</b></td>
				<td><b>Rating:</b></td>
				<td><b>IdLocatie:</b></td>
				<td><b>Oras:</b></td>
				<td><b>Tara:</b></td>
				<td><b>Data inceput:</b></td>
				<td><b>Data final:</b></td>
			</tr>
		</thread>
			<tbody>
			<%
			jb.connect();
			ResultSet rs = jb.vedeFilm_Locatie();
			long x;
			while (rs.next()) {
				x = rs.getInt("idfilme_locatii");
			%>
			<tr>
				<td><input type="checkbox" name="primarykey" value="<%=x%>" /></td>
				<td><%=x%></td>
				<td><%=rs.getInt("idfilme_filme_locatii")%></td>
				<td><%=rs.getString("NumeFilm")%></td>
				<td><%=rs.getString("AnLansare")%></td>
				<td><%=rs.getString("buget")%></td>
				<td><%=rs.getString("rating")%></td>
				<td><%=rs.getInt("idfilme_filme_locatii")%></td>
				<td><%=rs.getString("NumeOras")%></td>
				<td><%=rs.getString("NumeTara")%></td>
				<td><%=rs.getDate("data_inceput")%></td>
				<td><%=rs.getDate("data_final")%></td>
				<%
				}
				%>
			</tr>
			</tbody>
		</table>
      <p class="text-center">
        <input type="submit" value="Modifica linia" class="btn btn-danger">
      </p>
	</form>
	<%
	rs.close();
	jb.disconnect();
	%>
    <p class="text-center">
      <a href="index.html" class="btn btn-secondary"><b>Home</b></a>
    </p>
</body>
</html>