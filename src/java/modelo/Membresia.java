package modelo;

/**
 * @author Dennis_Andino
 */
public class Membresia {

    int id_memb, titular, tipo;
    String fechaContrato;

    public Membresia() {
        id_memb = 0;
        titular = 0;
        tipo = 0;
        fechaContrato = "";
    }

    public Membresia(int id_memb, int titular, int tipo, String fechaContrato) {
        this.id_memb = id_memb;
        this.titular = titular;
        this.tipo = tipo;
        this.fechaContrato = fechaContrato;
    }

    public int getId_memb() {
        return id_memb;
    }

    public void setId_memb(int id_memb) {
        this.id_memb = id_memb;
    }

    public int getTitular() {
        return titular;
    }

    public void setTitular(int titular) {
        this.titular = titular;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public String getFechaContrato() {
        return fechaContrato;
    }

    public void setFechaContrato(String fechaContrato) {
        this.fechaContrato = fechaContrato;
    }

    public void inicializar() {
        id_memb = 0;
        titular = 0;
        tipo = 0;
        fechaContrato = "";
    }
}
