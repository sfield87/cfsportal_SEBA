<%-- 
    Document   : Login
    Created on : Nov 20, 2019, 3:02:59 PM
    Author     : Field.sebastian
--%>
<%@page import="java.sql.*"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
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
  <script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>
  <title>CFS Applications</title>
</head>
<body>
    <%@include file="/assets/NavBarRaiz.jsp" %>
    <!-- Sidebar -->
    <div id="wrapper" class="toggled toggled-2">
    <%@include file="/assets/SideBarRaiz.jsp" %>
    </div>
<!--<form method="post" action="../LoginCheck">
                    <table>
                        <tr><td>User Name</td><td><input type="text" name="uname"></td></tr>
                        <tr><td>Password</td><td><input type="password" name="upass"></td></tr>
                        <tr><td></td><td><input type="submit" value="Login" class="btn btn-go"></td></tr>
                    </table>
                </form>

   /#wrapper -->
  <!-- body -->
  <div id="page-content-wrapper">
      <div class="container-fluid xyz">
        <div class="row">
          <div class="col-lg-12">
            <!---<img src="img/Digital_Transformation_banner.jpg"  alt="">-->
            <h1 id="fondo">Latam CFS Applications</h1>
            <p>En este sitio podrás acceder a reportes y generar formularios útiles</p>
          </div>

          <div class="container">
            <div class="row">
                <div class="col-sm-2">
                </div>
              
              <div class="col-sm-4">
                <div class="well">
                  <div class="text-center">
                    <ion-icon name="construct" class="tarjeta"></ion-icon>
                    <h3 class="card-title ">Servicios Activos</h3>
                  </div>
                  <p class="card-text">Buscar los servicios Activos utilizando los siguientes links</p>
                  <div class="text-center">
                    <a id="BAN" class="link" href="jsp/BanSearch.jsp">Billing Account</a>
                    <ion-icon name="remove" class="text"></ion-icon>
                    <a id="SID" class="link" href="jsp/sidSearch.jsp">Service ID</a>
                  </div>
                </div>
              </div>


              <div class="col-sm-4">
                <div class="well">
                  <div class="text-center">
                    <ion-icon name="contact" class="tarjeta"></ion-icon>
                    <h3>Billing Customer Care</h3>
                  </div>
                  <p>Acceda al formulario de Facturación manual y otras funcionalidades</p>
                  <div class="text-center">
                    <a class="link" href="jsp/BCCForm.jsp">Planilla Refacturación</a>
                    <ion-icon name="remove" class="text"></ion-icon>
                    <a class="link" href="jsp/TicketsTriage.jsp">Tickets Triage</a>
                  </div>
                </div>
              </div>

                <div class="col-sm-2">
                </div>
              
            </div>
          </div>
        </div>
          
          
          <div class="row">
          <div class="container">
            <div class="row">
              <div class="col-sm-2">
                </div>
                <div class="col-sm-4">
                <div class="well">
                  <div class="text-center">
                    <ion-icon name="stats" class="tarjeta"></ion-icon>
                    <h3>Dashboards</h3>
                  </div>
                  <p>Acceda a distintos Dashboards del area de CFS LATAM</p>
                  <div class="text-center">
                    <a class="link" href="jsp/Report.jsp">Dashboards</a>
                  </div>
                </div>
              </div>

              <div class="col-sm-4">
                <div class="well">
                  <div class="text-center">
                    <ion-icon name="cog" class="tarjeta"></ion-icon>
                    <h3>Billing Operations</h3>
                  </div>
                  <p>Herramientas de Billing Operations</p>
                  <br/>
                  <div class="text-center">
                    <a class="link" href="jsp/billingOps.jsp">Open Subcases</a>
                     <ion-icon name="remove" class="text"></ion-icon>
                     <a class="link" href="jsp/EMA_BOT.jsp">Tickets Automaticos</a>
                  </div>
                </div>
              </div>


              <div class="col-sm-2">
              </div>
            </div>
          </div>
            
            

        </div>
          
           
      </div>
    </div>
  <!-- /body -->
  <!-- jQuery -->


  <script src="js/jquery-1.11.2.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/sidebar_menu.js"></script>
  <script src="js/bootstrap-table.min.js"></script>


  <script src="js/FileSaver.min.js"></script>

  <script src="//code.jquery.com/jquery.min.js"></script>



  <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
  <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
  <script src="https://cdn.datatables.net/v/dt/dt-1.10.20/datatables.min.js" type="text/javascript"></script>

  <script src="js/FileSaver.min.js"></script>
  <script src="js/tableexport.min.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/blob-polyfill/4.0.20190430/Blob.min.js" type="text/javascript"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/xls/0.7.6/xls.core.min.js" type="text/javascript"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.15.1/xlsx.core.min.js" type="text/javascript"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.15.1/xlsx.core.min.js" type="text/javascript"></script>

  <script type="text/javascript">
      
     
         
    $(document).ready(function() {
      var table = $('#mydatatable').DataTable({
        dom: 'Bfrtip',
        lengthChange: false,
        paging: false,
        info: false,
        scrollY: 400,
        scrollX: true
      });

      table.buttons().container()
        .appendTo('#example_wrapper .col-sm-6:eq(0)');

     
    });
  </script>

    <script>
      function export_table_to_excel(id, type, fn) {
var wb = XLSX.utils.table_to_book(document.getElementById(id), {sheet:"Tickets_BOPs"});
var wbout = XLSX.write(wb, {bookType:type, bookSST:true, type: 'binary'});
var fname = fn || 'Tickets_BOPs.' + type;
try {
	saveAs(new Blob([s2ab(wbout)],{type:"application/octet-stream"}), fname);
} catch(e) { if(typeof console != 'undefined') console.log(e, wbout); }
return wbout;
}

function s2ab(s) {
	if(typeof ArrayBuffer !== 'undefined') {
		var buf = new ArrayBuffer(s.length);

		var view = new Uint8Array(buf);
		for (var i=0; i!=s.length; ++i) view[i] = s.charCodeAt(i) & 0xFF;
		
		return buf;
	} else {
		var buf = new Array(s.length);
		for (var i=0; i!=s.length; ++i) buf[i] = s.charCodeAt(i) & 0xFF;
		return buf;
	}
}

function doit(type, fn) { return export_table_to_excel('mydatatable', type || 'xlsx', fn); }



 excelCell.s = {
	    fill: {
		patternType: "none", // none / solid
		fgColor: {rgb: "FF000000"},
		bgColor: {rgb: "FFFFFFFF"}
	    },
	    font: {
		name: 'Times New Roman',
		sz: 16,
		color: {rgb: "#FF000000"},
		bold: false,
		italic: false,
		underline: false
	    },
	    border: {
		top: {style: "thin", color: {auto: 1}},
		right: {style: "thin", color: {auto: 1}},
		bottom: {style: "thin", color: {auto: 1}},
		left: {style: "thin", color: {auto: 1}}
	    }
	};


  </script>
</body>

</html>



    
