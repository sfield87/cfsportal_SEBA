<%-- 
    Document   : BuscadorBan
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

        <!-- /#sidebar-wrapper -->
        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">

                <div class="row">
                    <form id="myform" action="" method="post" class="formulario">
                        BAN:
                        <input type="text" name="txtBAN" size="15" placeholder="Billing Account" autofocus/>
                        <input type="submit" name="RequestInvoice" value="Request Invoices" class="btn btn-go"
                               onclick="this.form.action='BCCForm.jsp?accion=consulta'"
                               style="border: 2px solid #48D597">
                        <input id="hist" name="histo" type="checkbox" vaue="Historic Credit"> <label
                            class="form-check-label" for="exampleCheck1">Historic Invoice</label>
                        &emsp; Credit ID:
                        <input id="CredIn" type="text" name="txtCredit" size="10" placeholder="Credit ID" autofocus/>
                        <input onclick='printChecked();return false;' type="submit" name="FindSelected"
                               value="Find Selected" class="btn btn-go" style="border: 2px solid #48D597">
                    </form>
                </div>
                <!---<table id="mytable">-->
                <div id="BCC" style="overflow-y:hidden">
                    <table id="mytable" data-search="true" class="table table-striped table-hover">
                        <thead>
                        <tr>
                            <th data-sortable="true">BAN</th>
                            <th>OCC</th>
                            <th>BillCurrency</th>
                            <th>CustomerName</th>
                            <th>BanName</th>
                            <th>InvoiceNo</th>
                            <th data-sortable="true">BillRefNo</th>
                            <th>Añadir</th>
                            <th>EmmisionDate</th>
                            <th>Amount</th>
                            <th>AmountUSD</th>
                            <th>Status</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%

                            //inicializo variables
                            String accion = request.getParameter("accion");
                            //corrijo inicio con valor nulo
                            if (accion == null) {
                                accion = "nada";
                            }
                            ;

                            if (accion.equals("consulta")) {


                                Connection cnx = null;
                                ResultSet rs = null;

                                try {
                                    Class.forName("oracle.jdbc.OracleDriver");

                                    String dbURL = "jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=g20-14b1.idc1.level3.com)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=BLFXR101.LEVEL3.COM)))";
                                    String strUserID = "LATAMCFSREP";
                                    String strPassword = "LATAM_blfxp101";
                                    cnx = DriverManager.getConnection(dbURL, strUserID, strPassword);

                                    //  cnx=DriverManager.getConnection ("jdbc:oracle:thin:@4.72.90.36:1521:DWP", "AC16516", "?7ay?!3g");

                                    // sta = cnx.createStatement();  //inicializo conex

                                    PreparedStatement ps;

                                    String bann = request.getParameter("txtBAN"); // "5-DSL2PBDM";
                                    String strCheckBoxValue = request.getParameter("histo");
                                    boolean blnCheckBoxNameChecked = false;

                                    if (strCheckBoxValue != null)
                                        blnCheckBoxNameChecked = true;

                                    bann = bann.replaceAll(" ", "");
                                    String query = "";

                                    if (bann == null) {
                                    }


                                    if (blnCheckBoxNameChecked == false) {
                                        BufferedReader reader = new BufferedReader(new FileReader("\\\\latamfs\\Latam CFS Applications\\Web Server Files\\Resources\\Query\\Web_Queries\\BCCForm_Act.sql"));
                                        StringBuilder sb = new StringBuilder();
                                        String line;

                                        while ((line = reader.readLine()) != null) {
                                            sb.append(line + "\n");
                                        }
                                        query = sb.toString();
                                    } else {
                                        BufferedReader reader = new BufferedReader(new FileReader("\\\\latamfs\\Latam CFS Applications\\Web Server Files\\Resources\\Query\\Web_Queries\\BCCForm_Hist.sql"));
                                        StringBuilder sb = new StringBuilder();
                                        String line;

                                        while ((line = reader.readLine()) != null) {
                                            sb.append(line + "\n");
                                        }
                                        query = sb.toString();
                                    }


                                    ps = cnx.prepareStatement(query);
                                    ps.setString(1, bann);

                                    rs = ps.executeQuery();         // ejecuto query

                                    while (rs.next()) {
                        %>

                        <tr>
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
                            <td><%=rs.getString(6)%>
                            </td>
                            <td class="link" name="BRN" id="link"><a href="BCC_Result.jsp?txtBRN=<%=rs.getString(7)%>"
                                                                     target="_blank"><%=rs.getString(7)%>
                            </a></td>
                            <td style="text-align: center; vertical-align: middle;">
                                <input type="checkbox" name="query_myTextEditBox">
                            </td>
                            <td><%=rs.getString(8)%>
                            </td>
                            <td><%=rs.getString(9)%>
                            </td>
                            <td><%=rs.getString(10)%>
                            </td>
                            <td><%=rs.getString(11)%>
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


    <!-- /#wrapper -->
    <!-- jQuery -->


    <script src="../js/jquery-1.11.2.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/sidebar_menu.js"></script>
    <script src="../js/bootstrap-table.min.js"></script>
    <script src="../js/table-export.js"></script>
    <script src="../js/FileSaver.min.js"></script>
    <!--<script src="../js/fixedHeader.bootstrap.min.js"></script>-->
    <script src="../js/datatables.min.js"></script>

    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdn.datatables.net/v/dt/dt-1.10.20/datatables.min.js" type="text/javascript"></script>
    <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>

    <script type="text/javascript">
        $("h4").text("Rebill Spreadsheet Request Page");

        // On page load

        $(document).ready(function () {
            var table = $('#mytable').DataTable({
                dom: 'Bfrtip',
                lengthChange: false,
                paging: false,
                info: false,
                scrollY: 428,
                scrollX: true
            });


            jQuery(function () {
                if (localStorage.input) {
                    var checks = JSON.parse(localStorage.input);
                    jQuery(':checkbox').prop('checked', function (i) {
                        return checks[i];
                    });
                }
            });

            jQuery(':checkbox').on('change', function () {
                localStorage.input = JSON.stringify(jQuery(':checkbox').map(function () {
                    return this.checked;
                }).get());
            });


            table.buttons().container()
                .appendTo('#example_wrapper .col-sm-6:eq(0)');

        });


    </script>
    <script type="text/javascript">
        function printChecked() {
            var items = document.getElementsByName('query_myTextEditBox');
            var histovar = document.getElementsByName('histo');
            var documentos = document.getElementsByName('BRN');
            var Credit = document.getElementById('CredIn').value;
            var selectedItems = "";
            var selectedDocuments = "";
            for (var i = 0; i < items.length; i++) {
                if (items[i].type == 'checkbox' && items[i].checked == true) {
                    selectedItems += items[i].value + "\n";
                    if (selectedDocuments == "") {
                        selectedDocuments += documentos[i].innerText;
                    } else {
                        selectedDocuments += "," + documentos[i].innerText;
                    }
                }
            }

            //var base_url = window.location.origin;
            var base_url = window.location.pathname;
            base_url = base_url.replace("BCCForm.jsp", "");

            for (var i = 0; i < histovar.length; i++) {
                if (histovar[i].type === "checkbox") {
                    if (histovar[i].checked === true) {
                        // Historic BRN here
                        //alert("Not Checked");
                        //var url = base_url +'/cfsportal/js/BCC_Result_Historic.jsp?txtBRN=' + selectedDocuments + '&CreditID=' +Credit;
                        var url = base_url + 'BCC_Result_Historic.jsp?txtBRN=' + selectedDocuments + '&CreditID=' + Credit;
                        //alert(url);
                    } else {
                        if (histovar[i].checked === false) {
                            // Regular BRN Here
                            //alert("Checked");
                            //var url = base_url +'/cfsportal/js/BCC_Result.jsp?txtBRN=' + selectedDocuments + '&CreditID=' +Credit;
                            var url = base_url + 'BCC_Result.jsp?txtBRN=' + selectedDocuments + '&CreditID=' + Credit;
                            //alert(url);
                        }
                    }
                }
            }
            //alert(selectedDocuments);
            //alert(Credit);

            //alert(url);

            window.open(url);
        }

    </script>


</body>

</html>