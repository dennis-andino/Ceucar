package modelo;

/**
 * * @author Dennis_Andino
 */
public class Usuario {

    private int id_us, rol, likes, dislikes;
    private String clave, nombre, apellido, correo, pais, ubicacion, telefono, Fecha_nac, rtn, latitud, longitud;

    public Usuario() {
        clave = "";
        nombre = "";
        apellido = "";
        correo = "";
        pais = "";
        ubicacion = "";
        telefono = "";
        Fecha_nac = "";
        rtn = "";
        latitud = "";
        longitud = "";
        id_us = 0;
        rol = 0;
        likes = 0;
        dislikes = 0;
    }

    public Usuario(int id_us, int rol, int likes, int dislikes, String clave, String nombre, String apellido, String correo, String pais, String ubicacion, String telefono, String Fecha_nac, String rtn, String latitud, String longitud) {
        this.id_us = id_us;
        this.rol = rol;
        this.likes = likes;
        this.dislikes = dislikes;
        this.clave = clave;
        this.nombre = nombre;
        this.apellido = apellido;
        this.correo = correo;
        this.pais = pais;
        this.ubicacion = ubicacion;
        this.telefono = telefono;
        this.Fecha_nac = Fecha_nac;
        this.rtn = rtn;
        this.latitud = latitud;
        this.longitud = longitud;
    }

    public int getId_us() {
        return id_us;
    }

    public void setId_us(int id_us) {
        this.id_us = id_us;
    }

    public int getRol() {
        return rol;
    }

    public void setRol(int rol) {
        this.rol = rol;
    }

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }

    public int getDislikes() {
        return dislikes;
    }

    public void setDislikes(int dislikes) {
        this.dislikes = dislikes;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getFecha_nac() {
        return Fecha_nac;
    }

    public void setFecha_nac(String Fecha_nac) {
        this.Fecha_nac = Fecha_nac;
    }

    public String getRtn() {
        return rtn;
    }

    public void setRtn(String rtn) {
        this.rtn = rtn;
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

}
