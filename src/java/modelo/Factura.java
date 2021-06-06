package modelo;

/**
 * @author Dennis_Andino
 */
public class Factura {

    private int id_fact;
    private int cliente_id;
    private int vehiculo_id;
    private int multa;
    private int descuento;
    private int sub_total;
    private String detalle;
    private String fecha;

    public Factura() {
        id_fact = 0;
        cliente_id = 0;
        vehiculo_id = 0;
        multa = 0;
        descuento = 0;
        sub_total = 0;
        detalle = "";
        fecha = "";

    }

    public Factura(int id_fact, int cliente_id, int vehiculo_id, String detalle, int multa, int descuento, int sub_total) {
        this.id_fact = id_fact;
        this.cliente_id = cliente_id;
        this.vehiculo_id = vehiculo_id;
        this.detalle = detalle;
        this.multa = multa;
        this.descuento = descuento;
        this.sub_total = sub_total;
    }

    public int getSub_total() {
        return sub_total;
    }

    public void setSub_total(int sub_total) {
        this.sub_total = sub_total;
    }

    public int getId_fact() {
        return id_fact;
    }

    public void setId_fact(int id_fact) {
        this.id_fact = id_fact;
    }

    public int getCliente_id() {
        return cliente_id;
    }

    public void setCliente_id(int cliente_id) {
        this.cliente_id = cliente_id;
    }

    public int getVehiculo_id() {
        return vehiculo_id;
    }

    public void setVehiculo_id(int vehiculo_id) {
        this.vehiculo_id = vehiculo_id;
    }

    public String getDetalle() {
        return detalle;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }

    public int getMulta() {
        return multa;
    }

    public void setMulta(int multa) {
        this.multa = multa;
    }

    public int getDescuento() {
        return descuento;
    }

    public void setDescuento(int descuento) {
        this.descuento = descuento;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public void inicializar() {
        id_fact = 0;
        cliente_id = 0;
        vehiculo_id = 0;
        multa = 0;
        descuento = 0;
        sub_total = 0;
        detalle = "";
        fecha = "";
    }

}
