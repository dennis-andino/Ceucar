package controlador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Conexion;
import modelo.Empresa;
import modelo.Factura;

/**
 * @author Dennis_Andino
 */
public class EmpresaController {

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;

    public EmpresaController() {
    }

    public Empresa obtInfoEmpresa() {
        String sql = "SELECT * FROM EMPRESA";
        Empresa organizacion = new Empresa();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                organizacion.setId_empresa(rs.getInt(1));
                organizacion.setNombre(rs.getString(2));
                organizacion.setVision(rs.getString(3));
                organizacion.setMision(rs.getString(4));
                organizacion.setDireccion(rs.getString(5));
                organizacion.setLongitud(rs.getString(6));
                organizacion.setLatitud(rs.getString(7));
            }
            rs.close();
            ps.close();
            cn.desconectar();
            return organizacion;

        } catch (SQLException e) {
            System.out.println("error:" + e);
            return null;
        }

    }
}
