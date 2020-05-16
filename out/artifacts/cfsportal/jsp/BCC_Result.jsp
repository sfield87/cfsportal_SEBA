<%-- 
    Document   : BuscadorBan
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

  <link href="../css/bootstrap-table.min" rel="stylesheet" type="text/css">
  <link href="../css/bootstrap.min.css" rel="stylesheet">
  <link href="../css/simple-sidebar.css" rel="stylesheet">
  <link href="../css/tablas.css" rel="stylesheet" type="text/css">
  <link href="../css/datatables.min.css" type="text/css">
  <link href="font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">
  <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
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
        <!---<table id="mytable">-->
        <div class="BCC">
          <table id="mydatatable" data-search="true" class="table table-striped table-hover">
            <thead>
              <tr>
                <th data-sortable="true">Operation Type</th>
                <th>CreditID</th>
                <th>BAN</th>
                <th>BillRefNo</th>
                <th>StartDate</th>
                <th>EndDate</th>
                <th>BillingCurrency</th>
                <th>Unique_Id_SI</th>
                <th>Unique_Id_SE</th>
                <th>Grupo_Pertenencia</th>
                <th>Monto_Moneda_Contrato</th>
                <th>Grupo_Factura</th>
                <th>TypeCode</th>
                <th>Exchange rate</th>
                <th>BanName</th>
                <th>CustomerName</th>
                <th>InvoiceNo</th>
                <th>EmmisionDate</th>
                <th>ServiceID</th>
                <th>Charge</th>
                <th>Moneda_Facturacion</th>
                <th>OCC</th>
                <th>Operation</th>
              </tr>
            </thead>
            <tbody>
              <%
        Connection cnx = null;
        ResultSet rs=null;
 
        try{
            Class.forName("oracle.jdbc.OracleDriver");
            
            //String dbURL = "jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=4.72.84.200)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=BLFXP101.LEVEL3.COM)))";
            String dbURL = "jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=g20-14b1.idc1.level3.com)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=BLFXR101.LEVEL3.COM)))";
            String strUserID = "LATAMCFSREP";
            String strPassword = "LATAM_blfxp101";
            cnx=DriverManager.getConnection(dbURL,strUserID,strPassword);
            
          //  cnx=DriverManager.getConnection ("jdbc:oracle:thin:@4.72.90.36:1521:DWP", "AC16516", "?7ay?!3g");
          
          // sta = cnx.createStatement();  //inicializo conex
           
           PreparedStatement ps;
           
           String brnn= request.getParameter("txtBRN"); // "5-DSL2PBDM";
           String Credit= request.getParameter("CreditID"); // "5-DSL2PBDM";
           
           
           String[] brns = brnn.split(",");
           
           if(brnn==null){
           }
              
           BufferedReader reader = new BufferedReader(new FileReader("\\\\latamfs\\Latam CFS Applications\\Web Server Files\\Resources\\Query\\Web_Queries\\BCC_Result_query0.sql"));
           StringBuilder sb = new StringBuilder();
           String line;
           while((line = reader.readLine())!= null){
                sb.append(line+"\n");
           }
           
           String query0 = sb.toString();
           
           String query2 = "?";
           String query3 =" ) "; 

            
           for(int i = 1; i < brns.length; i+=1) {
             query2 += " , ?";
           }
       
           String query = query0 + query2 + query3;
           ps = cnx.prepareStatement(query);
   
           ps.setString(1, brns[0]);

            for(int i = 1; i < brns.length; i+=1) {
                 ps.setString(i+1, brns[i]);
            }

           rs=ps.executeQuery();         // ejecuto query  
           
           while(rs.next()){
                        %>

              <tr>
                <td><%=rs.getString(1)%> </td>
                <td contenteditable="true"><%=Credit%></td>
                <td contenteditable="true"><%=rs.getString(3)%> </td>
                <td><%=rs.getString(4)%> </td>
                <td contenteditable="true"><%=rs.getString(5)%> </td>
                <td contenteditable="true"><%=rs.getString(6)%> </td>
                <td contenteditable="true"><%=rs.getString(7)%> </td>
                <td contenteditable="true"><%=rs.getString(8)%> </td>
                <td contenteditable="true"><%=rs.getString(9)%> </td>
                <td contenteditable="true"><%=rs.getString(10)%> </td>
                <td contenteditable="true"><%=rs.getString(11)%> </td>
                <td contenteditable="true"><%=rs.getString(12)%> </td>
                <td contenteditable="true"><%=rs.getString(13)%> </td>
                <td><%=rs.getString(14)%> </td>
                <td><%=rs.getString(15)%> </td>
                <td><%=rs.getString(16)%> </td>
                <td><%=rs.getString(17)%> </td>
                <td><%=rs.getString(18)%> </td>
                <td><%=rs.getString(19)%> </td>
                <td><%=rs.getString(20)%> </td>
                <td><%=rs.getString(21)%> </td>
                <td><%=rs.getString(22)%> </td>
                <td><%=rs.getString(23)%> </td>
              </tr>

              <%
                        };
            ps.close(); 
            rs.close();
            cnx.close();
        }catch (Exception e){
            out.println("System Error: " + e); 
                    }
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
    $("h4").text("Invoices Detail by Charge");  
   
    $(document).ready(function() {
      var table = $('#mydatatable').DataTable({
        dom: 'Bfrtip',
        lengthChange: false,
        paging: false,
        info: false,
        scrollY: 428,
        scrollX: true
      });

      table.buttons().container()
        .appendTo('#example_wrapper .col-sm-6:eq(0)');
    
    });
       
    
  </script>

  <script>
      function export_table_to_excel(id, type, fn) {
var wb = XLSX.utils.table_to_book(document.getElementById(id), {sheet:"Planilla_FM"});
var wbout = XLSX.write(wb, {bookType:type, bookSST:true, type: 'binary'});
var fname = fn || 'BCC_Detail.' + type;
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