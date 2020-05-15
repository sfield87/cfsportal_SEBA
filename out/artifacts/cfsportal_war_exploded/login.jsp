<%-- 
    Document   : Login
    Created on : Nov 20, 2019, 3:02:59 PM
    Author     : Field.sebastian
--%>
<%@page import="java.sql.*"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">

  <link href="css/bootstrap-table.min" rel="stylesheet" type="text/css">
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/simple-sidebar.css" rel="stylesheet">
  <link href="css/tablas.css" rel="stylesheet" type="text/css">
  <link href="css/datatables.min.css" type="text/css">
  <link href="font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">
  <link href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css" rel="stylesheet">
  <link href="https://cdn.datatables.net/fixedheader/3.1.6/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
  <title>CFS Applications</title>
</head>
<style type="text/css">
	.login-form {
		width: 340px;
    	margin: 50px auto;
	}
    .login-form form {
    	margin-bottom: 15px;
        background: #f7f7f7;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
    .login-form h2 {
        margin: 0 0 15px;
    }
    .form-control, .btn {
        min-height: 38px;
        border-radius: 2px;
    }
    .btn {        
        font-size: 15px;
        font-weight: bold;
    }
</style>
</head>
<body>
    
<%@include file="assets/NavBarRaiz.jsp" %>
    <!-- Sidebar -->
    <div id="wrapper" class="toggled toggled-2">
<%@include file="assets/SideBarRaiz.jsp" %>
<div class="login-form">
    <form method="post" action="Iniciar" id="frmIniciar">
        <h2 class="text-center">Log in</h2>       
        <div class="form-group">
            <input type="text" class="form-control" placeholder="Username" required="required" name="user" id="txtUser">
        </div>
        <div class="form-group">
            <input type="password" class="form-control" placeholder="Password" required="required" name="password" id="txtpass">
        </div>
        <div>
            <input type="hidden" name="redirect" id="url"> 
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-success btn-block" id="btnIniciar" value="Login">Log in</button>
        </div>
               
    </form>
    
</div>
</div>
</body>
        <!-- /#wrapper -->
        <!-- jQuery -->
        <script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>
        <script>
            window.addEventListener('load',function(){
                document.getElementById('btnIniciar').addEventListener('click', function(){
                    var user = document.getElementById('txtUser').value;
                    var password = document.getElementById('txtpass').value;

                    const urlParams = new URLSearchParams(window.location.search);
                    const myParam = urlParams.get('redirect');

                    document.getElementById("url").value = myParam;

                    var flag = false;
                    if(user.length > 0 && password.length >0){
                        flag=true;
                    }
                    if(flag){
                        document.getElementById('frmIniciar').submit();
                    }else{
                        alert('Complete los Campos por favor');
                    }
                });
            });
        </script>
        <script src="js/navBar.js"></script>
        <script src="js/main.js"></script>
        <script src="js/jquery-1.11.2.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/sidebar_menu.js"></script>
        
    </body>

</html>



    
