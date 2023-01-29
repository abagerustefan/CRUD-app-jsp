<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adauga o locatie la un film</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body class="container mt-5">
	<%
	int idfilme, idlocatii;
	String id1, id2, nume, an_lansare, buget, rating, oras, tara, data_inceput, data_final;
	id1 = request.getParameter("idfilme");
	id2 = request.getParameter("idlocatii");
	data_inceput = request.getParameter("data_inceput");
	data_final = request.getParameter("data_final");
	if (id1 != null) {
		jb.connect();
		jb.adaugaFilm_Locatie(java.lang.Integer.parseInt(id1), java.lang.Integer.parseInt(id2), data_inceput, data_final);
		jb.disconnect();
	%>
	<div class="alert alert-success">
		Datele au fost adaugate.
	</div>
	<%
	} else {
	jb.connect();
	ResultSet rs1 = jb.vedeTabela("filme");
	ResultSet rs2 = jb.vedeTabela("locatii");
	%>
	<h1 class="text-center mb-5">Suntem in tabela Filme-Locatii.</h1>
	<form action="nou_Film_Locatie.jsp" method="post">
		<table class="table table-bordered table-striped mx-auto" style="width: 80%">
			<tr>
				<td class ="text-center" style ="width:20%">IdFilm:</td>
				<td class ="text-center" style ="width:40%">Selectati filmul: <SELECT NAME="idfilme">
						<%
						while (rs1.next()) {
							idfilme = rs1.getInt("idfilme");
							nume = rs1.getString("nume");
							an_lansare = rs1.getString("an_lansare");
							buget = rs1.getString("buget");
							rating = rs1.getString("rating");
						%>
						<OPTION VALUE="<%=idfilme%>"><%=idfilme%>,<%=nume%>,<%=an_lansare%>,<%=buget%>,<%=rating%></OPTION>
						<%
						}
						%>
				</SELECT>

				</td>
			</tr>
			<tr>
				<td class ="text-center" style ="width:20%">IdLocatie:</td>
				<td class ="text-center" style ="width:40%">Selectati Locatia: <SELECT NAME="idlocatii">
						<!-- OPTION selected="yes" VALUE="iris1">Iris 1</OPTION -->
						<%
						while (rs2.next()) {
							idlocatii = rs2.getInt("idlocatii");
							oras = rs2.getString("oras");
							tara = rs2.getString("tara");
						%>
						<OPTION VALUE="<%=idlocatii%>"><%=idlocatii%>,<%=oras%>,<%=tara%></OPTION>
						<%
						}
						%>
				</SELECT>
				</td>
			</tr>
			<tr>
				<td class ="text-center" style ="width:20%">Data inceput:</td>
				<td><input type="text" name="data_inceput" class="form-control"/></td>
			</tr>
			<tr>
				<td class ="text-center" style ="width:20%">Data final:</td>
				<td><input type="text" name="data_final" class="form-control" /></td>
			</tr>
		</table>
		<p class ="text-center">
			<input type="submit" value="Adauga locatia la film" class="btn btn-primary mt-3" />
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