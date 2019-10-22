<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="path" value="${pageContext.servletContext.contextPath}" scope="page"/>
<html>
<head>
    <title>Spring Security User Management Application</title>
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans:300&display=swap" rel="stylesheet">
    <link href="<spring:url value="/css/general.css"/>" rel="stylesheet" type="text/css">
    <style>
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
                <a class="active" href="${path}/admin/">User List</a>
            </li>
            <li>
                <a href="${path}/admin/new">New User</a>
            </li>
            <li style="float:right; margin: 0">
                <a href="${path}/logout">Logout</a>
            </li>
            <li style="float:right">
                <a href="${path}/admin/profile">View profile</a>
            </li>
            <li style="float:right">
                <a href="${path}/admin/profile/edit">Edit profile</a>
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
                <td> ${user.username} </td>
                <td> ${user.firstName} </td>
                <td> ${user.lastName} </td>
                <td> ${user.email} </td>
                <td> ${user.getRole()} </td>
                <td>
                    <form action="${path}/admin/edit" method="post" style="margin: 0 0">
                        <input type="hidden" name="editUsername" value="${user.username}"/>
                        <button type="submit">EDIT</button>
                    </form>
                </td>
                <td>
                    <form action="${path}/admin/delete" method="post" style="margin: 0 0">
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
