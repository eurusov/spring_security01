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
    <link href="<spring:url value="/css/form.css"/>" rel="stylesheet" type="text/css">
</head>
<body>
<div style="background-color: var(--header-background)">
    <div class="content">
        <ul>
            <li>
                <a class="active" href="">Login</a>
            </li>
            <li>
                <a href="new">Sign Up</a>
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
        <input type="submit" value="Sign In">
    </form>
</div>
<div class="content">
    <p>
        Don’t have an account? <a href="new">Sign up now</a>
    </p>
</div>
</body>
</html>
