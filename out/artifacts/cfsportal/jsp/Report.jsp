<%-- 
    Document   : BuscadorBan
    Created on : Nov 20, 2019, 3:02:59 PM
    Author     : Field.sebastian
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

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
  <link href="../css/datatables.min.css" type="text/css">
  <link href="font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">
  <link href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css" rel="stylesheet">
  <link href="https://cdn.datatables.net/fixedheader/3.1.6/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
  <script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>
  <title>CFS Applications</title>
</head>

<body>
    <div id="wrapper" class="toggled toggled-2 full-height">
    <%@include file="../assets/SideBar.jsp" %>

    <div id="page-content-wrapper-main" class="toggled toggled-2 full-height">
        <%@include file="../assets/NavBar.jsp" %>
    <!-- /#sidebar-wrapper -->
    <!-- Page Content -->
    <div id="page-content-wrapper">
      <div class="container-fluid">
          <iframe
                  width="100%"
                  height="90%"
                  src="https://app.powerbi.com/reportEmbed?reportId=5a462e1a-73fd-435b-9f2b-9cc193071e85&autoAuth=true&ctid=72b17115-9915-42c0-9f1b-4f98e5a4bcd2&config=eyJjbHVzdGVyVXJsIjoiaHR0cHM6Ly93YWJpLXdlc3QtdXMtcmVkaXJlY3QuYW5hbHlzaXMud2luZG93cy5uZXQvIn0%3D" frameborder="0" allowFullScreen="true"></iframe>
      </div>
    </div>
    <!-- /#page-content-wrapper -->
  </div>
  <!-- /#wrapper -->
  <!-- jQuery -->

  <script src="../js/jquery-1.11.2.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <script src="../js/sidebar_menu.js"></script>
  <script src="../js/bootstrap-table.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.15.1/xlsx.core.min.js" type="text/javascript"></script>
  <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
  <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>

   <script type="text/javascript">
    $("h4").text("Dashboards");  
    </script>
</body>

</html>