package modelo;

/**
 * @author Dennis_Andino
 */
public class Empresa {

    private int id_empresa;
    private String nombre;
    private String vision;
    private String mision;
    private String direccion;
    private String longitud;
    private String latitud;

    public Empresa() {
        id_empresa = 1;
        nombre = "vacio";
        vision = "vacio";
        mision = "vacio";
        direccion = "vacio";
        longitud = "vacio";
        latitud = "vacio";
    }

    public Empresa(int id_empresa, String nombre, String vision, String mision, String direccion, String longitud, String latitud) {
        this.id_empresa = id_empresa;
        this.nombre = nombre;
        this.vision = vision;
        this.mision = mision;
        this.direccion = direccion;
        this.longitud = longitud;
        this.latitud = latitud;
    }

    public String getLatitud() {
        return latitud;
    }

    public void setLatitud(String latitud) {
        this.latitud = latitud;
    }

    public int getId_empresa() {
        return id_empresa;
    }

    public void setId_empresa(int id_empresa) {
        this.id_empresa = id_empresa;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getVision() {
        return vision;
    }

    public void setVision(String vision) {
        this.vision = vision;
    }

    public String getMision() {
        return mision;
    }

    public void setMision(String mision) {
        this.mision = mision;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getLongitud() {
        return longitud;
    }

    public void setLongitud(String longitud) {
        this.longitud = longitud;
    }

    public void limpiar() {
        id_empresa = 1;
        nombre = "vacio";
        vision = "vacio";
        mision = "vacio";
        direccion = "vacio";
        longitud = "vacio";
        latitud = "vacio";
    }

}
