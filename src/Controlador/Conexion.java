/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author field.sebastian
 */
public class Conexion {
    private String USERNAME = "LATAMCFSREP";
    private String PASSWORD = "hq4-p.";
    private String HOST = "ARPW-SQLFHR01";
    private String DATABASE = "BillingOpsDB";
    private String CLASSNAME = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private String URL = "jdbc:sqlserver://"+HOST+";databaseName="+DATABASE+";user="+USERNAME+";password="+PASSWORD;
    private Connection con;    
    
    public Conexion(){
    try{
        Class.forName(CLASSNAME);
        con = DriverManager.getConnection(URL);
        
    }catch(ClassNotFoundException | SQLException e){
        System.err.println("Error " + e);
    }
    
    }
    
    public Connection getConexion(){
        return con;
    }
    
    public static void main(String[] args){
        Conexion con = new Conexion();
        
    }
}
