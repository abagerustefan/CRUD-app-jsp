<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page language="java"
import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <title>Tabela Locatii</title>
</head>
<body class="container mt-5">
  <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
  <jsp:setProperty name="jb" property="*" />
    <h1 class="text-center mb-5">Tabela Locatii</h1>
    <p class="text-center mb-3">
      <a href="nou_Locatie.jsp" class="btn btn-primary mr-3"><b>Adauga o noua locatie</b></a> 
      <a href="index.html" class="btn btn-secondary"><b>Home</b></a>
    </p>
    <form action="sterge_Locatie.jsp" method="post">
      <table class="table table-bordered table-striped mx-auto" style="width: 80%">
        <thead>
          <tr>
            <th><b>Mark:</b></th>
            <th><b>IdLocatie:</b></th>
            <th><b>Tara:</b></th>
            <th><b>Oras:</b></th>
          </tr>
        </thead>
        <tbody>
          <%
            jb.connect();
            ResultSet rs = jb.vedeTabela("locatii");
            long x;
            while (rs.next()) {
              x = rs.getInt("idlocatii");
          %>
          <tr>
            <td><input type="checkbox" name="primarykey" value="<%=x%>" /></td>
            <td><%=x%></td>
            <td><%=rs.getString("oras")%></td>
            <td><%=rs.getString("tara")%></td>
          </tr>
          <%
            }
          %>
        </tbody>
      </table>
      <p class="text-center mt-3">
        <input type="submit" value="Sterge liniile marcate" class="btn btn-danger">
      </p>
    </form>
    <%
      rs.close();
      jb.disconnect();
    %>
    <p class="text-center mt-5">
      <a href="index.html" class="btn btn-secondary"><b>Home</b></a>
    </p>
  </body>
</html>