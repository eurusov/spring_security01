<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.servletContext.contextPath}" scope="page"/>
<html>
<head>
    <title>Spring Security User Management Application</title>
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans:300&display=swap" rel="stylesheet">
    <%--    <link href="general.css" rel="stylesheet" type="text/css" >--%>
    <%--    <link href="${pageContext.request.contextPath}/general.css" rel="stylesheet" type="text/css">--%>
    <style>
        <%@include file="../general.css"%>
        <%@include file="../form.css"%>
    </style>
</head>
<body>
<div style="background-color: var(--header-background)">
    <div class="content">
        <ul>
            <li>
                <a href="${path}/admin/">User List</a>
            </li>
            <li>
                <a class="active" href="${path}/admin/new">New User</a>
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
