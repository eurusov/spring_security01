<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="path" value="${pageContext.servletContext.contextPath}" scope="page"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans:300&display=swap" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="<spring:url value="/css/general.css"/>" rel="stylesheet" type="text/css">
<%--    <link href="<spring:url value="/css/form.css"/>" rel="stylesheet" type="text/css">--%>
    <link href="<spring:url value="/css/style.css"/>" rel="stylesheet" type="text/css">

    <title>Spring Security with Bootstrap</title>
</head>
<body>
<section id="cover">
    <div id="cover-caption">
        <div id="container" class="container">
            <div class="row">
                <div class="col-sm-4 offset-sm-4 text-center">
                    <h4 class="formCaption text-muted mb-4">Please sign in...</h4>
                    <div class="info-form">
                        <form action='<spring:url value="/loginAction"/>' class="justify-content-center" method="post">
                            <div class="form-group">
                                <input type="text" class="form-control form-control-lg shadow-sm" id="username"
                                       placeholder="username"
                                       name="username"
                                       required autocomplete="off"/>
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control form-control-lg shadow-sm" id="password"
                                       placeholder="password"
                                       name="password"/>
                            </div>
                            <div class="px-3 py-1">
                                <button type="submit" class="btn btn-primary shadow btn-block mt-2" id="submitBtn">
                                    Submit
                                </button>
                            </div>
                        </form>
                    </div>
                    <div class="jumbotron invisible">
                        <br><br>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
