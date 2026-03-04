package com.viveflores.blogturistico.Entity;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name="solicitudPublicacion")
public class SolicitudPublicacion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    @Column(name = "id_solicitud")
    private Integer id_solicitud;

    @Column(name = "fecha_solicitud")
    private LocalDateTime fecha_solicitud;

    @Column(name = "estado")
    private String estado;

    @Column(name = "descripcion")
    private String descripcion;

    @Column(name = "id_publicacion")
    private Integer id_publicacion;

    @Column(name = "id_usuario")
    private Integer id_usuario;

    public Integer getId_solicitud() {
        return id_solicitud;
    }

    public void setId_solicitud(Integer id_solicitud) {
        this.id_solicitud = id_solicitud;
    }

    public LocalDateTime getFecha_solicitud() {
        return fecha_solicitud;
    }

    public void setFecha_solicitud(LocalDateTime fecha_solicitud) {
        this.fecha_solicitud = fecha_solicitud;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Integer getId_publicacion() {
        return id_publicacion;
    }

    public void setId_publicacion(Integer id_publicacion) {
        this.id_publicacion = id_publicacion;
    }

    public Integer getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(Integer id_usuario) {
        this.id_usuario = id_usuario;
    }
}
