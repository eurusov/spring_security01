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
        <%@include file="form.css"%>
    </style>
</head>
<body>

<c:if test='${!empty principal}'>
    <c:set var="logged" value="1"/>
    <c:if test='${principal.getRole() eq "ADMIN"}'>
        <c:set var="admin" value="1"/>
    </c:if>
</c:if>

<div style="background-color: var(--header-background)">
    <div class="content">
        <ul>
            <li>
                <a href=".">Home</a>
            </li>
            <c:if test='${admin == 1}'>
                <li>
                    <a href="list">User List</a>
                </li>
            </c:if>
            <li>
                <a class="active" href="new">New User</a>
            </li>
            <c:if test='${logged == 1}'>
                <li style="float:right; margin: 0">
                    <a href="logout">Logout</a>
                </li>
                <li style="float:right">
                    <a href="edit">Edit</a>
                </li>
            </c:if>
        </ul>
    </div>
</div>
<div style="background-color: var(--header-active); padding-top: 2px; margin: 0"></div>

<div class="content">
    <form action="saveNewUser" method="POST">
        <label>Username
            <input type="text" name="username" size="50" required
                   value="${user.username}">
        </label>
        <label>Password
            <input type="password" name="password" size="100" required
                   value="${user.password}">
        </label>
        <label>First name
            <input type="text" name="firstName" size="50"
                   value="${user.firstName}">
        </label>
        <label>Last name
            <input type="text" name="lastName" size="50"
                   value="${user.lastName}">
        </label>
        <label>E-mail
            <input type="text" name="email" size="50"
                   value="${user.email}">
        </label>
        <input type="submit" value="save">
    </form>
</div>
</body>
</html>
