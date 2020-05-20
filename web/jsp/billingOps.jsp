<%-- 
    Document   : Login
    Created on : Nov 20, 2019, 3:02:59 PM
    Author     : Field.sebastian
--%>
<%@page import="java.io.BufferedReader" %>
<%@page import="java.io.FileReader" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

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
<div id="wrapper" class="toggled toggled-2 full-height">
    <%@include file="../assets/SideBar.jsp" %>

    <div id="page-content-wrapper-main" class="toggled toggled-2 full-height">
        <%@include file="../assets/NavBar.jsp" %>
        <!-- /#sidebar-wrapper -->
        <!-- Page Content -->

        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="btn-group" style="width: 100%">
                    <form action="" method="post" class="formulario" style="width: 100%">
                        Subcaso:
                        <input type="text" name="txtTicket" size="20" autofocus/>
                        <input type="submit" name="SearchTkt" value="Search Ticket" class="btn btn-go"
                               onclick="this.form.action='billingOps.jsp?accion=consulta'"/>
                        <input type="submit" name="Refresh Page" value="Refresh Page" class="btn btn-go"
                               onclick="this.form.action='billingOps.jsp'"/>
                        <p id="xportxlsx" class="xport" style="display: inline-block;margin-left:-11px;">
                            <button class="btn btn-go" type="submit" onclick="doit('xlsx');">Download
                                <ion-icon class="icon_boton" name="download"></ion-icon>
                            </button>
                        </p>


                        <!-- Single button -->
                        <!--
                           <button type="button" class="btn btn-go dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="border: 2px solid #48D597">
                             Bops Action <span class="caret"></span>
                           </button>
                           <ul class="dropdown-menu" style="left: 407px">
                             <li><a href="#">Close Subcase</a></li>
                             <li><a href="#">Another action</a></li>
                             <li><a href="#">Something else here</a></li>
                             <li role="separator" class="divider"></li>
                             <li><a href="#">Update Ticket</a></li>
                           </ul>-->
                    </form>
                </div>

                <!---<table id="mytable">-->
                <div class="scrollme">
                    <table id="mydatatable" data-search="true" class="table table-striped table-hover">
                        <thead>
                        <tr>
                            <th style="white-space:nowrap"></th>
                            <th style="white-space:nowrap">Subcase_ID</th>
                            <th style="white-space:nowrap">Billing Account</th>
                            <th style="white-space:nowrap">Customer Name</th>
                            <th style="white-space:nowrap">OCC</th>
                            <th style="white-space:nowrap">Fecha Creacion</th>
                            <th style="white-space:nowrap">Asignee</th>
                            <th style="white-space:nowrap">Status Bops</th>
                            <th style="white-space:nowrap">Sub Status</th>
                            <th style="white-space:nowrap">Customer Close Date</th>
                            <th style="white-space:nowrap">Comments</th>
                            <th style="white-space:nowrap">Invoice Quantity</th>
                            <th style="white-space:nowrap">Creator</th>
                            <th style="white-space:nowrap">Owner</th>
                            <th style="white-space:nowrap">Status Fusion</th>
                            <th style="white-space:nowrap">Close Date</th>
                            <th style="white-space:nowrap">Type</th>
                        </tr>

                        </thead>
                        <tbody>
                        <%

                            //inicializo variables
                            String accion = request.getParameter("accion");
                            //corrijo inicio con valor nulo
                            if (accion == null) {
                                accion = "nada";
                            } else {
                                accion = "consulta";
                            }
                            ;

                            if (accion.equals("nada")) {


                                Connection cnx = null;
                                ResultSet rs = null;

                                try {

                                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

                                    String dbURL = "jdbc:sqlserver://ARPW-SQLFHR01;databaseName=BillingOpsDB;user=LATAMCFSREP;password=hq4-p.";
                                    cnx = DriverManager.getConnection(dbURL);
                                    //,strUserID,strPassword);

                                    //  cnx=DriverManager.getConnection ("jdbc:oracle:thin:@4.72.90.36:1521:DWP", "AC16516", "?7ay?!3g");

                                    // sta = cnx.createStatement();  //inicializo conex

                                    PreparedStatement ps;
                                    BufferedReader reader = new BufferedReader(new FileReader("\\\\latamfs\\Latam CFS Applications\\Web Server Files\\Resources\\Query\\Web_Queries\\billingOps.sql"));
                                    StringBuilder sb = new StringBuilder();
                                    String line;

                                    while ((line = reader.readLine()) != null) {
                                        sb.append(line + "\n");
                                    }

                                    ps = cnx.prepareStatement(sb.toString());

                                    rs = ps.executeQuery();         // ejecuto query

                                    while (rs.next()) {
                        %>

                        <tr>
                            <td style="text-align: center; vertical-align: middle;">
                                <input type="checkbox" name="query_myTextEditBox">
                            </td>
                            <td><%=rs.getString(1)%>
                            </td>
                            <td><%=rs.getString(2)%>
                            </td>
                            <td><%=rs.getString(3)%>
                            </td>
                            <td><%=rs.getString(4)%>
                            </td>
                            <td><%=rs.getString(5)%>
                            </td>
                            <td style="text-align: left; vertical-align: middle;">
                                <select class="btn btn-success btn-xs dropdown-toggle" type="button"
                                        data-toggle="dropdown" onchange="populateSelect(this.value)">
                                    <option value="ST"><%=rs.getString(6)%>
                                    </option>
                                    <option value="PR">Pablo Rizzuti</option>
                                    <option value="SB">Silvina Burgat</option>
                                    <option value="RG">Rosangela Goncalves</option>
                                    <option value="RG">Sebastian Field</option>
                                </select>
                            </td>
                            <td style="text-align: left; vertical-align: middle;">
                                <select class="btn btn-success btn-xs dropdown-toggle" type="button"
                                        data-toggle="dropdown" onchange="populateSelect(this.value)">
                                    <option value="ST"><%=rs.getString(7)%>
                                    </option>
                                    <option value="CL">Closed</option>
                                    <option value="DC">Declined</option>
                                    <option value="IP">In Progress</option>
                                    <option value="PD">Pending</option>
                                    <option value="RS">Reassigned</option>
                                </select>
                            </td>
                            <td style="text-align: left; vertical-align: middle;">
                                <select class="btn btn-success btn-xs dropdown-toggle" type="button"
                                        data-toggle="dropdown" onchange="populateSelect(this.value)">
                                    <option value="ST"><%=rs.getString(8)%>
                                    </option>
                                    <option value="PB">Pending BOPS</option>
                                    <option value="TI">TAX Issue</option>
                                    <option value="CS">Closed</option>
                                    <option value="DC">Declined</option>
                                    <option value="RS">Reassigned</option>
                                    <option value="MI">Multiple Invoices</option>
                                    <option value="IF">Incorrect File</option>
                                    <option value="PS">Proforma Sent</option>
                                    <option value="IB">Inconsistent-Blocked</option>
                                    <option value="IP">In Progress</option>
                                    <option value="NM">Next Month - Radication</option>
                                    <option value="PO">Pending HES/PO</option>
                                </select>
                            </td>
                            <td><%=rs.getString(9)%>
                            </td>
                            <td contenteditable="true"><%=rs.getString(10)%>
                            </td>
                            <td contenteditable="true"><%=rs.getString(11)%>
                            </td>
                            <td contenteditable="true"><%=rs.getString(12)%>
                            </td>
                            <td contenteditable="true"><%=rs.getString(13)%>
                            </td>
                            <td contenteditable="true"><%=rs.getString(14)%>
                            </td>
                            <td><%=rs.getString(15)%>
                            </td>
                            <td><%=rs.getString(16)%>
                            </td>
                        </tr>

                        <%
                                    }
                                    ;
                                    ps.close();
                                    rs.close();
                                    cnx.close();
                                } catch (Exception e) {
                                    out.println("System Error: " + e);
                                }
                            }
                            ;

                            if (accion.equals("consulta")) {


                                Connection cnx = null;
                                ResultSet rs = null;

                                try {

                                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

                                    String dbURL = "jdbc:sqlserver://ARPW-SQLFHR01;databaseName=BillingOpsDB;user=LATAMCFSREP;password=hq4-p.";
                                    cnx = DriverManager.getConnection(dbURL);
                                    //,strUserID,strPassword);

                                    //  cnx=DriverManager.getConnection ("jdbc:oracle:thin:@4.72.90.36:1521:DWP", "AC16516", "?7ay?!3g");

                                    // sta = cnx.createStatement();  //inicializo conex

                                    PreparedStatement ps;

                                    String tktSearch = request.getParameter("txtTicket"); // "5-DSL2PBDM";

                                    tktSearch = tktSearch.replaceAll(" ", "");


                                    String query = "SELECT [SUBCASE_ID] " +
                                            " ,[BAN] " +
                                            ",[NOMBRE CLIENTE] " +
                                            ",[OCC] " +
                                            ",cast([Fecha Creacion] as Date)" +
                                            ",[Asignee] " +
                                            ",[Status Bops] " +
                                            ",[Substatus]  " +
                                            ",[Fecha Cierre Cliente] " +
                                            ",[Comentario] " +
                                            ",[Cantidad de Facturas] " +
                                            ",[Creator] " +
                                            ",[Owner] " +
                                            ",[Status Fusion] " +
                                            ",cast([Fecha Cierre] as Date) " +
                                            ",[Tipo] " +
                                            "FROM [BillingOpsDB].[dbo].[sat_tickets] " +
                                            "WHERE [SUBCASE_ID] =  ? ";

                                    ps = cnx.prepareStatement(query);

                                    ps.setString(1, tktSearch + " ");

                                    rs = ps.executeQuery();         // ejecuto query

                                    while (rs.next()) {
                        %>

                        <tr>
                            <td style="text-align: center; vertical-align: middle;">
                                <input type="checkbox" name="query_myTextEditBox">
                            </td>
                            <td><%=rs.getString(1)%>
                            </td>
                            <td><%=rs.getString(2)%>
                            </td>
                            <td><%=rs.getString(3)%>
                            </td>
                            <td><%=rs.getString(4)%>
                            </td>
                            <td><%=rs.getString(5)%>
                            </td>
                            <td style="text-align: left; vertical-align: middle;">
                                <select class="btn btn-success btn-xs dropdown-toggle" type="button"
                                        data-toggle="dropdown" onchange="populateSelect(this.value)">
                                    <option value="ST"><%=rs.getString(6)%>
                                    </option>
                                    <option value="PR">Pablo Rizzuti</option>
                                    <option value="SB">Silvina Burgat</option>
                                    <option value="RG">Rosangela Goncalves</option>
                                    <option value="RG">Sebastian Field</option>
                                </select>
                            </td>
                            <td style="text-align: left; vertical-align: middle;">
                                <select class="btn btn-success btn-xs dropdown-toggle" type="button"
                                        data-toggle="dropdown" onchange="populateSelect(this.value)">
                                    <option value="ST"><%=rs.getString(7)%>
                                    </option>
                                    <option value="CL">Closed</option>
                                    <option value="DC">Declined</option>
                                    <option value="IP">In Progress</option>
                                    <option value="PD">Pending</option>
                                    <option value="RS">Reassigned</option>
                                </select>
                            </td>
                            <td style="text-align: left; vertical-align: middle;">
                                <select class="btn btn-success btn-xs dropdown-toggle" type="button"
                                        data-toggle="dropdown" onchange="populateSelect(this.value)">
                                    <option value="ST"><%=rs.getString(8)%>
                                    </option>
                                    <option value="PB">Pending BOPS</option>
                                    <option value="TI">TAX Issue</option>
                                    <option value="CS">Closed</option>
                                    <option value="DC">Declined</option>
                                    <option value="RS">Reassigned</option>
                                    <option value="MI">Multiple Invoices</option>
                                    <option value="IF">Incorrect File</option>
                                    <option value="PS">Proforma Sent</option>
                                    <option value="IB">Inconsistent-Blocked</option>
                                    <option value="IP">In Progress</option>
                                    <option value="NM">Next Month - Radication</option>
                                    <option value="PO">Pending HES/PO</option>
                                </select>
                            </td>
                            <td><%=rs.getString(9)%>
                            </td>
                            <td contenteditable="true"><%=rs.getString(10)%>
                            </td>
                            <td contenteditable="true"><%=rs.getString(11)%>
                            </td>
                            <td contenteditable="true"><%=rs.getString(12)%>
                            </td>
                            <td contenteditable="true"><%=rs.getString(13)%>
                            </td>
                            <td contenteditable="true"><%=rs.getString(14)%>
                            </td>
                            <td><%=rs.getString(15)%>
                            </td>
                            <td><%=rs.getString(16)%>
                            </td>
                        </tr>


                        <%
                                    }
                                    ;
                                    ps.close();
                                    rs.close();
                                    cnx.close();
                                } catch (Exception e) {
                                    out.println("System Error: " + e);
                                }
                            }
                            ;

                        %>
                        </tbody>
                    </table>

                </div>

            </div>
        </div>
        <!-- /#page-content-wrapper -->

    </div>

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

<script src="https://cdnjs.cloudflare.com/ajax/libs/blob-polyfill/4.0.20190430/Blob.min.js"
        type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xls/0.7.6/xls.core.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.15.1/xlsx.core.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.15.1/xlsx.core.min.js" type="text/javascript"></script>

<script type="text/javascript">

    $("h4").text("Open Subcases");

    $(document).ready(function () {
        var table = $('#mydatatable').DataTable({
            dom: 'Bfrtip',
            lengthChange: false,
            paging: false,
            info: false,
            scrollY: '65vh',
            scrollX: true
        });

        table.buttons().container()
            .appendTo('#example_wrapper .col-sm-6:eq(0)');


    });
</script>

<script>
    function export_table_to_excel(id, type, fn) {
        var wb = XLSX.utils.table_to_book(document.getElementById(id), {sheet: "Tickets_BOPs"});
        var wbout = XLSX.write(wb, {bookType: type, bookSST: true, type: 'binary'});
        var fname = fn || 'Tickets_BOPs.' + type;
        try {
            saveAs(new Blob([s2ab(wbout)], {type: "application/octet-stream"}), fname);
        } catch (e) {
            if (typeof console != 'undefined') console.log(e, wbout);
        }
        return wbout;
    }

    function s2ab(s) {
        if (typeof ArrayBuffer !== 'undefined') {
            var buf = new ArrayBuffer(s.length);

            var view = new Uint8Array(buf);
            for (var i = 0; i != s.length; ++i) view[i] = s.charCodeAt(i) & 0xFF;

            return buf;
        } else {
            var buf = new Array(s.length);
            for (var i = 0; i != s.length; ++i) buf[i] = s.charCodeAt(i) & 0xFF;
            return buf;
        }
    }

    function doit(type, fn) {
        return export_table_to_excel('mydatatable', type || 'xlsx', fn);
    }


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