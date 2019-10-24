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
<div style="background-color: var(--header-background)">
    <div class="content">
        <ul>
            <li>
                <a class="active" href="">Home</a>
            </li>
            <li>
                <a href="${path}/edit">Edit profile</a>
            </li>
            <li style="float:right; margin: 0">
                <a href="logout">Logout</a>
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
<%--        <form action="edit" method="post">--%>
<%--            <input class="form_button" type="submit" value="EDIT" style="margin-top: 102px; margin-left: 42px"/>--%>
<%--            <input type="hidden" name="editUsername" value="${principal.username}"/>--%>
<%--        </form>--%>
    </table>
</div>
</body>
</html>
