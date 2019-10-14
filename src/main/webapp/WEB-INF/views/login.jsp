<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
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
<%--<header>--%>
<%--    <div class="content">--%>
<%--        <h1 class="content" id="header_text">Login</h1>--%>
<%--    </div>--%>
<%--</header>--%>
<div style="background-color: var(--header-background)">
    <div class="content">
        <ul>
            <li style="border-right: none">
                <a class="active" href="">Login</a>
            </li>
        </ul>
    </div>
</div>
<div style="background-color: var(--header-active); padding-top: 2px; margin: 0"></div>
<div class="content">
    <form action='<spring:url value="/loginAction"/>' method="post">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" size="45"
               value="${user.username}"
        >
        <label for="password">Password</label>
        <input type="password" id="password" name="password" size="45"
               value="${user.password}"
        >
        <input type="submit" value="Login">
    </form>
</div>
<div class="content">
    <p>
        Don’t have an account? <a href="new">Sign up now</a>
        <%--        <a href="list">List All Users</a>--%>
    </p>
</div>
</body>
</html>
