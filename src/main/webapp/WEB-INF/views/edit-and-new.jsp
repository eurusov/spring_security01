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

<%--<header>--%>
<%--    <div class="content">--%>
<%--        <h1 id="header_text">${empty user.username ? "Register new user" : "Edit user"}</h1>--%>
<%--                <c:if test="${!empty principal}">--%>
<%--                    <a id="logout_link" class="link_button" href="logout">Logout</a>--%>
<%--                </c:if>--%>
<%--    </div>--%>
<%--</header>--%>


<div style="background-color: var(--header-background)">
    <div class="content">
        <ul>
            <li style="border-right: none">
                <a href=".">Home</a>
            </li>
            <li style="border-right: none">
                <a href="list">User List</a>
            </li>
            <li>
                <a ${empty user.username ? "class=active" : ""} href="new">New User</a>
            </li>
            <li style="float:right">
                <a href="logout">Logout</a>
            </li>
            <li style="float:right; border-right: none">
                <a ${!empty user.username ? "class=active" : ""} href="edit">Edit</a>
            </li>
        </ul>
    </div>
</div>
<div style="background-color: var(--header-active); padding-top: 2px; margin: 0"></div>

<div class="content">
    <form action=${empty user.username ? "new" : "update"} method="POST">
        <c:if test="${!empty user.username}">
            <input type="hidden" name="username" value="${user.username}"/>
        </c:if>
        <c:if test="${empty user.username}">
            <label>Username
                <input type="text" name="username" size="50" required
                       value="${user.username}">
            </label>
            <label>Password
                <input type="password" name="password" size="100" required
                       value="${user.password}">
            </label>
        </c:if>
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
