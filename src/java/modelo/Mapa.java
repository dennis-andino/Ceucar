package modelo;

/**
 *
 * @author Dennis_Andino
 */
public class Mapa {

    String latitud;
    String longitud;
    String emailCli;
    String nombre;

    public Mapa() {
        latitud = "";
        longitud = "";
        emailCli = "";
    }

    public Mapa(String latitud, String longitud, String emailCli) {
        this.latitud = latitud;
        this.longitud = longitud;
        this.emailCli = emailCli;
    }

    public String getLatitud() {
        return latitud;
    }

    public void setLatitud(String latitud) {
        this.latitud = latitud;
    }

    public String getLongitud() {
        return longitud;
    }

    public void setLongitud(String longitud) {
        this.longitud = longitud;
    }

    public String getEmailCli() {
        return emailCli;
    }

    public void setEmailCli(String emailCli) {
        this.emailCli = emailCli;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void Limpiar() {
        latitud = "";
        longitud = "";
        emailCli = "";
    }
}
