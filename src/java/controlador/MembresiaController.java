package controlador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Conexion;
import modelo.Membresia;
import modelo.Usuario;
import modelo.Vehiculo;

/**
 * @author Dennis_Andino
 */
public class MembresiaController {

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;

    public MembresiaController() {
    }

    public boolean RegistrarMemb(String titular, String tipo) {
        String sql = "INSERT INTO MEMBRESIAS(id_memb,titular,fechaContrato,tipo)VALUES(secMem.nextval,?,to_char(sysdate,'dd/MM/yy'),?)";
        int contador;
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            ps.setString(1, titular);
            ps.setString(2, tipo);

            contador = ps.executeUpdate();
            cn.desconectar();
            if (contador == 1) {
                System.out.println("Se guardo Correctamente");
                return true;
            }
            cn.desconectar();
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
        return false;

    }

    public List misMembresias(int idPropietario) {
        String sql = "SELECT id_memb,fechacontrato,tipo FROM MEMBRESIAS WHERE titular=" + idPropietario;

        List<Membresia> tabla = new ArrayList<>();

        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Membresia membresia = new Membresia();
                membresia.setId_memb(rs.getInt(1));
                membresia.setFechaContrato(rs.getString(2));
                membresia.setTipo(rs.getInt(3));
                tabla.add(membresia);
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

    public String[] membXrol() {
        String[] datos = new String[2];
        String rol = "";
        String usuxrol = "";
        String sql = "SELECT tipo, COUNT(*)as conteo from MEMBRESIAS GROUP BY tipo";

        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                switch (rs.getString(1)) {
                    case "1":
                        rol += "'" + "Administradores" + "',";
                        break;
                    case "2":
                        rol += "'" + "Vendedores directos" + "',";
                        break;

                    case "3":
                        rol += "'" + "Clientes" + "',";
                        break;
                    default:
                        break;

                }
                // rol += "'" + rs.getString(1) + "',";
                usuxrol += "" + rs.getString(2) + ",";
            }
            rs.close();
            ps.close();
            cn.desconectar();
            rol = rol.substring(0, rol.length() - 1);
            usuxrol = usuxrol.substring(0, usuxrol.length() - 1);
            datos[0] = rol;
            datos[1] = usuxrol;
            return datos;

        } catch (SQLException e) {
            System.out.println("error:" + e);
            return null;
        }

    }

}
