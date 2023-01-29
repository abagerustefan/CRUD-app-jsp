<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Film - Locatie</title>
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body class="container mt-5">
	<h1 class="text-center mb-5">Tabela Filme-Locatii</h1>
	<p class="text-center">
		<a href="nou_Film_Locatie.jsp" class="btn btn-primary mr-3"><b>Adauga o noua locatie la un film</b></a> 
		<a href="index.html" class="btn btn-secondary"><b>Home</b></a>
	</p>
	<%
	jb.connect();
	String nume, an_lansare, buget, rating, oras, tara, data_inceput, data_final;
	int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
	ResultSet rs = jb.intoarceFilm_LocatieId(aux);
	rs.first();
	int id1 = rs.getInt("idfilme_filme_locatii");
	int id2 = rs.getInt("idlocatii_filme_locatii");
	nume = rs.getString("NumeFilm");
	an_lansare = rs.getString("AnLansare");
	buget = rs.getString("buget");
	rating = rs.getString("rating");
	oras = rs.getString("NumeOras");
	tara = rs.getString("NumeTara");
	data_inceput = rs.getString("data_inceput");
	data_final = rs.getString("data_final");
	ResultSet rs1 = jb.vedeTabela("filme");
	ResultSet rs2 = jb.vedeTabela("locatii");
	int idfilme, idlocatii;
	%>
	<form action="m2_Film_Locatie.jsp" method="post">
		<table class="table table-bordered table-striped mx-auto" style="width: 80%">
			<tr>
				<td class ="text-center" style ="width:20%">IdFilm_Locatie:</td>
				<td><input type="text" name="idfilme_locatii" class="form-control" value="<%=aux%>" readonly /></td>
			</tr>
			<tr>
				<td class ="text-center" style ="width:20%">IdFilm:</td>
				<td class ="text-center" style ="width:40%"><SELECT NAME="idfilme">
						<%
						while (rs1.next()) {
							idfilme = rs1.getInt("idfilme");
							nume = rs1.getString("nume");
							an_lansare = rs1.getString("an_lansare");
							buget = rs1.getString("buget");
							rating = rs1.getString("rating");
							if (idfilme != id1) {
						%>
						<OPTION VALUE="<%=idfilme%>"><%=idfilme%>,
							<%=nume%>,
							<%=an_lansare%>,
							<%=buget%>,
							<%=rating%></OPTION>
						<%
						} else {
						%>
						<OPTION selected="yes" VALUE="<%=idfilme%>"><%=idfilme%>,
							<%=nume%>,
							<%=an_lansare%>,
							<%=buget%>,
							<%=rating%></OPTION>
						<%
						}
						}
						%>
				</SELECT></td>
			</tr>
			<tr>
				<td class ="text-center" style ="width:20%">IdLocatie:</td>
				<td class ="text-center" style ="width:40%"><SELECT NAME="idlocatii">
						<%
						while (rs2.next()) {
							idlocatii = rs2.getInt("idlocatii");
							oras = rs2.getString("oras");
							tara = rs2.getString("tara");
							if (idlocatii != id2) {
						%>
						<OPTION VALUE="<%=idlocatii%>"><%=idlocatii%>,
							<%=oras%>,
							<%=tara%>,</OPTION>
						<%
						} else {
						%>
						<OPTION selected="yes" VALUE="<%=idlocatii%>"><%=idlocatii%>, <%=oras%>, <%=tara%></OPTION>
						<%
						}
						}
						%>
				</SELECT></td>
			</tr>
			<tr>
				<td class ="text-center" style ="width:20%">Data inceput:</td>
				<td><input type="text" name="data_inceput" class="form-control" value="<%=data_inceput%>" /></td>
			</tr>
			<tr>
				<td class ="text-center" style ="width:20%">Data final:</td>
				<td><input type="text" name="data_final" class="form-control" value="<%=data_final%>" /></td>
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
<%
 rs.close();
 rs1.close();
 rs2.close();
 jb.disconnect();
 %>
</html>