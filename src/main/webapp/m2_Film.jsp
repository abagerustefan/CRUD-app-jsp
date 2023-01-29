<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
            int aux = java.lang.Integer.parseInt(request.getParameter("idfilme"));
        	String nume = request.getParameter("nume");
        	String an_lansare = request.getParameter("an_lansare");
        	String buget = request.getParameter("buget");
        	String rating = request.getParameter("rating");

            String[] valori = {nume, an_lansare, buget, rating};
            String[] campuri = {"nume", "an_lansare", "buget", "rating"};
            jb.modificaTabela("filme", "idfilme", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center"><b>Modificarile au fost efectuate!</b></h1>
</body>
</html>
