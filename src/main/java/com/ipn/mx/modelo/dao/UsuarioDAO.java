/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.dao;

import com.ipn.mx.modelo.dto.UsuarioDTO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
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
public class UsuarioDAO {

    private final String SQL_INSERT = "call spInsertarUsuario(?,?,?,?,?,?,?)";
    private final String SQL_UPDATE = "call  spActualizarUsuario(?,?,?,?,?,?,?,?)";
    private final String SQL_DELETE = "call spEliminarUsuario(?)";
    private final String SQL_READ = "select * from seleccionarUsuario(?)";
    private final String SQL_READ_ALL = "select * from seleccionaTodoUsuario()";

    private Connection conexion;

    public Connection conectar() {
        String user = "iewcorrxmgvsmo";
        String pwd = "a7750a2841c65540faa134f8c25978da1ea8dd72aaca9a853f0c30f2ac424fb7";
        String url = "jdbc:postgresql://ec2-44-198-24-0.compute-1.amazonaws.com:5432/d5luuaqm2h0rv1";
        String pgDriver = "org.postgresql.Driver";

        try {
            Class.forName(pgDriver);
            conexion = DriverManager.getConnection(url, user, pwd);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conexion;
    }

    ;
    
    public void create(UsuarioDTO dto) throws SQLException {
        conectar();
        CallableStatement ps = null;
        try {
            ps = conexion.prepareCall(SQL_INSERT);
            ps.setString(1, dto.getEntidad().getNombre());
            ps.setString(2, dto.getEntidad().getPaterno());
            ps.setString(3, dto.getEntidad().getMaterno());
            ps.setString(4, dto.getEntidad().getEmail());
            ps.setString(5, dto.getEntidad().getNombreUsuario());
            ps.setString(6, dto.getEntidad().getClaveUsuario());
            ps.setString(7, dto.getEntidad().getTipoUsuario());
            ps.executeUpdate();
        } finally {
            if (ps != null) {
                ps.close();
            }

            if (conexion != null) {
                conexion.close();
            }
        }
    }

    public void update(UsuarioDTO dto) throws SQLException {
        conectar();
        CallableStatement ps = null;
        try {
            ps = conexion.prepareCall(SQL_UPDATE);
            ps.setString(1, dto.getEntidad().getNombre());
            ps.setString(2, dto.getEntidad().getPaterno());
            ps.setString(3, dto.getEntidad().getMaterno());
            ps.setString(4, dto.getEntidad().getEmail());
            ps.setString(5, dto.getEntidad().getNombreUsuario());
            ps.setString(6, dto.getEntidad().getClaveUsuario());
            ps.setString(7, dto.getEntidad().getTipoUsuario());
            ps.setInt(8, dto.getEntidad().getIdUsuario());
            ps.executeUpdate();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (conexion != null) {
                conexion.close();
            }
        }
    }

    public void delete(UsuarioDTO dto) throws SQLException {
        conectar();
        CallableStatement ps = null;
        try {
            ps = conexion.prepareCall(SQL_DELETE);
            ps.setInt(1, dto.getEntidad().getIdUsuario());
            ps.executeUpdate();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (conexion != null) {
                conexion.close();
            }
        }
    }

    public UsuarioDTO read(UsuarioDTO dto) throws SQLException {
        conectar();
        CallableStatement ps = null;
        ResultSet rs = null;

        try {
            ps = conexion.prepareCall(SQL_READ);
            ps.setInt(1, dto.getEntidad().getIdUsuario());
            rs = ps.executeQuery();
            List resultados = obtenerResultados(rs);
            if (resultados.size() > 0) {
                return (UsuarioDTO) resultados.get(0);
            } else {
                return null;
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conexion != null) {
                conexion.close();
            }
        }
    }

    public List readAll() throws SQLException {
        conectar();
        CallableStatement ps = null;
        ResultSet rs = null;

        try {
            ps = conexion.prepareCall(SQL_READ_ALL);
            rs = ps.executeQuery();
            List resultados = obtenerResultados(rs);
            if (resultados.size() > 0) {
                return resultados;
            } else {
                return null;
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conexion != null) {
                conexion.close();
            }
        }
    }

    private List obtenerResultados(ResultSet rs) throws SQLException {
        List resultados = new ArrayList();
        while (rs.next()) {
            UsuarioDTO dto = new UsuarioDTO();
            dto.getEntidad().setIdUsuario(rs.getInt("idUsuario"));
            dto.getEntidad().setNombre(rs.getString("nombre"));
            dto.getEntidad().setNombre(rs.getString("paterno"));
            dto.getEntidad().setNombre(rs.getString("materno"));
            dto.getEntidad().setNombre(rs.getString("email"));
            dto.getEntidad().setNombre(rs.getString("nombreUsuario"));
            dto.getEntidad().setNombre(rs.getString("claveUsuario"));
            dto.getEntidad().setTipoUsuario(rs.getString("tipoUsuario"));
            resultados.add(dto);
        }
        return resultados;
    }

    public static void main(String[] args) {

        UsuarioDAO dao = new UsuarioDAO();
        UsuarioDTO dto = new UsuarioDTO();

//        dto.getEntidad().setIdUsuario(1);
        dto.getEntidad().setNombre("Jose");
        dto.getEntidad().setPaterno("Jose");
        dto.getEntidad().setMaterno("Jose");
        dto.getEntidad().setEmail("jose@email.com");
        dto.getEntidad().setNombreUsuario("jose");
        dto.getEntidad().setClaveUsuario("jose123");
        dto.getEntidad().setTipoUsuario("2");

        System.out.println(dto);

        try {

            dao.create(dto);
            //dao.update(dto);
//            System.out.println(dao.readAll());
//            System.out.println(dao.read(dto));

//            dao.delete(dto);
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
