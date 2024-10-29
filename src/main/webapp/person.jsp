<%@ page import="com.example.tomcatsimplemap.Person" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.tomcatsimplemap.Department" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="company" class="com.example.tomcatsimplemap.Company" scope="application"/>
<jsp:useBean id="person" class="com.example.tomcatsimplemap.Person" scope="request"/>
<jsp:useBean id="department" class="com.example.tomcatsimplemap.Department" scope="request"/>

<html>
<head>
    <title>Person</title>
</head>
<body>
    <%
        String id = request.getParameter("id"); //W jaki sposób przekazywany jest parametr id i do czego on nawiązuje
        List<Person> persons = new ArrayList<>();

        if (id != null) {
            Person p = company.getPersonById(Integer.parseInt(id));
            if(p != null) {
                persons.add(p);
            }
        } else {
            persons = company.getAllPersons();
        }
    %>
    <table>
        <%
            for (Person p : persons){
                person.copyFrom(p);
        %>
        <tr>
            <td>Imie:</td><td>${person.name}</td> <%-- tutaj moge korzystać z person.name a nie z person.getName() bo tak można w JSP--%>
        </tr>
        <tr>
            <td>Nazwisko:</td><td>${person.surname}</td>
        </tr>
        <tr>
            <td>Stanowisko:</td><td>${person.function.displayName}</td>
        </tr>
        <%
            List<Department> departmentList = new ArrayList<>();
            String personDepartment = null;
            Integer personDepartmentId = null;

            departmentList = company.getAllDepartments();

            for (Department d : departmentList) {
                for(Person tempPer : d.getMembers()) {
                    if(person.getID() == tempPer.getID()) {
                        personDepartment = d.getName();
                        personDepartmentId = d.getID();
                    }
                }
            }

            request.setAttribute("personDepartment",personDepartment);
            request.setAttribute("personDepartmentId",personDepartmentId);
        %>
        <tr>
            <td>Jednostka:</td><td><a href="department.jsp?id=${personDepartmentId}">${personDepartment}</a></td>
        </tr>
        <%
            }
        %>
    </table>

</body>
</html>
