/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.dao;

import com.ipn.mx.modelo.dto.CategoriaDTO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
//import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author AMJac
 */
public class CategoriaDAO {

//    private static final String SQL_INSERT = " INSERT INTO Categoria(nombreCategoria, descripcionCategoria) VALUES (?, ?)";
//    private static final String SQL_UPDATE = " UPDATE Categoria SET nombreCategoria = ?, descripcionCategoria  = ?  WHERE idCategoria = ?";
//    private static final String SQL_DELETE = " DELETE FROM Categoria WHERE idCategoria = ?";
//    private static final String SQL_READ = "  SELECT  idCategoria, nombreCategoria, descripcionCategoria FROM Categoria WHERE idCategoria = ?";
//    private static final String SQL_READ_ALL = "  SELECT  idCategoria, nombreCategoria, descripcionCategoria FROM Categoria";
//    
    //private static final String SQL_INSERT = "{call spInsertar(?, ?)} ";
    private final String SQL_INSERT = "call spInsertarCategoria(?,?)";
    private final String SQL_UPDATE = "call  spActualizarCategoria(?,?,?)";
    private final String SQL_DELETE = "call spEliminarCategoria(?)";
    private final String SQL_READ = "select * from seleccionarCategoria(?)";
    private final String SQL_READ_ALL = "select * from seleccionaTodoCategoria()";
    
    private Connection conexion;

//    public Connection conectar() {
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
//        
//        return conexion;
//    }

    public Connection conectar(){
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
        return conexion;
    };
    
    public void create(CategoriaDTO dto) throws SQLException{
        conectar();
        CallableStatement ps = null;
        try{
            ps = conexion.prepareCall(SQL_INSERT);
            ps.setString(1, dto.getEntidad().getNombreCategoria());
            ps.setString(2, dto.getEntidad().getDescripcionCategoria());
            ps.executeUpdate();
        }finally{
            if(ps != null)
                ps.close();
            
            if (conexion != null)
                conexion.close();
        }
    }
    
    public void update(CategoriaDTO dto) throws SQLException{
        conectar();
        CallableStatement ps = null;
        try{
            ps = conexion.prepareCall(SQL_UPDATE);
            ps.setString(1, dto.getEntidad().getNombreCategoria());
            ps.setString(2, dto.getEntidad().getDescripcionCategoria());
            ps.setInt(3, dto.getEntidad().getIdCategoria());
            ps.executeUpdate();
        }finally{
            if(ps != null)
                ps.close();
            if(conexion != null)
                conexion.close();
        }
    }
    
    public void delete(CategoriaDTO dto) throws SQLException{
        conectar();
        CallableStatement ps = null;
        try{
            ps = conexion.prepareCall(SQL_DELETE);
            ps.setInt(1, dto.getEntidad().getIdCategoria());
            ps.executeUpdate();
        }finally{
            if(ps != null)
                ps.close();
            if(conexion != null)
                conexion.close();
        }
    }
    
    public CategoriaDTO read(CategoriaDTO dto) throws SQLException{
        conectar();
        CallableStatement ps = null;
        ResultSet rs = null;
        
        try{
            ps = conexion.prepareCall(SQL_READ);
            ps.setInt(1, dto.getEntidad().getIdCategoria());
            rs = ps.executeQuery();
            List resultados = obtenerResultados(rs);
            if(resultados.size()>0)
                return (CategoriaDTO)resultados.get(0);
            else
                return null;
        }finally{
            if(rs != null)
                rs.close();
            if(ps != null)
                ps.close();
            if(conexion != null)
                conexion.close();
        }
    }
    
    public List readAll() throws SQLException{
        conectar();
        CallableStatement ps = null;
        ResultSet rs = null;
        
        try{
            ps = conexion.prepareCall(SQL_READ_ALL);
            rs = ps.executeQuery();
            List resultados = obtenerResultados(rs);
            if(resultados.size() > 0)
                return resultados;
            else
                return null;
        }finally{
            if(rs != null)
                rs.close();
            if(ps != null)
                ps.close();
            if(conexion != null)
                conexion.close();
        }
    }

    private List obtenerResultados(ResultSet rs) throws SQLException{
        List resultados = new ArrayList();
        while(rs.next()){
            CategoriaDTO dto =  new CategoriaDTO();
            dto.getEntidad().setIdCategoria(rs.getInt("idCategoria"));
            dto.getEntidad().setNombreCategoria(rs.getString("nombreCategoria"));
            dto.getEntidad().setDescripcionCategoria(rs.getString("descripcionCategoria"));
            resultados.add(dto);
        }
        return resultados;
    }
    
    public static void main (String [] args){
        CategoriaDAO dao = new CategoriaDAO();
        CategoriaDTO dto = new CategoriaDTO();
        
        dto.getEntidad().setIdCategoria(2);
        //dto.getEntidad().setNombreCategoria("Computo");
        //dto.getEntidad().setDescripcionCategoria("Cosas para la escuela");
        
        try {
            //dao.create(dto);
            //dao.update(dto);
//            System.out.println(dao.readAll());
            System.out.println(dao.read(dto));
            
//            dao.delete(dto);
        } catch (SQLException ex) {
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
