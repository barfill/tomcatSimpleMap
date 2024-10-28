<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="company" class="com.example.tomcatsimplemap.Company" scope="application"/> <%-- Fasolki tworzą obiekty kolejno company i person, które są typów Company i Person zaciągniętych z odpowiednich klas--%>
<jsp:useBean id="person" class="com.example.tomcatsimplemap.Person" scope="request"/>

<jsp:setProperty name="person" property="name" param="name"/>
<jsp:setProperty name="person" property="surname" param="surname"/>

<html>
<head>
    <title>Dodaj osobe</title>
</head>
<body>
    <%
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");

        if(name != null && surname != null) {
            company.addPerson(person);
        }
    %>
    <form>
        Imie : <input type="text" name="name" id="name"><br>
        Nazwisko : <input type="text" name="surname" id="surname"><br>
        <input type="submit">
    </form>

</body>
</html>
