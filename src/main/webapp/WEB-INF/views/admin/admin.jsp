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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script>
        $(function () {
            $("#editEditDialog").on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget); // Button that triggered the modal
                $(this).find('#modalUserId').val(button.data('user-id'));
                $(this).find('#hiddenUsername').val(button.data('username'));
                $(this).find('#modalUsername').val(button.data('username'));
                $(this).find('#modalFirstName').val(button.data('first-name'));
                $(this).find('#modalLastName').val(button.data('last-name'));
                $(this).find('#modalEmail').val(button.data('email'));
                $(this).find('#modalRole').val(button.data('role'));
            });
        });
        <%--$(function () {--%>
        <%--    $("#editEditDialog").on('show.bs.modal', function () {--%>
        <%--        alert(${userList[2].userId});--%>
        <%--        $("#modalTestInput").val("${userList[2].userId}");--%>
        <%--    });--%>
        <%--});--%>
    </script>
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
                <a class="list-group-item list-group-item-action rounded-0 active" id="list-home-list"
                   data-toggle="list"
                   href="#admin-panel" role="tab">Admin panel</a>
                <a class="list-group-item list-group-item-action rounded-0" id="list-profile-list" data-toggle="list"
                   href="#principal-profile" role="tab">Profile</a>
            </div>
        </div>
        <%--Main area--%>
        <div class="col-10 border-left pl-0">
            <div class="tab-content mainTabs" id="nav-tabContent">
                <%--Admin Panel--%>
                <div class="tab-pane fade show active" id="admin-panel" role="tabpanel">
                    <div class="mainAreaHeader">
                        <h2>Admin Panel</h2>
                    </div>
                    <%--Tabs--%>
                    <ul class="nav nav-tabs">
                        <li class="nav-item">
                            <a class="nav-link disabled"></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#user-list">User table</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#new-user">New user</a>
                        </li>
                    </ul>
                    <%--Tab panes--%>
                    <div class="tab-content">
                        <%--User list pane--%>
                        <div class="tab-pane container-fluid active" id="user-list">
                            <!--User list table header -->
                            <div class="container-fluid userListTop">
                                <h4>All users</h4>
                            </div>
                            <table class="table table-striped border">
                                <thead>
                                <tr>
                                    <th scope="col">Id</th>
                                    <th scope="col">Username</th>
                                    <th scope="col">First Name</th>
                                    <th scope="col">Last Name</th>
                                    <th scope="col">E-mail</th>
                                    <th scope="col">Role</th>
                                    <th scope="col"></th>
                                    <th scope="col"></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="user" items="${userList}">
                                    <tr>
                                        <th scope="row">${user.userId}</th>
                                        <td>${user.username}</td>
                                        <td>${user.firstName}</td>
                                        <td>${user.lastName}</td>
                                        <td>${user.email}</td>
                                        <td>${user.getRole()}</td>
                                        <td>
                                            <form action="#" method="post"
                                                  class="p-0 m-0 justify-content-center align-items-center">
                                                <input type="hidden" name="editUsername" value="${user.username}"/>
                                                <!-- Button to Open the Modal -->
                                                <button type="button"
                                                        data-user-id="${user.userId}"
                                                        data-username="${user.username}"
                                                        data-first-name="${user.firstName}"
                                                        data-last-name="${user.lastName}"
                                                        data-email="${user.email}"
                                                        data-role="${user.getRole()}"
                                                        class="btn btn-block btn-link p-0 tableBtn"
                                                        data-toggle="modal" data-target="#editEditDialog"><i
                                                        class="fa fa-edit tableBtn"></i></button>
                                            </form>
                                        </td>
                                        <td>
                                            <form action="${path}/admin/delete" method="post"
                                                  class="p-0 m-0 justify-content-center align-items-center">
                                                <input type="hidden" name="deleteUser" value="${user.username}"/>
                                                <button type="submit" class="btn btn-block btn-link p-0 tableBtn"><i
                                                        class="fa fa-trash tableBtn"></i></button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <!-- The Modal -->
                            <div class="modal fade" id="editEditDialog" tabindex="-1" role="dialog">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <!-- Modal Header -->
                                        <div class="modal-header">
                                            <h4 class="modal-title">Edit user data</h4>
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>
                                        <!-- Modal body -->
                                        <div class="modal-body px-4">
                                            <form action="${path}/admin/update" method="post">
                                                <input type="text" class="form-control formFields"
                                                       id="hiddenUsername" name="username" hidden>
                                                <label for="modalUserId">Id:</label>
                                                <input type="text" class="form-control formFields"
                                                       id="modalUserId" name="userId" disabled>
                                                <label for="modalUsername">Username:</label>
                                                <input type="text" class="form-control formFields"
                                                       id="modalUsername" disabled>
                                                <label for="modalFirstName">First name:</label>
                                                <input type="text" class="form-control formFields"
                                                       id="modalFirstName" name="firstName" autocomplete="off">
                                                <label for="modalLastName">Last name:</label>
                                                <input type="text" class="form-control formFields"
                                                       id="modalLastName" name="lastName" autocomplete="off">
                                                <label for="modalEmail">E-mail:</label>
                                                <input type="text" class="form-control formFields"
                                                       id="modalEmail" name="email" autocomplete="off">
                                                <label for="modalRole">Role:</label>
                                                <input type="text" class="form-control formFields"
                                                       id="modalRole" name="role" autocomplete="off">
                                                <button type="submit" class="btn btn-primary btn-block mt-5 mb-3">Save
                                                </button>
                                            </form>
                                        </div>
                                        <!-- Modal footer -->
                                        <div class="modal-footer px-4">
                                            <button type="button" class="btn btn-outline-secondary px-4"
                                                    data-dismiss="modal">Cancel
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="tab-pane container-fluid" id="new-user">
                            <div class="container-fluid userListTop col-6 float-left">
                                <h4>Add new user</h4>
                                <%--New user form--%>
                                <form action="${path}/admin/saveNewUser" method="post">
                                    <div class="form-group">
                                        <label for="username">Username:</label>
                                        <input type="text" class="form-control formFields" id="username"
                                               placeholder="Username" name="username" required autocomplete="off">
                                        <label for="password">Password:</label>
                                        <input type="password" class="form-control formFields" id="password"
                                               placeholder="Password" name="password" required>
                                        <label for="firstName">First name:</label>
                                        <input type="text" class="form-control formFields" id="firstName"
                                               placeholder="First name" name="firstName" autocomplete="off">
                                        <label for="lastName">Last name:</label>
                                        <input type="text" class="form-control formFields" id="lastName"
                                               placeholder="Last name" name="lastName" autocomplete="off">
                                        <label for="email">E-mail:</label>
                                        <input type="email" class="form-control formFields" id="email"
                                               placeholder="E-mail" name="email" autocomplete="off">
                                        <label for="role">User role:</label>
                                        <input type="text" class="form-control formFields" id="role" placeholder="Role"
                                               name="role" autocomplete="off">
                                        <button type="submit" class="btn btn-primary px-5 mt-4">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <%--Principal profile--%>
                <div class="tab-pane fade" id="principal-profile" role="tabpanel">
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
