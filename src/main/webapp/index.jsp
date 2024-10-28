<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="person" class="com.example.tomcatsimplemap.Person" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<%
    out.println("Ala ma kota");
%>
    <br>
    <b>${person.surname}</b>
</body>
</html>