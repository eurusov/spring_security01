<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("UTF-8");%>
<html>
<head>
    <title>User Management Application</title>
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans:300&display=swap" rel="stylesheet">
    <style>
        <%@include file="general.css"%>

        .field_name {
            width: 128px;
        }

        input[type=submit] {
            background-color: var(--main-green);
            color: white;
            width: 150px;
            padding: 10px 0;
            margin: 30px 0;
            border: none;
            border-radius: 2px;
            cursor: pointer;
            text-transform: uppercase;
        }
    </style>
</head>
<body>

<c:if test='${principal.getRole() eq "ADMIN"}'>
    <c:set var="admin" value="1"/>
</c:if>

<div style="background-color: var(--header-background)">
    <div class="content">
        <ul>
            <li>
                <a class="active" href="">Home</a>
            </li>
            <c:if test='${admin == 1}'>
                <li>
                    <a href="admin">User List</a>
                </li>

                <li>
                    <a href="new">New User</a>
                </li>
            </c:if>
            <li style="float:right; margin: 0">
                <a href="logout">Logout</a>
            </li>
            <li style="float:right">
                <a href="edit">Edit</a>
            </li>
        </ul>
    </div>
</div>
<div style="background-color: var(--header-active); padding-top: 2px; margin: 0"></div>
<div class="content">
    <table style="float: left">
        <caption><p>Your profile details:</p></caption>
        <tr>
            <td class="field_name">Username:</td>
            <td><c:out value="${principal.username}"/></td>
        </tr>
        <tr>
            <td class="field_name">First name:</td>
            <td><c:out value="${principal.firstName}"/></td>
        </tr>
        <tr>
            <td class="field_name">Last name:</td>
            <td><c:out value="${principal.lastName}"/></td>
        </tr>
        <tr>
            <td class="field_name">E-mail:</td>
            <td><c:out value="${principal.email}"/></td>
        </tr>
        <form action="edit" method="post">
            <input class="form_button" type="submit" value="EDIT" style="margin-top: 102px; margin-left: 42px"/>
            <input type="hidden" name="editUsername" value="${principal.username}"/>
        </form>
    </table>
</div>
</body>
</html>
