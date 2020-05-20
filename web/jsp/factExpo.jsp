<%-- 
    Document   : factExpo
    Created on : Apr 25, 2020, 12:37:38 PM
    Author     : AC16546
--%>

<%@page import="jxl.*" %>
<%@page import="org.apache.poi.xssf.usermodel.XSSFCell" %>
<%@page import="org.apache.poi.xssf.usermodel.XSSFRow" %>
<%@page import="org.apache.poi.xssf.usermodel.XSSFSheet" %>
<%@page import="org.apache.poi.xssf.usermodel.XSSFWorkbook" %>
<%@page import="java.io.FileOutputStream" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<%
    List<String> headerValues = new ArrayList<String>();
    XSSFWorkbook workbook = new XSSFWorkbook();

    Connection cnx = null;
    ResultSet rs = null;
    try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String dbURL = "jdbc:sqlserver://ARPW-SQLFHR01;databaseName=LatamCFSAnalytics;user=LATAMCFSREP;password=hq4-p.";

        //Class.forName("oracle.jdbc.OracleDriver");
        //String dbURL = "jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=g20-14b1.idc1.level3.com)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=BLFXR101.LEVEL3.COM)))";
        //String strUserID = "LATAMCFSREP";
        //String strPassword = "LATAM_blfxp101";
            
            
           /* BufferedReader reader = new BufferedReader(new FileReader("\\\\latamfs\\Latam CFS Applications\\Web Server Files\\Resources\\Query\\Web_Queries\\expo01.sql"));
           StringBuilder sb = new StringBuilder();
           String line;

           while((line = reader.readLine())!= null){
                sb.append(line+"\n");
           }
           */
        String query = "SELECT [IdCustomerName] " +
                "	  ,[IdBanId] " +
                "      ,[IdBnaName] " +
                "	  ,[IdOcc] " +
                "      ,[IdOrigCountry] " +
                "      ,[IdType] " +
                "      ,[IdAccountNo] " +
                "      ,[IdBusinessUnit] " +
                "      ,[IdBillRefNo] " +
                "      ,[IdLegalNbr] " +
                "      ,[IdTypeDocument] " +
                "      ,[IdBillingCurrency] " +
                "      ,[IdAgreementCurrency] " +
                "      ,[IdFromDate] " +
                "      ,[IdToDate] " +
                "      ,[IdEmissionDate] " +
                "      ,[IdDueDate] " +
                "      ,[IdBillCycle] " +
                "      ,[IdChgDate] " +
                "      ,[IdModality] " +
                "      ,[IdAmount] " +
                "      ,[IdOperatingAmount] " +
                "      ,[IdLocalTotal] " +
                "      ,[IdUsdTotal] " +
                "      ,[IdAmountTotal] " +
                "     ,[IdExchangeRate] " +
                "  FROM [LatamCFSAnalytics].[dbo].[IssueDocumentsTracking] idt " +
                "  WHERE 1=1 " +
                "  and idt.[IdOwningCostCtr] = '638' " +
                "  and idt.[IdType] = ('Invoice - Class E') " +
                "  and idt.[IdEmissionDate] >= DATEADD(mm, -2, DATEADD(month, DATEDIFF(month, 0, CURRENT_TIMESTAMP), 0)) " +
                "  and idt.[IdEmissionDate] <  DATEADD(m, DATEDIFF(m, 0, GETDATE()), 0)";

        cnx = DriverManager.getConnection(dbURL);

        //String query = sb.toString();

        PreparedStatement ps = cnx.prepareStatement(query);
        rs = ps.executeQuery();

        XSSFSheet spreadsheet = workbook.createSheet("Factura_Expo");
        XSSFRow row = spreadsheet.createRow(0);
        XSSFCell cell;
        int cc = rs.getMetaData().getColumnCount();
        for (int i = 1; i <= cc; i++) {
            String headerVal = rs.getMetaData().getColumnName(i);
            headerValues.add(headerVal);
            cell = row.createCell(i - 1);
            cell.setCellValue(rs.getMetaData().getColumnName(i));
        }
        System.out.println(headerValues);
        /*row*/
        int i = 1;
        while (rs.next()) {

            XSSFRow row1 = spreadsheet.createRow((short) i);
            for (int p = 0; p < headerValues.size(); p++) {
                row1.createCell((short) p).setCellValue(rs.getString(headerValues.get(p)));
            }
            i++;
        }
        String fileName = "C:\\Users\\field.sebastian\\Documents\\Testing";

        FileOutputStream fos = new FileOutputStream(fileName);
        workbook.write(fos);
        out.close();
        System.out.println("exceldatabase.xlsx written successfully");

    } catch (Exception e) {
    }


%>

