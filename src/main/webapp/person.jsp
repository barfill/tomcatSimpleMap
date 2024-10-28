<%--
  Created by IntelliJ IDEA.
  User: UL0277248
  Date: 21.10.2024
  Time: 12:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="person" class="com.example.tomcatsimplemap.Person" scope="session"></jsp:useBean>
<jsp:setProperty name="person" property="name" param="name"></jsp:setProperty>
<jsp:setProperty name="person" property="surname" param="surname"></jsp:setProperty>
<%@ page import="com.example.tomcatsimplemap.Person" %>
<html>
<head>
    <title>Person</title>
</head>
<body>

    <table>
        <tr>
            <td>Imie:</td>
            <td>${person.name}</td>
        </tr>
        <tr>
            <td>Nazwisko:</td>
            <td>${person.surname}</td>
        </tr>
    </table>

</body>
</html>
