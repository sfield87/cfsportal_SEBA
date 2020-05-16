<%-- 
    Document   : Login
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
  <nav class="navbar navbar-default no-margin">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header fixed-brand">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" id="menu-toggle">
        <span>
          <ion-item>
            <ion-icon class="icon" name="menu"></ion-icon>
          </ion-item>
        </span>
      </button>
      <a class="navbar-brand" href="../index.html"><img src="../img/CTL Logo Reverse INT.png" id="headerLogo" alt=""></a>
    </div><!-- navbar-header-->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><button class="navbar-toggle collapse in" data-toggle="collapse" id="menu-toggle-2">
            <ion-item>
              <ion-icon class="icon" name="menu"></ion-icon>
            </ion-item>
          </button>
        </li>
      </ul>
      <h4 class="tituloInterno align-middle">Triage Tickets</h4>
    </div>
    <!-- bs-example-navbar-collapse-1 -->
  </nav>
  <div id="wrapper" class="toggled toggled-2">
    <!-- Sidebar -->
    <div id="sidebar-wrapper">
      <ul class="sidebar-nav nav-pills nav-stacked" id="menu">

        <li class="active">
        <li>
          <a href="../index.html">
            <ion-item>
              <ion-icon class="icon" name="home"></ion-icon> <span class="text">Home</span>
            </ion-item>
          </a>
        </li>
        <li>
          <a href="#">
            <ion-item>
              <ion-icon class="icon" name="construct"></ion-icon> <span class="text">Services</span>
            </ion-item>
          </a>
          <ul class="nav-pills nav-stacked" style="list-style-type:none;">
            <li><a href="BanSearch.jsp">
                <ion-item>
                  <ion-icon class="subIcon" name="build"></ion-icon><span class="subText">Billing Account</span>
                </ion-item>
              </a></li>
            <li><a href="sidSearch.jsp">
                <ion-item>
                  <ion-icon class="subIcon" name="build"></ion-icon><span class="subText">Service ID</span>
                </ion-item>
              </a></li>
          </ul>
        </li>
        <li>
          <a href="#">
            <ion-item>
              <ion-icon class="icon" name="contact"></ion-icon> <span class="text">Customer Care</span>
            </ion-item>
          </a>
          <ul class="nav-pills nav-stacked" style="list-style-type:none;">
            <li><a href="BCCForm.jsp">
                <ion-item>
                  <ion-icon class="subIcon" name="today"></ion-icon><span class="subText">Refacturación</span>
                </ion-item>
              </a>
            </li>
            <li><a class="link" href="TicketsTriage.jsp">
                <ion-item>
                <ion-icon class="subIcon" name="pulse"></ion-icon><span class="subText">Tickets Triage</span>
                </ion-item>
                </a>
            </li>
        </ul>
        </li>
        <li>
          <a href="Report.jsp">
            <ion-item>
              <ion-icon class="icon" name="stats"></ion-icon> <span class="text">Dashboards</span>
            </ion-item>
          </a>
        </li>
        <li>
          <a href="#">
            <ion-item>
              <ion-icon class="icon" name="cog"></ion-icon> <span class="text">Billing Operations</span>
            </ion-item>
          </a>
            <ul class="nav-pills nav-stacked" style="list-style-type:none;">
            <li><a href="billingOps.jsp">
                <ion-item>
                  <ion-icon class="subIcon" name="pulse"></ion-icon><span class="subText">Open Subcases</span>
                </ion-item>
              </a>
            </li>
            <li><a href="EMA_BOT.jsp">
                <ion-item>
                  <ion-icon class="subIcon" name="pulse"></ion-icon><span class="subText">Tickets Re-Bill</span>
                </ion-item>
              </a>
            </li>
          </ul>
        </li>
      </ul>
    </div>
    <!-- /#sidebar-wrapper -->
    <!-- Page Content -->
 
    <div id="page-content-wrapper">
      <div class="container-fluid">
         <div class="row">
          <form action="" method="post" class="formulario">
            <input type="text" name="txtTicket" size="20" autofocus />
            <input type="submit" name="SearchTkt" value="Search Ticket" class="btn btn-go" onclick="this.form.action='TicketsTriage.jsp?accion=consulta'" style="border: 2px solid #48D597">
            <input type="submit" name="Refresh Page" value="Refresh Page" class="btn btn-go" onclick="location.reload();" style="border: 2px solid #48D597">
            <div class="btn-group">
            <button  id="ShowButton" type="button" class="btn btn-go dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="border: 2px solid #48D597">
                <span class="caret"></span>
            </button>
                <ul class="dropdown-menu" name="selectorr" var="selectorr">
                  <li><a value="Latam Quick Win" name = "action-1" id="action-1">Latam Quick Win</a></li>
                  <li><a value="Pepe" name = "action-2" id="action-2">Latam Triage I</a></li>
                  <li><a value="pepe22" name = "action-3" id="action-3">Latam Triage II</a></li>
                  <li role="separator" class="divider"></li>
                  <li><a value="" name = "action-4" id="action-4">All Tickets</a></li>
                </ul>
        </div>
          </form>
        </div>

        <!---<table id="mytable">-->
        <div class="scrollme">
          <table id="mydatatable" data-search="true" class="table table-striped table-hover">
            <thead>
              <tr>
                <th style="white-space:nowrap">from_currency_cd</th>
                <th style="white-space:nowrap">to_currency_cd</th>
                <th style="white-space:nowrap">conversion_dt</th>
                <th style="white-space:nowrap">conversion_type</th>
                <th style="white-space:nowrap">exchange_rt</th>
              </tr>
            </thead>
            <tbody>
              <%
                  
       //inicializo variables
       String accion=request.getParameter("accion");   
        //corrijo inicio con valor nulo
       if (accion == null){
        accion ="nada";
        };
       
          
        
 if(accion.equals("nada")){
                  
        
        Connection cnx = null;
        ResultSet rs=null;
 
        try{
            
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            
            String dbURL = "jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=RACORAP02-SCAN.IDC1.LEVEL3.COM)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=CILPD)))";
            String strUserID = "LATAMCFSREP";
            String strPassword = "LATAMCFSREP_CILPD";
            cnx=DriverManager.getConnection(dbURL,strUserID,strPassword);
            //,strUserID,strPassword);
            
          //  cnx=DriverManager.getConnection ("jdbc:oracle:thin:@4.72.90.36:1521:DWP", "AC16516", "?7ay?!3g");
          
          // sta = cnx.createStatement();  //inicializo conex
           
           PreparedStatement ps;
           

           
           
  String query = "select from_currency_cd,  to_currency_cd, conversion_dt, conversion_typ, exchange_rt " +
"    from cods_finance.currency_exchange_rate  " +
"    where from_currency_cd = 'USD'  " +
"    AND conversion_dt >= (SYSDATE - 30) " +
"    AND to_currency_cd IN ('USD','ARS','CLP','COP','CRC','EUR','GBP','MXN','PEN','USD','UYU','BRL') " +
"    AND CONVERSION_TYP = 'SPOT' "; 
           
           ps = cnx.prepareStatement(query);

           rs=ps.executeQuery();         // ejecuto query  
        
           while(rs.next()){
                        %>

              <tr>
                <td><%=rs.getString(1)%> </td>
                <td><%=rs.getString(2)%> </td>
                <td><%=rs.getString(3)%> </td>
                <td><%=rs.getString(4)%> </td>
                <td><%=rs.getString(5)%> </td>
              </tr>

              <%
                        };
            ps.close(); 
            rs.close();
            cnx.close();
        }catch (Exception e){
            out.println("System Error: " + e); 
                    }
        };
%>
            </tbody>
          </table>
        </div>
        <div class="row text-right">
          <p id="xportxlsx" class="xport"><button class="btn btn-go" type="submit" onclick="doit('xlsx');" style="border: 2px solid #48D597">Download<ion-icon class="icon_boton" name="download"></ion-icon></button></p>
        </div>
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


  <script src="../js/FileSaver.min.js"></script>

  <script src="//code.jquery.com/jquery.min.js"></script>



  <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
  <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
  <script src="https://cdn.datatables.net/v/dt/dt-1.10.20/datatables.min.js" type="text/javascript"></script>

  <script src="../js/FileSaver.min.js"></script>
  <script src="../js/tableexport.min.js"></script>

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
var wb = XLSX.utils.table_to_book(document.getElementById(id), {sheet:"Detail"});
var wbout = XLSX.write(wb, {bookType:type, bookSST:true, type: 'binary'});
var fname = fn || 'BAN_Detail.' + type;
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