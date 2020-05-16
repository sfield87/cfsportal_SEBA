<%-- 
    Document   : status_bot
    Created on : Apr 29, 2020, 5:18:41 PM
    Author     : AC16546
--%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>


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
    <link href="../css/status_bot.css" rel="stylesheet" type="text/css">
    <script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="../js/status_bot.js"></script>
    <title>CFS Applications</title>
</head>
<body>
<div id="wrapper" class="toggled toggled-2 full-height">
    <%@include file="../assets/SideBar.jsp" %>

    <div id="page-content-wrapper-main" class="toggled toggled-2 full-height">
        <%@include file="../assets/NavBar.jsp" %>

        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="btn-group">
                    <input type="submit" name="accion" value="Update" class="btn btn-go"
                           onclick="this.form.action='status_bot.jsp?accion=Update'" id="btnupdate">
                    <input type="submit" name="Refresh" value="Refresh" class="btn btn-go"
                           onclick="location.reload(true)">
                </div>
                <div class="row">
                    <div class="col-lg-3"><h4>Auto rebill</h4></div>
                    <div class="col-lg-2">
                        <label class="switch">
                            <%
                                String accion = request.getParameter("accion");
                                //corrijo inicio con valor nulo
                                if (accion == null) {
                                    accion = "nada";
                                }
                                ;
                                Connection cnx = null;
                                ResultSet rs = null;
                                try {
                                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                    String dbURL = "jdbc:sqlserver://ARPW-SQLFHR01;databaseName=BillingOpsDB;user=LATAMCFSREP;password=hq4-p.";
                                    cnx = DriverManager.getConnection(dbURL);
                                    PreparedStatement ps;
                                    String query = "";
                                    query = "Select * from [RPA].[dbo].[ProcessRunner] where [ProcessName] = 'Autorebill'";
                                    ps = cnx.prepareStatement(query);
                                    rs = ps.executeQuery();

                                    while (rs.next()) {
                                        String valor = "";
                                        valor = rs.getString(2);
                                        if (valor.equals("1")) {
                            %>
                            <input class="switch-input" type="checkbox" id="rebill" name="bot" checked>
                            <%
                            } else {
                            %>
                            <input class="switch-input" type="checkbox" id="rebill" name="bot">
                            <%
                                        }
                                        ps.close();
                                        rs.close();
                                        cnx.close();
                                    }
                                    ;
                                } catch (Exception e) {

                                }
                            %>
                            <span class="switch-label" data-on="Yes" data-off="No"></span>
                            <span class="switch-handle"></span>
                        </label>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-3"><h4>Subcase Closing</h4></div>
                    <div class="col-lg-2">
                        <label class="switch">
                            <%
                                cnx = null;
                                rs = null;
                                try {
                                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                    String dbURL = "jdbc:sqlserver://ARPW-SQLFHR01;databaseName=BillingOpsDB;user=LATAMCFSREP;password=hq4-p.";
                                    cnx = DriverManager.getConnection(dbURL);
                                    PreparedStatement ps;
                                    String query = "";
                                    query = "Select * from [RPA].[dbo].[ProcessRunner] where [ProcessName] = 'SubCasesClosing'";
                                    ps = cnx.prepareStatement(query);
                                    rs = ps.executeQuery();

                                    while (rs.next()) {
                                        String valor = "";
                                        valor = rs.getString(2);
                                        if (valor.equals("1")) {
                            %>
                            <input class="switch-input" type="checkbox" id="closes" name="bot" checked>
                            <%
                            } else {
                            %>
                            <input class="switch-input" type="checkbox" id="closes" name="bot">
                            <%
                                        }

                                    }
                                    ;
                                    ps.close();
                                    rs.close();
                                    cnx.close();

                                } catch (Exception e) {

                                }
                            %>
                            <span class="switch-label" data-on="Yes" data-off="No"></span>
                            <span class="switch-handle"></span>
                        </label>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-3"><h4>Triage Automation</h4></div>
                    <div class="col-lg-2">
                        <label class="switch">
                            <%
                                cnx = null;
                                rs = null;
                                try {
                                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                    String dbURL = "jdbc:sqlserver://ARPW-SQLFHR01;databaseName=BillingOpsDB;user=LATAMCFSREP;password=hq4-p.";
                                    cnx = DriverManager.getConnection(dbURL);
                                    PreparedStatement ps;
                                    String query = "";
                                    query = "Select * from [RPA].[dbo].[ProcessRunner] where [ProcessName] = 'TriageAutomation'";
                                    ps = cnx.prepareStatement(query);
                                    rs = ps.executeQuery();
                                    while (rs.next()) {
                                        String valor = "";
                                        valor = rs.getString(2);
                                        if (valor.equals("1")) {
                            %>
                            <input class="switch-input" type="checkbox" id="triage" name="bot" checked>
                            <%
                            } else {
                            %>
                            <input class="switch-input" type="checkbox" id="triage" name="bot">
                            <%
                                        }

                                    }
                                    ;
                                    ps.close();
                                    rs.close();
                                    cnx.close();

                                } catch (Exception e) {

                                }
                            %>
                            <span class="switch-label" data-on="Yes" data-off="No"></span>
                            <span class="switch-handle"></span>
                        </label>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-3"><h4>Potential Dispute Amount</h4></div>
                    <div class="col-lg-2">
                        <label class="switch">
                            <%
                                cnx = null;
                                rs = null;
                                try {
                                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                    String dbURL = "jdbc:sqlserver://ARPW-SQLFHR01;databaseName=BillingOpsDB;user=LATAMCFSREP;password=hq4-p.";
                                    cnx = DriverManager.getConnection(dbURL);
                                    PreparedStatement ps;
                                    String query = "";
                                    query = "Select * from [RPA].[dbo].[ProcessRunner] where [ProcessName] = 'PotentialDisputeAmount'";
                                    ps = cnx.prepareStatement(query);
                                    rs = ps.executeQuery();
                                    while (rs.next()) {
                                        String valor = "";
                                        valor = rs.getString(2);
                                        if (valor.equals("1")) {
                            %>
                            <input class="switch-input" type="checkbox" id="dispute" name="bot" checked>
                            <%
                            } else {
                            %>
                            <input class="switch-input" type="checkbox" id="dispute" name="bot">
                            <%
                                        }

                                    }
                                    ;
                                    ps.close();
                                    rs.close();
                                    cnx.close();

                                } catch (Exception e) {

                                }
                            %>
                            <span class="switch-label" data-on="Yes" data-off="No"></span>
                            <span class="switch-handle"></span>
                        </label>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-3"><h4>Suppress Escalation Weekly</h4></div>
                    <div class="col-lg-2">
                        <label class="switch">
                            <%
                                cnx = null;
                                rs = null;
                                try {
                                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                    String dbURL = "jdbc:sqlserver://ARPW-SQLFHR01;databaseName=BillingOpsDB;user=LATAMCFSREP;password=hq4-p.";
                                    cnx = DriverManager.getConnection(dbURL);
                                    PreparedStatement ps;
                                    String query = "";
                                    query = "Select * from [RPA].[dbo].[ProcessRunner] where [ProcessName] = 'SuppressEscalationMailsWeekly'";
                                    ps = cnx.prepareStatement(query);
                                    rs = ps.executeQuery();
                                    while (rs.next()) {
                                        String valor = "";
                                        valor = rs.getString(2);
                                        if (valor.equals("1")) {
                            %>
                            <input class="switch-input" type="checkbox" id="weekly" name="bot" checked>
                            <%
                            } else {
                            %>
                            <input class="switch-input" type="checkbox" id="weekly" name="bot">
                            <%
                                        }

                                    }
                                    ;
                                    ps.close();
                                    rs.close();
                                    cnx.close();

                                } catch (Exception e) {

                                }
                            %>
                            <span class="switch-label" data-on="Yes" data-off="No"></span>
                            <span class="switch-handle"></span>
                        </label>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-3"><h4>Suppress Escalation Monthly</h4></div>
                    <div class="col-lg-2">
                        <label class="switch">
                            <%
                                cnx = null;
                                rs = null;
                                try {
                                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                    String dbURL = "jdbc:sqlserver://ARPW-SQLFHR01;databaseName=BillingOpsDB;user=LATAMCFSREP;password=hq4-p.";
                                    cnx = DriverManager.getConnection(dbURL);
                                    PreparedStatement ps;
                                    String query = "";
                                    query = "Select * from [RPA].[dbo].[ProcessRunner] where [ProcessName] = 'SuppressEscalationMailsMonthly'";
                                    ps = cnx.prepareStatement(query);
                                    rs = ps.executeQuery();
                                    while (rs.next()) {
                                        String valor = "";
                                        valor = rs.getString(2);
                                        if (valor.equals("1")) {
                            %>
                            <input class="switch-input" type="checkbox" id="monthly" name="bot" checked>
                            <%
                            } else {
                            %>
                            <input class="switch-input" type="checkbox" id="monthly" name="bot">
                            <%
                                        }

                                    }
                                    ;
                                    ps.close();
                                    rs.close();
                                    cnx.close();

                                } catch (Exception e) {

                                }
                            %>
                            <span class="switch-label" data-on="Yes" data-off="No"></span>
                            <span class="switch-handle"></span>
                        </label>
                    </div>
                </div>

            </div>


            <%
                if (accion.equals("Update")) {


                    cnx = null;
                    rs = null;
                    try {
                        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                        String dbURL = "jdbc:sqlserver://ARPW-SQLFHR01;databaseName=BillingOpsDB;user=LATAMCFSREP;password=hq4-p.";
                        cnx = DriverManager.getConnection(dbURL);
                        PreparedStatement ps;
                        String query = "";
                        query = "update [RPA].[dbo].[ProcessRunner] set [StatusFlag] = '1' where [ProcessName] = 'Autorebill'";
                        ps = cnx.prepareStatement(query);
                        rs = ps.executeQuery();
                        ps.close();
                        rs.close();
                        cnx.close();

                    } catch (Exception e) {

                    }
                }

            %>
        </div>
    </div>
</div>

<script src="../js/bootstrap.min.js"></script>
<script src="../js/sidebar_menu.js"></script>
<script src="../js/bootstrap-table.min.js"></script>

<script type="text/javascript">
    $("h4").text("BOT Status");

    (function () {
        $(document).ready(function () {
            $('.switch-input').on('change', function () {
                var isChecked = $(this).is(':checked');
                var selectedData;
                var $switchLabel = $('.switch-label');

                if (isChecked) {
                    selectedData = $switchLabel.attr('data-off');
                } else {
                    selectedData = $switchLabel.attr('data-on');
                }
            });
        });

    })();
</script>
</body>
</html>
