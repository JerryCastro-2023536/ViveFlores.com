package com.viveflores.blogturistico.Entity;
import jakarta.persistence.*;

@Entity

@Table (name = "Servicios")

public class Servicios {

    @Id

    @GeneratedValue (strategy = GenerationType.IDENTITY)

    @Column (name = "id_servicio")

    private Integer idServicio;

    @Column (name = "nombre_servicio")

    private Integer nombreServicio;

    @Column (name = "descripcion")

    private Integer descripcion;

    @Column (name = "telefono")

    private Integer telefono;

    @Column (name = "foto")

    private Integer foto;

    @Column (name = "fecha_creacion")

    private Integer fechaCreacion;

    @Column (name = "id_usuario")

    private Integer idUsuario;

    public Integer getIdServicio() {

        return idServicio;

    }

    public void setIdServicio(Integer idServicio) {

        this.idServicio = idServicio;

    }

    public Integer getNombreServicio() {

        return nombreServicio;

    }

    public void setNombreServicio(Integer nombreServicio) {

        this.nombreServicio = nombreServicio;

    }

    public Integer getDescripcion() {

        return descripcion;

    }

    public void setDescripcion(Integer descripcion) {

        this.descripcion = descripcion;

    }

    public Integer getTelefono() {

        return telefono;

    }

    public void setTelefono(Integer telefono) {

        this.telefono = telefono;

    }

    public Integer getFoto() {

        return foto;

    }

    public void setFoto(Integer foto) {

        this.foto = foto;

    }

    public Integer getFechaCreacion() {

        return fechaCreacion;

    }

    public void setFechaCreacion(Integer fechaCreacion) {

        this.fechaCreacion = fechaCreacion;

    }

    public Integer getIdUsuario() {

        return idUsuario;

    }

    public void setIdUsuario(Integer idUsuario) {

        this.idUsuario = idUsuario;

    }

}

