/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.classes;

/**
 *
 * @author ELI MALEKANI
 */
public class Connexion {
    public Connexion() {
    }
    
    
    private String server;
    private String database;
    private String user;
    private String password;
    private String path;
    private String driver;
    private int port;
    
    
    public static enum ConnexionType{
            Mysql,
            SQLServer,
            PostGreSQL,
            Oracle,
            Access
        }

    public Connexion(String server, String database, String user, String password, int port) {
        this.server = server;
        this.database = database;
        this.user = user;
        this.password = password;
        this.port = port;
    }

    public String getServer() {
        return server;
    }

    public void setServer(String server) {
        this.server = server;
    }

    public String getDatabase() {
        return database;
    }

    public void setDatabase(String database) {
        this.database = database;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getDriver() {
        return driver;
    }

    public void setDriver(String driver) {
        this.driver = driver;
    }

    public int getPort() {
        return port;
    }

    public void setPort(int port) {
        this.port = port;
    }
    
}
