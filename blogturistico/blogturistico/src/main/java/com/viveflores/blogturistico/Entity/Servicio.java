package com.viveflores.blogturistico.Entity;

import jakarta.persistence.*;

import java.time.LocalDate;

@Entity
@Table (name = "Servicios")
public class Servicio {
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    @Column (name = "id_servicio")
    private Integer idServicio;

    @Column (name = "nombre_servicio")
    private String nombreServicio;

    @Column (name = "descripcion")
    private String descripcion;

    @Column (name = "telefono")
    private Integer telefono;

    @Lob
    @Column (name = "foto")
    private byte[] foto;

    @Column (name = "fecha_creacion")
    private LocalDate fechaCreacion;

    @Column (name = "id_usuario")
    private Integer idUsuario;

    public Integer getIdServicio() {
        return idServicio;
    }

    public void setIdServicio(Integer idServicio) {
        this.idServicio = idServicio;
    }

    public String getNombreServicio() {
        return nombreServicio;
    }

    public void setNombreServicio(String nombreServicio) {
        this.nombreServicio = nombreServicio;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Integer getTelefono() {
        return telefono;
    }

    public void setTelefono(Integer telefono) {
        this.telefono = telefono;
    }

    public byte[] getFoto() {
        return foto;
    }

    public void setFoto(byte[] foto) {
        this.foto = foto;
    }

    public LocalDate getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(LocalDate fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public Integer getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }
}
