<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%request.setCharacterEncoding("UTF-8");%>--%>
<html>
<head>
    <title>User Management Application</title>
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans:300&display=swap" rel="stylesheet">
    <%--    <link href="general.css" rel="stylesheet" type="text/css" >--%>
    <%--    <link href="${pageContext.request.contextPath}/general.css" rel="stylesheet" type="text/css">--%>
    <style>
        <%@include file="general.css"%>
        table {
            width: 100%
        }
    </style>
</head>
<body>
<div style="background-color: var(--header-background)">
    <div class="content">
        <ul>
            <li>
                <a href=".">Home</a>
            </li>
            <li>
                <a class="active" href="admin">User List</a>
            </li>
            <li>
                <a href="new">New User</a>
            </li>
            <li style="float:right; margin: 0">
                <a href="logout">Logout</a>
            </li>
            <li style="float:right">
                <a href="edit">Edit profile</a>
            </li>
        </ul>
    </div>
</div>
<div style="background-color: var(--header-active); padding-top: 2px; margin: 0"></div>
<div class="content">
    <table id="users">
        <tr>
            <th id="th1">Username</th>
            <th id="th2">First Name</th>
            <th id="th3">Last Name</th>
            <th id="th4">E-mail</th>
            <th id="th5">User role</th>
            <th></th>
            <th></th>
        </tr>
        <c:forEach var="user" items="${userList}">
            <tr>
                <td><c:out value="${user.username}"/></td>
                <td><c:out value="${user.firstName}"/></td>
                <td><c:out value="${user.lastName}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.getRole()}"/></td>
                <td>
                    <form action="edit" method="post" style="margin: 0 0">
                        <input type="hidden" name="editUsername" value="${user.username}"/>
                        <button type="submit">EDIT</button>
                    </form>
                </td>
                <td>
                    <form action="delete" method="post" style="margin: 0 0">
                        <input type="hidden" name="deleteUser" value="${user.username}"/>
                        <button type="submit">DELETE</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
