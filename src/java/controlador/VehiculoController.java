package controlador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Conexion;
import modelo.Vehiculo;

/**
 * @author Dennis_Andino
 */
public class VehiculoController {

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;

    public VehiculoController() {
    }

    public List misVehiculos(int idPropietario) {
        String sql = "SELECT * FROM VEHICULOS WHERE id_cli=?";
        List<Vehiculo> tabla = new ArrayList<>();

        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idPropietario);
            rs = ps.executeQuery();

            while (rs.next()) {
                Vehiculo unVehiculo = new Vehiculo();
                unVehiculo.setId_veh(rs.getInt(1));
                unVehiculo.setId_cli(rs.getInt(2));
                unVehiculo.setVin(rs.getString(3));
                unVehiculo.setMarca(rs.getString(4));
                unVehiculo.setModelo(rs.getString(5));
                unVehiculo.setUbicacion(rs.getString(6));
                unVehiculo.setCilindraje(rs.getString(7));
                unVehiculo.setTransmision(rs.getString(8));
                unVehiculo.setKilometraje(rs.getString(9));
                unVehiculo.setDescripcion(rs.getString(10));
                unVehiculo.setImg1(rs.getString(11));
                unVehiculo.setImg2(rs.getString(12));
                unVehiculo.setImg3(rs.getString(13));
                unVehiculo.setDisp_vent(rs.getInt(14));
                unVehiculo.setDisp_rent(rs.getInt(15));
                unVehiculo.setVal_venta(rs.getInt(16));
                unVehiculo.setVal_renta(rs.getInt(17));
                tabla.add(unVehiculo);
            }
            rs.close();
            ps.close();
            cn.desconectar();
            System.out.println("");
            return tabla;

        } catch (SQLException e) {
            System.out.println("error:" + e);
            return null;
        }

    }

    public boolean agregarVehiculo(Vehiculo carrito) throws SQLException {
        String sql = "INSERT INTO VEHICULOS(id_veh,id_cli,vin,marca,modelo,ubicacion,cilindraje,transmision,kilometraje,descripcion,img1,img2,img3,disp_vent,disp_rent,val_venta,val_renta) VALUES(secveh.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        int contador;
        if (carrito.getVal_venta() > 0) {
            carrito.setDisp_vent(1);
        }
        if (carrito.getVal_renta() > 0) {
            carrito.setDisp_rent(1);
        }
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            ps.setInt(1, carrito.getId_cli());
            ps.setString(2, carrito.getVin());
            ps.setString(3, carrito.getMarca());
            ps.setString(4, carrito.getModelo());
            ps.setString(5, carrito.getUbicacion());
            ps.setString(6, carrito.getCilindraje());
            ps.setString(7, carrito.getTransmision());
            ps.setString(8, carrito.getKilometraje());
            ps.setString(9, carrito.getDescripcion());
            ps.setString(10, carrito.getImg1());
            ps.setString(11, carrito.getImg2());
            ps.setString(12, carrito.getImg3());
            ps.setInt(13, carrito.getDisp_vent());
            ps.setInt(14, carrito.getDisp_rent());
            ps.setInt(15, carrito.getVal_venta());
            ps.setInt(16, carrito.getVal_renta());
            contador = ps.executeUpdate();
            if (contador == 1) {
                System.out.println("Se guardo Correctamente");
                ps.close();
                cn.desconectar();
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            ps.close();
            cn.desconectar();
            return false;
        }
        return false;
    }

    public Vehiculo getVehiculo(String id) throws SQLException {
        String sql = "SELECT * FROM vehiculos WHERE id_veh=" + id;
        Vehiculo unVehiculo = new Vehiculo();
        con = cn.conectar();
        ps = con.prepareStatement(sql);
        try {
            rs = ps.executeQuery();
            while (rs.next()) {
                unVehiculo.setId_veh(rs.getInt(1));
                unVehiculo.setId_cli(rs.getInt(2));
                unVehiculo.setVin(rs.getString(3));
                unVehiculo.setMarca(rs.getString(4));
                unVehiculo.setModelo(rs.getString(5));
                unVehiculo.setUbicacion(rs.getString(6));
                unVehiculo.setCilindraje(rs.getString(7));
                unVehiculo.setTransmision(rs.getString(8));
                unVehiculo.setKilometraje(rs.getString(9));
                unVehiculo.setDescripcion(rs.getString(10));
                unVehiculo.setImg1(rs.getString(11));
                unVehiculo.setImg2(rs.getString(12));
                unVehiculo.setImg3(rs.getString(13));
                unVehiculo.setDisp_vent(rs.getInt(14));
                unVehiculo.setDisp_rent(rs.getInt(15));
                unVehiculo.setVal_venta(rs.getInt(16));
                unVehiculo.setVal_renta(rs.getInt(17));
            }
            rs.close();
            ps.close();
            cn.desconectar();
            return unVehiculo;

        } catch (SQLException e) {
            System.out.println("error:" + e);
            rs.close();
            ps.close();
            cn.desconectar();
            return null;
        }

    }

    public boolean actualizarVeh(Vehiculo vehiculo) {
        int contador = 0;
        String sql = "UPDATE VEHICULOS SET vin=?, marca=?, modelo=?, ubicacion=?, cilindraje=?, transmision=?, kilometraje=?, descripcion=?, val_venta=? WHERE id_veh=?";
        //String sql = "UPDATE VEHICULOS SET  modelo='jejejej', ubicacion='HTG avenida 24 lote 45 HN', cilindraje='9999', transmision='99999', kilometraje='99999', descripcion='99999', val_venta='160000'  WHERE id_veh=43";
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            ps.setString(1, vehiculo.getVin());
            ps.setString(2, vehiculo.getMarca());
            ps.setString(3, vehiculo.getModelo());
            ps.setString(4, vehiculo.getUbicacion());
            ps.setString(5, vehiculo.getCilindraje());
            ps.setString(6, vehiculo.getTransmision());
            ps.setString(7, vehiculo.getKilometraje());
            ps.setString(8, vehiculo.getDescripcion());
            ps.setInt(9, vehiculo.getVal_venta());
            ps.setInt(10, vehiculo.getId_veh());
            contador = ps.executeUpdate();
            if (contador >= 1) {
                ps.close();
                cn.desconectar();
                return true;
            }
        } catch (Exception e) {
            System.out.println(e.getCause());
            return false;
        }
        return false;
    }

    public List PublicidadVeh() {
        String sql = "SELECT * FROM VEHICULOS WHERE disp_vent=1";
        List<Vehiculo> tabla = new ArrayList<>();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Vehiculo unVehiculo = new Vehiculo();
                unVehiculo.setId_veh(rs.getInt(1));
                unVehiculo.setId_cli(rs.getInt(2));
                unVehiculo.setVin(rs.getString(3));
                unVehiculo.setMarca(rs.getString(4));
                unVehiculo.setModelo(rs.getString(5));
                unVehiculo.setUbicacion(rs.getString(6));
                unVehiculo.setCilindraje(rs.getString(7));
                unVehiculo.setTransmision(rs.getString(8));
                unVehiculo.setKilometraje(rs.getString(9));
                unVehiculo.setDescripcion(rs.getString(10));
                unVehiculo.setImg1(rs.getString(11));
                unVehiculo.setImg2(rs.getString(12));
                unVehiculo.setImg3(rs.getString(13));
                unVehiculo.setDisp_vent(rs.getInt(14));
                unVehiculo.setDisp_rent(rs.getInt(15));
                unVehiculo.setVal_venta(rs.getInt(16));
                unVehiculo.setVal_renta(rs.getInt(17));
                tabla.add(unVehiculo);
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

    public boolean eliminaVeh(String id_vehiculo) throws SQLException {
        String sql;
        sql = "DELETE FROM vehiculos WHERE id_veh=" + id_vehiculo;
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            ps.close();
            cn.desconectar();

            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        ps.close();
        cn.desconectar();
        return false;
    }

}
