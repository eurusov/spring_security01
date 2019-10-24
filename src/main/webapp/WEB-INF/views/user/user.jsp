<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="path" value="${pageContext.servletContext.contextPath}" scope="page"/>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans:300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href='<spring:url value="/css/style.css"/>' rel="stylesheet" type="text/css">
    <title>Spring Security with Bootstrap</title>
</head>
<body>
<%--Header--%>
<nav class="navbar bg-dark navbar-dark">
    <div class="container-fluid">
        <div class="navbar-brand">
            <h2 class="navbar-brand">Spring Security with Bootstrap</h2>
        </div>
        <div class="navbar-nav">
            <a class="nav-link" href="${path}/logout">Logout</a>
        </div>
    </div>
</nav>
<div class="container-fluid">
    <div class="row">
        <%--Left side area--%>
        <div class="col-2 pr-0">
            <%--Left side menu--%>
            <div class="list-group list-group-flush mt-5" id="list-tab" role="tablist">
                <a class="list-group-item list-group-item-action rounded-0 active" id="list-profile-list"
                   data-toggle="list"
                   href="#principal-profile" role="tab">Profile</a>
            </div>
        </div>
        <%--Main area--%>
        <div class="col-10 border-left pl-0">
            <div class="tab-content mainTabs" id="nav-tabContent">
                <%--Principal profile--%>
                <div class="tab-pane fade show active" id="principal-profile" role="tabpanel">
                    <%--Principal profile header--%>
                    <div class="mainAreaHeader">
                        <h2>Your profile details</h2>
                    </div>
                    <div class="p-3 pr-5">
                        <table class="table table-striped border m-2 mr-5">
                            <tbody>
                            <tr>
                                <th scope="row" class="col-md-3">Id:</th>
                                <td>${principal.userId}</td>
                            </tr>
                            <tr>
                                <th scope="row">Username:</th>
                                <td>${principal.username}</td>
                            </tr>
                            <tr>
                                <th scope="row">First Name:</th>
                                <td>${principal.firstName}</td>
                            </tr>
                            <tr>
                                <th scope="row">Last Name:</th>
                                <td>${principal.lastName}</td>
                            </tr>
                            <tr>
                                <th scope="row">E-mail:</th>
                                <td>${principal.email}</td>
                            </tr>
                            <tr>
                                <th scope="row">Role:</th>
                                <td>${principal.getRole()}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>
</html>
