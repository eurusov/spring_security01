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

        #table_caption {
            text-align: left;
            text-transform: uppercase;
        }

        #user_table {
            margin-top: 30px;
            border-collapse: collapse;
            width: 480px;
        }

        #user_table td, #user_table th {
            border: 1px solid #ddd;
            padding: 8px;
        }

        #user_table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        #user_table tr:hover {
            background-color: #ddd;
        }

        #user_table th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #4CAF50;
            color: white;
        }

        .field_name {
            width: 120px;
        }

        #edit_link {
            float: left;
        }
    </style>
</head>
<body>
<%--<jsp:useBean id="loggedUser" scope="session" class="model.User"/>--%>
<header>
    <div class="content">
        <h1 id="header_text">Welcome, ${principal.getUsername()}</h1>
        <a id="logout_link" class="link_button" href="logout">Logout</a>
    </div>
</header>
<div class="content">
    <table id="user_table">
        <caption><p id="table_caption">Your profile details:</p></caption>
        <tr>
            <td class="field_name">E-mail:</td>
            <td><c:out value="${principal.getUsername()}"/></td>
        </tr>
        <tr>
            <td class="field_name">First name:</td>
            <td><c:out value="${principal.getUsername()}"/></td>
        </tr>
        <tr>
            <td class="field_name">Last name:</td>
            <td><c:out value="${principal.getUsername()}"/></td>
        </tr>
        <tr>
            <td class="field_name">Country:</td>
            <td><c:out value="${principal.getUsername()}"/></td>
        </tr>
    </table>
    <a id="edit_link" class="link_button" href="edit?id=${principal.getUsername()}">Edit profile</a>
</div>
</body>
</html>
