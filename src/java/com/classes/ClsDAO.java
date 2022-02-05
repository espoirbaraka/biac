/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.classes;

import java.io.File;
import java.io.FileInputStream;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ELI MALEKANI
 */
public class ClsDAO {
    public String valeur = "?";
    public CallableStatement call;
    static int number = 0;
    static File fls;
    static FileInputStream input;
    public PreparedStatement pst;
    public ResultSet res;

    public ClsDAO() {
    
    }
    
    
    
    private static Connection myConnection;
     
     public String formatConnectionString(Connexion connDB) {
        StringBuilder connectionString = new StringBuilder();
        connectionString.append("jdbc:mysql://")
                        .append(connDB.getServer())
                        .append(":")
                        .append(connDB.getPort())
                        .append("/")
                        .append(connDB.getDatabase())
                        .append("?user=")
                        .append(connDB.getUser())
                        .append("&password=")
                        .append(connDB.getPassword())				
                        .append("&serverTimezone=UTC");
        return connectionString.toString();
        
    }
     
     
     public  Connection getConnection() throws SQLException, ClassNotFoundException {
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connexion cnx = new Connexion("localhost" , "jspbanque", "root", "", 3306);
            myConnection=DriverManager.getConnection(formatConnectionString(cnx));
            return myConnection;
        }catch(ClassNotFoundException | SQLException e){
            return null;
        } 
    }
     
     
     
    
    
    public  void insert(String table, Object... ob) throws Exception {
        Object obj[];
        obj = new Object[ob.length];
        fls = null;
        input = null;
        //permet de recupere le donne et les stockee dans le tableau obj    
        for (int i = 0; i < ob.length; i++) {
            if (ob[i] instanceof String) {
                String txt = (String) ob[i];
                obj[i] = txt.toUpperCase();
            
            } else if (ob[i] instanceof Integer) {
                Integer intg = (Integer) ob[i];
                obj[i] = intg;
            }
            else if (ob[i] instanceof Double) {
                Double intg = (Double) ob[i];
                obj[i] = intg;
            }
        }
        //creation de parametre selon la taille du table du BD       
        for (int j = 0; j < ob.length - 1; j++) {
            valeur = valeur + ",?";

        }
        //interconnection avec la sqlServer
        call = (CallableStatement) getConnection().prepareCall("call " + table + "(" + valeur + ")");

        //insertion dans la base de donnee
        for (int k = 0; k < ob.length; k++) {
            if (k == number && fls != null) {

                input = new FileInputStream(fls);
                call.setBinaryStream(k + 1, input, (int) fls.length());
            } else {
                call.setObject(k + 1, obj[k]);
            }

        }
        //execution de notre insertion, de notre callableStatement
        call.executeUpdate();
        valeur = "?";
        //ContenuClasse.alerteInformation("Information", "Succeful");
        //System.out.println("File Input: "+obj[number].toString());

    }
    
    
    
    
    
    
    public int GetId(String table, String id) throws SQLException, ClassNotFoundException{
        
        int ret = 0;
        String query = "Select MAX("+id+") from "+table+"";
        pst = (PreparedStatement) getConnection().prepareStatement(query);
        
        res = pst.executeQuery();
        while(res.next()){
            res.getInt(ret);
        }
        return ret;
    }
    
    
    
    
   public String Combo(String query, String id, String champ) throws SQLException, ClassNotFoundException{
       pst = (PreparedStatement) getConnection().prepareStatement(query);
       String jspLine = "";
       res = pst .executeQuery();
       while(res.next())
       {   
           jspLine = "%>"+"<option value=\"<%=" + res.getString("id")+"%>><%=" +res.getString("designation")+"%></option>";
       }
        return  jspLine;
     }
    
}
