/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.dao;

import com.ipn.mx.modelo.dto.GraficaDTO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author AMjac
 */
public class GraficaDAO {

    private Connection conexion;
    
    private static final String SQL_GRAFICAR = 
            "select nombreCategoria, count(*) as cantidad from Categoria inner join Producto on Categoria.idCategoria = Producto.claveCategoria "
            + "group by Categoria.nombreCategoria";
    
//    private void conectar() {
//        String user = "postgres";
//        String pwd = "admin";
//        String url = "jdbc:postgresql://localhost:5432/Base3CM13";
//        String pgDriver = "org.postgresql.Driver";
//        try {
//            Class.forName(pgDriver);
//            conexion = DriverManager.getConnection(url, user, pwd);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
    
    private void conectar(){
        String user = "ocderneymybfew";
        String pwd = "ba943dc8a733e4bac2bf4e0bb14b1656fa1e02f1a0af6e15b5b754125dca3cbc";
        String url = "jdbc:postgresql://ec2-23-20-208-173.compute-1.amazonaws.com:5432/dbf5pk92a0qe3e";
        String pgDriver = "org.postgresql.Driver"; 
        try{
            Class.forName(pgDriver);
            conexion = DriverManager.getConnection(url, user, pwd);
        }
        catch(Exception e){
            e.printStackTrace();
        }           
    };
    
    public List graficarProductosPorCategoria() throws SQLException{
        conectar();
        PreparedStatement ps = null;
        ResultSet rs = null;
        List lista = new ArrayList();
        try{
            ps = conexion.prepareStatement(SQL_GRAFICAR);
            rs = ps.executeQuery();
            while(rs.next()){
                GraficaDTO dto = new GraficaDTO();
                dto.setNombreCategoria(rs.getString("nombreCategoria"));
                dto.setCantidad(rs.getInt("cantidad"));
                lista.add(dto);
            }
        }finally{
            if(rs!=null) rs.close();
            if(ps!=null) ps.close();
            if(conexion!=null) conexion.close();
        } 
        return lista;
    }
    
    
    public static void main (String[] args){
        GraficaDAO dao = new GraficaDAO();
        
        try {
            System.out.println(dao.graficarProductosPorCategoria());
        } catch (SQLException ex) {
            Logger.getLogger(GraficaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}