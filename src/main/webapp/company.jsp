<%@ page import="com.example.tomcatsimplemap.Department" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="company" class="com.example.tomcatsimplemap.Company" scope="application"/>
<jsp:useBean id="department" class="com.example.tomcatsimplemap.Department" scope="request"/>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String id = request.getParameter("id"); //Tutaj chyba mogę tak zrobić dlatego że fasolka department ma scope request, więc requesty będą się odnosić do niej czyli do obiektów typu department
    List<Department> departments = new ArrayList<>();

    if (id != null) {
        Department d = company.getDepartmentById(Integer.parseInt(id));
        if(d != null) {
            departments.add(d);
        }
    } else {
        departments = company.getAllDepartments();
    }
%>
    <table>
        <caption>Spis jednostek:</caption>
        <%
            if (departments.isEmpty()) {
                out.println("<tr><td>Brak departamentów do wyświetlenia.</td></tr>");
            } else {
                for (Department d : departments) {
                    department.copyFrom(d);
        %>
            <tr>
                <td>
                    <a href="department.jsp?id=${department.ID}">${department.name}</a>  <!-- tutaj biorep o prostu ID bo to w jsp oznacza wywołanie gettera-->
                </td>
            </tr>
        <%
                }
            }
        %>
    </table>
</body>
</html>
