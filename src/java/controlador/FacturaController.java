package controlador;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Conexion;
import modelo.Factura;

/**
 * @author Dennis_Andino
 */
public class FacturaController {

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;

    public FacturaController() {
    }

    public boolean generarFactura(Factura mifactura) throws SQLException {
        con = cn.conectar();
        CallableStatement cst = con.prepareCall("{call insertaFactura(?,?,?,?)}");
        try {
            cst.setInt("compradorid", mifactura.getCliente_id());
            cst.setInt("vehiculoid", mifactura.getVehiculo_id());
            cst.setString("detal", mifactura.getDetalle());
            cst.setInt("subtotal", mifactura.getSub_total());
            cst.execute();
            System.out.println("Se guardo Correctante");
            cst.close();
            cn.desconectar();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;

    }

    public List misCompras(int idusuario) {
        String sql = "SELECT id_fact,fecha,detalle,sub_total FROM FACTURAS WHERE comprador_id=?";
        List<Factura> tabla = new ArrayList<>();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idusuario);
            rs = ps.executeQuery();

            while (rs.next()) {
                Factura factura = new Factura();
                factura.setId_fact(rs.getInt(1));
                factura.setFecha(rs.getString(2));
                factura.setDetalle(rs.getString(3));
                factura.setSub_total(rs.getInt(4));
                tabla.add(factura);
            }
            rs.close();
            ps.close();
            cn.desconectar();
            return tabla;

        } catch (SQLException e) {
            System.out.println("error:" + e);
            return null;
        }

    }

    public List misVentas(int idusuario) {
        String sql = "SELECT id_fact,fecha,detalle,sub_total FROM FACTURAS WHERE vendedor_id=?";
        List<Factura> tabla = new ArrayList<>();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idusuario);
            rs = ps.executeQuery();

            while (rs.next()) {
                Factura factura = new Factura();
                factura.setId_fact(rs.getInt(1));
                factura.setFecha(rs.getString(2));
                factura.setDetalle(rs.getString(3));
                factura.setSub_total(rs.getInt(4));
                tabla.add(factura);
            }
            rs.close();
            ps.close();
            cn.desconectar();
            return tabla;

        } catch (SQLException e) {
            System.out.println("error:" + e);
            return null;
        }

    }

}
