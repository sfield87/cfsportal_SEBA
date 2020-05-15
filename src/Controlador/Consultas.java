/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author field.sebastian
 */
public class Consultas extends Conexion{
    
    public boolean autenticacion(String user, String password){
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try{
            BufferedReader reader = new BufferedReader(new FileReader("\\\\latamfs\\Billing Operations Latam\\Utils\\NetBeans\\Latam CFS Application\\web\\sql\\usuario.sql"));
            StringBuilder sb = new StringBuilder();
            String line;
            while((line = reader.readLine())!= null){
                sb.append(line+"\n");
            };
            String consulta=(sb.toString());
            
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, user);
            pst.setString(2, password);
            rs = pst.executeQuery();
            
            while(rs.next()){
                return true;
            }
        }catch(Exception e){
            System.err.println("Error "+e);
        }finally{
            try{
                if(getConexion() != null) getConexion().close();
                if(pst != null)pst.close();
                if(rs != null)rs.close();
            }catch(Exception e){
                System.err.println("Error " + e);
            }
        }
        
    return false;
    
    }            
}
