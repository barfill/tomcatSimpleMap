<%@ page import="com.example.tomcatsimplemap.Person" %>
<%@ page import="com.example.tomcatsimplemap.Department" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="company" class="com.example.tomcatsimplemap.Company" scope="application"/>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String departmentId = request.getParameter("id");
    Department selectedDepartment = company.getDepartmentById(Integer.parseInt(departmentId));
    request.setAttribute("selectedDepartment",selectedDepartment); //tutaj przekazuje to jako atrybut bo inaczej zapis ${} (czyli EL) nie widzi zmiennych tworzonych w kodzie javy
    String headFullName = selectedDepartment.getHead().getName() + " " + selectedDepartment.getHead().getSurname();
    request.setAttribute("headFullName",headFullName);
%>
    Nazwa jednostki: ${selectedDepartment.name} <br>
    Kierownik jednostki: <a href="person.jsp?id=${selectedDepartment.head.ID}">${headFullName}</a> <br>
    Pracownicy:
    <table>
    <%
        List<Person> members = selectedDepartment.getMembers();

        for (Person currentMember : members) {
            request.setAttribute("currentMember",currentMember);
            String memberFullName = currentMember.getName() + " " + currentMember.getSurname();
            request.setAttribute("memberFullName",memberFullName);
    %>
        <tr>
            <td>
                <a href="person.jsp?id=${currentMember.ID}">${currentMember.name} ${currentMember.surname}</a>
            </td>
        </tr>
    <%
        }
    %>
    </table>

</body>
</html>
