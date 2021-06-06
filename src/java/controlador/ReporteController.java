package controlador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import modelo.Conexion;

/**
 *
 * @author Dennis_Andino
 */
public class ReporteController {

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;

    public ReporteController() {
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

    public String[] topVentas() {
        String[] datos = new String[10];
        String sql = "SELECT * FROM (SELECT usuarios.correo,COUNT(*) AS conteo FROM FACTURAS \n"
                + "INNER JOIN usuarios on facturas.vendedor_id=usuarios.id_us GROUP BY usuarios.correo order by conteo desc) vendedores WHERE ROWNUM<=10";
        for (int i = 0; i < 10; i++) {
            datos[i] = "";
        }

        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            int j = 0;
            while (rs.next()) {
                datos[j] = "['" + rs.getString(1) + "'," + rs.getString(2) + "],";
                j++;
            }
            rs.close();
            ps.close();
            cn.desconectar();
            return datos;

        } catch (SQLException e) {
            System.out.println("error:" + e);
            return null;
        }

    }

}
