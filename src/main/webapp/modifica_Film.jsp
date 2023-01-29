<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Tabela Filme</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body class="container mt-5">
    <h1 class="text-center mb-5">Tabela Filme</h1>
    <p class="text-center">
      <a href="nou_Film.jsp" class="btn btn-primary mr-3"><b>Adauga un nou film</b></a> 
      <a href="index.html" class="btn btn-secondary"><b>Home</b></a>
    </p>
    <form action="m1_Film.jsp" method="post">
      <table class="table table-bordered table-striped mx-auto" style="width: 80%">
        <thead>
          <tr>
            <th><b>Mark:</b></th>
            <th><b>IdFilm:</b></th>
            <th><b>Nume:</b></th>
            <th><b>An lansare:</b></th>
            <th><b>Buget:</b></th>
            <th><b>Rating:</b></th>
          </tr>
        </thead>
        <tbody>
          <%
          jb.connect();
          ResultSet rs = jb.vedeTabela("filme");
          long x;
          while (rs.next()) {
            x = rs.getLong("idfilme");
          %>
          <tr>
            <td><input type="checkbox" name="primarykey" value="<%=x%>" /></td>
            <td><%=x%></td>
            <td><%=rs.getString("nume")%></td>
            <td><%=rs.getString("an_lansare")%></td>
            <td><%=rs.getString("buget")%></td>
            <td><%=rs.getString("rating")%></td>
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