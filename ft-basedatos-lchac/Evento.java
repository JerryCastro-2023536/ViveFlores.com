package Entity;

import jakarta.persistence.*;

@Entity
@Table (name = "Eventos")
public class Evento {

    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    @Column (name = "id_evento")
    private Integer idEvento;

    @Column (name = "nombre_evento")
    private Integer nombreEvento;

    @Column (name = "descripcion")
    private Integer descripcion;

    @Column (name = "foto")
    private Integer foto;

    @Column (name = "fecha_inicio")
    private Integer fechaInicio;

    @Column (name = "fecha_fin")
    private Integer fechaFin;

    @Column (name = "ubicacion")
    private Integer ubicacion;

    @Column (name = "id_usuario")
    private Integer idUsuario;

    public Integer getIdEvento() {
        return idEvento;
    }

    public void setIdEvento(Integer idEvento) {
        this.idEvento = idEvento;
    }

    public Integer getNombreEvento() {
        return nombreEvento;
    }

    public void setNombreEvento(Integer nombreEvento) {
        this.nombreEvento = nombreEvento;
    }

    public Integer getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(Integer descripcion) {
        this.descripcion = descripcion;
    }

    public Integer getFoto() {
        return foto;
    }

    public void setFoto(Integer foto) {
        this.foto = foto;
    }

    public Integer getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Integer fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public Integer getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(Integer fechaFin) {
        this.fechaFin = fechaFin;
    }

    public Integer getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(Integer ubicacion) {
        this.ubicacion = ubicacion;
    }

    public Integer getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }
}
