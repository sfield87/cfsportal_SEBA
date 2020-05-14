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

<%
   /* 
    HttpSession objsession = request.getSession(false);
    String usuario = (String)objsession.getAttribute("usuario");
    if(usuario==null){
        response.sendRedirect("http://localhost:8080/Latam_CFS_Application/login.jsp");
    }
    */
%>

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
    <%@include file="../assets/NavBar.jsp" %>
    <!-- Sidebar -->
    <div id="wrapper" class="toggled toggled-2">
    <%@include file="../assets/SideBar.jsp" %>
    <!-- /#sidebar-wrapper -->
    <!-- Page Content -->
 
    <div id="page-content-wrapper">
      <div class="container-fluid">
         <div class="row">
          <form action="" method="post" class="formulario">
            <input type="text" name="txtTicket" size="20" autofocus />
            <input type="submit" name="SearchTkt" value="Search Ticket" class="btn btn-go" onclick="this.form.action='TicketsTriage.jsp?accion=consulta'" style="border: 2px solid #48D597">
            <input type="submit" name="Refresh Page" value="Refresh Page" class="btn btn-go" onclick="this.form.action='TicketsTriage.jsp?accion=nada'"style="border: 2px solid #48D597">
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
                <th style="white-space:nowrap">Create Date</th>
                <th style="white-space:nowrap">Ticket</th>
                <th style="white-space:nowrap">Condition</th>
                <th style="white-space:nowrap">Billing Account</th>
                <th style="white-space:nowrap">Customer Name</th>
                <th style="white-space:nowrap">OCC Code</th>
                <th style="white-space:nowrap">Case Subtype</th>
                <th style="white-space:nowrap">Case Subtype Detail</th>
                <th style="white-space:nowrap">Case Title</th>
                <th style="white-space:nowrap">Assigned</th>
                <th style="white-space:nowrap">Current QUEUE</th>
                <th style="white-space:nowrap">Contact Mail</th>
                <th style="white-space:nowrap">Assignments</th>
                <th style="white-space:nowrap">Invoice Validation</th>
                <th style="white-space:nowrap">Mail Validation</th>
                <th style="white-space:nowrap">Open Case Validation</th>
                <th style="white-space:nowrap">VARIABLES</th>
                <th style="white-space:nowrap">Open Case New Validation</th>
                <th style="white-space:nowrap">Existing Assignee Find</th>
                <th style="white-space:nowrap">Segmento</th>
                <th style="white-space:nowrap">Validation Status</th>
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
            
            String dbURL = "jdbc:sqlserver://ARPW-SQLFHR01;databaseName=BillingOpsDB;user=LATAMCFSREP;password=hq4-p.";
            cnx=DriverManager.getConnection(dbURL);
            //,strUserID,strPassword);
            
          //  cnx=DriverManager.getConnection ("jdbc:oracle:thin:@4.72.90.36:1521:DWP", "AC16516", "?7ay?!3g");
          
          // sta = cnx.createStatement();  //inicializo conex
           
           PreparedStatement ps;
           BufferedReader reader = new BufferedReader(new FileReader("\\\\latamfs\\Latam CFS Applications\\Web Server Files\\Resources\\Query\\Web_Queries\\TicketsTriage.sql"));
           StringBuilder sb = new StringBuilder();
           String line;

           while((line = reader.readLine())!= null){
                sb.append(line+"\n");
           }
  
           ps = cnx.prepareStatement(sb.toString());
           rs=ps.executeQuery();         // ejecuto query
        
           while(rs.next()){
                        %>
              <tr>
                <td><%=rs.getString(1)%> </td>
                <td><%=rs.getString(2)%> </td>
                <td><%=rs.getString(3)%> </td>
                <td><%=rs.getString(4)%> </td>
                <td><%=rs.getString(5)%> </td>
                <td><%=rs.getString(6)%> </td>
                <td><%=rs.getString(7)%> </td>
                <td><%=rs.getString(8)%> </td>
                <td><%=rs.getString(9)%> </td>
                <td><%=rs.getString(10)%> </td>
                <td><%=rs.getString(11)%> </td>
                <td><%=rs.getString(12)%> </td>
                <td><%=rs.getString(13)%> </td>
                <td><%=rs.getString(14)%> </td>
                <td><%=rs.getString(15)%> </td>
                <td><%=rs.getString(16)%> </td>
                <td><%=rs.getString(17)%> </td>
                <td><%=rs.getString(18)%> </td>
                <td><%=rs.getString(19)%> </td>
                <td><%=rs.getString(20)%> </td>
                <td><%=rs.getString(21)%> </td>
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

if(accion.equals("consulta")){
        Connection cnx = null;
        ResultSet rs=null;

        try{
            
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            
            String dbURL = "jdbc:sqlserver://ARPW-SQLFHR01;databaseName=BillingOpsDB;user=LATAMCFSREP;password=hq4-p.";
            cnx=DriverManager.getConnection(dbURL);
            //,strUserID,strPassword);
            
          //  cnx=DriverManager.getConnection ("jdbc:oracle:thin:@4.72.90.36:1521:DWP", "AC16516", "?7ay?!3g");
          
          // sta = cnx.createStatement();  //inicializo conex
           
           PreparedStatement ps;
           
           String tktSearch= request.getParameter("txtTicket"); // "5-DSL2PBDM";
           
           tktSearch = tktSearch.replaceAll(" ","");   
           BufferedReader reader = new BufferedReader(new FileReader("\\\\latamfs\\Latam CFS Applications\\Web Server Files\\Resources\\Query\\Web_Queries\\TicketsTriage_param.sql"));
           StringBuilder sb = new StringBuilder();
           String line;

           while((line = reader.readLine())!= null){
                sb.append(line+"\n");
           }
  
           ps = cnx.prepareStatement(sb.toString());
           ps.setString(1, tktSearch);

           rs=ps.executeQuery();         // run query
           while(rs.next()){
                        %>

              <tr>
                <td><%=rs.getString(1)%> </td>
                <td><%=rs.getString(2)%> </td>
                <td><%=rs.getString(3)%> </td>
                <td><%=rs.getString(4)%> </td>
                <td><%=rs.getString(5)%> </td>
                <td><%=rs.getString(6)%> </td>
                <td><%=rs.getString(7)%> </td>
                <td><%=rs.getString(8)%> </td>
                <td><%=rs.getString(9)%> </td>
                <td><%=rs.getString(10)%> </td>
                <td><%=rs.getString(11)%> </td>
                <td><%=rs.getString(12)%> </td>
                <td><%=rs.getString(13)%> </td>
                <td><%=rs.getString(14)%> </td>
                <td><%=rs.getString(15)%> </td>
                <td><%=rs.getString(16)%> </td>
                <td><%=rs.getString(17)%> </td>
                <td><%=rs.getString(18)%> </td>
                <td><%=rs.getString(19)%> </td>
                <td><%=rs.getString(20)%> </td>
                <td><%=rs.getString(21)%> </td>
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

if(accion.equals("SelectQueue")){
                  
        
        Connection cnx = null;
        ResultSet rs=null;
 
        try{
            
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            
            String dbURL = "jdbc:sqlserver://ARPW-SQLFHR01;databaseName=BillingOpsDB;user=LATAMCFSREP;password=hq4-p.";
            cnx=DriverManager.getConnection(dbURL);
            //,strUserID,strPassword);
            
          //  cnx=DriverManager.getConnection ("jdbc:oracle:thin:@4.72.90.36:1521:DWP", "AC16516", "?7ay?!3g");
          
          // sta = cnx.createStatement();  //inicializo conex
           
           PreparedStatement ps;
           
         String Queue= request.getParameter("Queue");

         Queue = Queue.replaceAll("%20"," ");   
           
            BufferedReader reader = new BufferedReader(new FileReader("\\\\latamfs\\Latam CFS Applications\\Web Server Files\\Resources\\Query\\Web_Queries\\TicketsTriage_queue.sql"));
            StringBuilder sb = new StringBuilder();
            String line;

            while((line = reader.readLine())!= null){
                sb.append(line+"\n");
            }
           
           ps = cnx.prepareStatement(sb.toString());

             ps.setString(1, Queue);
           
            rs=ps.executeQuery();         // ejecuto query  
        
           while(rs.next()){
                        %>

              <tr>
                <td><%=rs.getString(1)%> </td>
                <td><%=rs.getString(2)%> </td>
                <td><%=rs.getString(3)%> </td>
                <td><%=rs.getString(4)%> </td>
                <td><%=rs.getString(5)%> </td>
                <td><%=rs.getString(6)%> </td>
                <td><%=rs.getString(7)%> </td>
                <td><%=rs.getString(8)%> </td>
                <td><%=rs.getString(9)%> </td>
                <td><%=rs.getString(10)%> </td>
                <td><%=rs.getString(11)%> </td>
                <td><%=rs.getString(12)%> </td>
                <td><%=rs.getString(13)%> </td>
                <td><%=rs.getString(14)%> </td>
                <td><%=rs.getString(15)%> </td>
                <td><%=rs.getString(16)%> </td>
                <td><%=rs.getString(17)%> </td>
                <td><%=rs.getString(18)%> </td>
                <td><%=rs.getString(19)%> </td>
                <td><%=rs.getString(20)%> </td>
                <td><%=rs.getString(21)%> </td>
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
    $("h4").text("Tickets Triage");  
    
    $(document).ready(function() {
      var table = $('#mydatatable').DataTable({
        dom: 'Bfrtip',
        lengthChange: false,
        paging: false,
        info: false,
        scrollY: 400,
        scrollX: true
      });

    function getUrlParameter(sParam) {
        var sPageURL = window.location.search.substring(1),
           sURLVariables = sPageURL.split('&'),
           sParameterName,
          i;

     for (i = 0; i < sURLVariables.length; i++) {
          sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
           }
         }
     };   
  
     if (getUrlParameter('Queue')!==undefined){
                document.querySelector('#ShowButton').innerText = getUrlParameter('Queue');
            } else {
                 document.querySelector('#ShowButton').innerText = "Seleccione Queue";
             };
                
  
       jQuery("#action-1").click(function(e){
    //do something
         e.preventDefault();
            
         var base_url = window.location.pathname;
         window.location.href = base_url +'?accion=SelectQueue&Queue=Latam Quick Win';
    });
    
       jQuery("#action-2").click(function(e){
    //do something
        e.preventDefault();
         var base_url = window.location.pathname;
         window.location.href = base_url +'?accion=SelectQueue&Queue=Latam Triage I';
    });
    
       jQuery("#action-3").click(function(e){
    //do something
        e.preventDefault();
         var base_url = window.location.pathname;
         window.location.href = base_url +'?accion=SelectQueue&Queue=Latam Triage II';
    });
              
       jQuery("#action-4").click(function(e){
    
        //do something
        e.preventDefault();
         var base_url = window.location.pathname;
         window.location.href = base_url;
    });
    
      table.buttons().container()
        .appendTo('#example_wrapper .col-sm-6:eq(0)');
    });
  </script>


   <script>
      function export_table_to_excel(id, type, fn) {
var wb = XLSX.utils.table_to_book(document.getElementById(id), {sheet:"Tickets_Triage"});
var wbout = XLSX.write(wb, {bookType:type, bookSST:true, type: 'binary'});
var fname = fn || 'Tickets_Triage.' + type;
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