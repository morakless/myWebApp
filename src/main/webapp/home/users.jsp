<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/bootstrap/docs/favicon.ico">

        <title>Wypozyczalnia</title>


    <!-- Bootstrap core CSS -->
    <link href="/bootstrap/docs/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="/bootstrap/docs/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/bootstrap/docs/examples/dashboard/dashboard.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]>
      <script src="/bootstrap/docs/assets/js/ie8-responsive-file-warning.js"></script>
      <![endif]-->
    <script src="/bootstrap/docs/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Wypozyczalnia</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">Settings</a></li>
            <li><a href="#">Profile</a></li>
            <li><a href="#">Help</a></li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li><a href="/home/home">Podsumowanie<span class="sr-only">(current)</span></a></li>
            <li class="active"><a href="/home/users">Uzytkownicy</a></li>
            <li><a href="/home/equipment">Przedmioty</a></li>
            <li><a href="/home/producers">Producenci</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

            <h1 class="page-header">Uzytkownicy</h1>
            <h2 class="sub-header">Dodaj uzytkoniwka</h2>
            <c:if test="${resultCause =='1'}">
                <div class="alert alert-success" role="alert">
                    <strong>Well done!</strong> ${msg}
                </div>
            </c:if>

            <c:if test="${resultCause =='0'}">
                <div class="alert alert-danger" role="alert">
                    <strong>Oh No! </strong> ${msg}
                </div>
            </c:if>

            <div class="table-responsive">
                <table class="table">
                    <form:form action="/home/addUser" method="POST" >
                    <thead>
                    <tr>

                        <th><form:label path="firstName">Imie</form:label></th>
                        <th><form:label path="lastName">Nazwisko</form:label></th>

                        <th>Akcja</th>
                    </tr>

                    </thead>
                    <tbody>
                            <tr>
                                <td><form:input class="form-control" placeholder="Imie..." path="firstName" /> </td>
                                <td><form:input class="form-control" placeholder="Nazwisko..." path="lastName" /></td>
                                <td><input type="submit" value="Dodaj Uzytkownika" class="btn btn-primary"/></td>
                            </tr>
                    </form:form>
                    </tbody>
                </table>


            <h2 class="page-header">User List</h2>
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Imie</th>
                        <th>Nazwisko</th>
                        <th>Produkty</th>
                        <th>Akcje</th>
                    </tr>

                    </thead>

                    <tbody>

                    <c:if test="${not empty userList}">
                        <c:forEach var="user" items="${userList}">
                            <tr>
                                <td style="width: 5px">${user.id}</td>
                                <td>${user.firstName}</td>
                                <td>${user.lastName}</td>
                                <td>
                                    <c:forEach var="product" items="${user.products}">
                                        ${product.name}
                                    </c:forEach>
                                </td>
                                <td>
                                    <form:form action="/home/userAction" method="post">
                                    <button type="submit" class="btn btn-info"  name="action" value="editItem">Edycja przedmiotow</button>
                                    <button type="submit" class="btn btn-info"   name ="action" value="editUser">Edycja danych</button>
                                    <button type="submit" class="btn btn-warning"  name ="action" value="delUser">Usuwanie</button>
                                        <form:hidden path="id" value="${user.id}"/>
                                    </form:form>

                                </td>

                            </tr>
                        </c:forEach>
                    </c:if>

                    <button type="button" class="btn btn-xs btn-default" onclick="location.href='/home/users?size=${size}&pageUser=${pageUser-1}'" >&lt;prev</button>
                    <span class="badge">&nbsp;${pageUser}&nbsp; </span>
                    <button type="button" class="btn btn-xs btn-default" onclick="location.href='/home/users?size=${size}&pageUser=${pageUser+1}'" >next&gt;</button>
                    </tbody>

                </table>

        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="/bootstrap/docs/assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="/bootstrap/docs/dist/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="/bootstrap/docs/assets/js/vendor/holder.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/bootstrap/docs/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
