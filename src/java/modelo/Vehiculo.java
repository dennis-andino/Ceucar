package modelo;

/*
 * @author Dennis_Andino
 */
public class Vehiculo {

    private int id_veh;

    private int disp_vent,
            disp_rent,
            id_cli,
            val_venta,
            val_renta;
    private String vin,
            marca,
            modelo,
            ubicacion,
            cilindraje,
            transmision,
            kilometraje,
            descripcion,
            img1,
            img2,
            img3;
    //Part nuevo=new Part();

    public Vehiculo() {
        id_veh = 0;
        disp_vent = 0;
        disp_rent = 0;
        id_cli = 0;
        val_venta = 0;
        val_renta = 0;
        vin = "";
        marca = "";
        modelo = "";
        ubicacion = "";
        cilindraje = "";
        transmision = "";
        kilometraje = "";
        descripcion = "";
        img1 = "";
        img2 = "";
        img3 = "";
    }

    public Vehiculo(int id_veh, int disp_vent, int disp_rent, int id_cli, int val_venta, int val_renta, String vin, String marca, String modelo, String ubicacion, String cilindraje, String transmision, String kilometraje, String descripcion, String img1, String img2, String img3) {
        this.id_veh = id_veh;
        this.disp_vent = disp_vent;
        this.disp_rent = disp_rent;
        this.id_cli = id_cli;
        this.val_venta = val_venta;
        this.val_renta = val_renta;
        this.vin = vin;
        this.marca = marca;
        this.modelo = modelo;
        this.ubicacion = ubicacion;
        this.cilindraje = cilindraje;
        this.transmision = transmision;
        this.kilometraje = kilometraje;
        this.descripcion = descripcion;
        this.img1 = img1;
        this.img2 = img2;
        this.img3 = img3;
    }

    public void limpiar() {
        id_veh = 0;
        disp_vent = 0;
        disp_rent = 0;
        id_cli = 0;
        val_venta = 0;
        val_renta = 0;
        vin = "";
        marca = "";
        modelo = "";
        ubicacion = "";
        cilindraje = "";
        transmision = "";
        kilometraje = "";
        descripcion = "";
        img1 = "";
        img2 = "";
        img3 = "";
    }

    public int getId_veh() {
        return id_veh;
    }

    public void setId_veh(int id_veh) {
        this.id_veh = id_veh;
    }

    public int getDisp_vent() {
        return disp_vent;
    }

    public void setDisp_vent(int disp_vent) {
        this.disp_vent = disp_vent;
    }

    public int getDisp_rent() {
        return disp_rent;
    }

    public void setDisp_rent(int disp_rent) {
        this.disp_rent = disp_rent;
    }

    public int getId_cli() {
        return id_cli;
    }

    public void setId_cli(int id_cli) {
        this.id_cli = id_cli;
    }

    public int getVal_venta() {
        return val_venta;
    }

    public void setVal_venta(int val_venta) {
        this.val_venta = val_venta;
    }

    public int getVal_renta() {
        return val_renta;
    }

    public void setVal_renta(int val_renta) {
        this.val_renta = val_renta;
    }

    public String getVin() {
        return vin;
    }

    public void setVin(String vin) {
        this.vin = vin;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public String getCilindraje() {
        return cilindraje;
    }

    public void setCilindraje(String cilindraje) {
        this.cilindraje = cilindraje;
    }

    public String getTransmision() {
        return transmision;
    }

    public void setTransmision(String transmision) {
        this.transmision = transmision;
    }

    public String getKilometraje() {
        return kilometraje;
    }

    public void setKilometraje(String kilometraje) {
        this.kilometraje = kilometraje;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getImg1() {
        return img1;
    }

    public void setImg1(String img1) {
        this.img1 = img1;
    }

    public String getImg2() {
        return img2;
    }

    public void setImg2(String img2) {
        this.img2 = img2;
    }

    public String getImg3() {
        return img3;
    }

    public void setImg3(String img3) {
        this.img3 = img3;
    }

}
