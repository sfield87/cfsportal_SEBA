<%-- 
    Document   : reportes
    Created on : Apr 25, 2020, 12:37:16 PM
    Author     : AC16546
--%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        
        <link href="../css/bootstrap-table.min" rel="stylesheet" type="text/css">
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/simple-sidebar.css" rel="stylesheet">
        <link href="../css/tablas.css" rel="stylesheet" type="text/css">
        <link href="../css/reportes.css" rel="stylesheet" type="text/css">
        <script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>
        <script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
        <script src="../js/status_bot.js"></script>
        <title>CFS Applications</title>
        
<script type="text/javascript">
function take_values(){
 var n=document.forms["myform"]["name"].value;
 if (n===null || n==="") {
    alert("Please enter User Name");
    return false;
 }
 else{
        if (n==="factExpo"){
                var http = new XMLHttpRequest();
                http.open("POST", "http://localhost:8080/Latam_CFS_Application/jsp/factExpo.jsp", true);
            }
        http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        var params = "param1=" + n; // probably use document.getElementById(...).value
        http.send(params);
        http.onload = function() {
            alert(http.responseText);
        }
     } 
}  
</script>
        
    </head>
    <body>
        <%@include file="../assets/NavBar.jsp" %>
        <!-- Sidebar -->
        <div id="wrapper" class="toggled toggled-2">
        <%@include file="../assets/SideBar.jsp" %>
        <form name="myform">
            <div id="page-content-wrapper">
                <div class="container-fluid">
                    <form name="myform" >
                        <select name="name">
                            <option value="0" selected>(please select:)</option>
                            <option value="factExpo">Facturas Exportación</option>
                            <option value="otro1">Otro1</option>
                            <option value="otro2">Otro2</option>
                            <option value="otro3">Otro3</option>
                        </select>
                   <button class="btn btn-success" type="submit" onclick="return take_values()">Download<ion-icon class="icon_boton" name="download"></ion-icon></button> 
                </div>
            </div>
        </form>
        </div>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/sidebar_menu.js"></script>
<script src="../js/bootstrap-table.min.js"></script>
<script>
    $("h4").text("Descargar Reportes");
    
    $('select').selectpicker();
</script>
    </body>
</html>
