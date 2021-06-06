package controlador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Conexion;
import modelo.Mapa;

/**
 *
 * @author Dennis_Andino
 */
public class MapasController {

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;

    public MapasController() {
    }

    public List obtenerCoordenadas() {
        String sql = "SELECT latitud,longitud,correo,nombre FROM USUARIOS";
        List<Mapa> tabla = new ArrayList<>();

        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Mapa mimapa = new Mapa();
                mimapa.setLatitud(rs.getString(1));
                mimapa.setLongitud(rs.getString(2));
                mimapa.setEmailCli(rs.getString(3));
                mimapa.setNombre(rs.getString(4));
                tabla.add(mimapa);
            }

            /*for (int i = 0; i < tabla.size(); i++) {
                System.out.println(tabla.get(i).getEmailCli());
            }*/
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
