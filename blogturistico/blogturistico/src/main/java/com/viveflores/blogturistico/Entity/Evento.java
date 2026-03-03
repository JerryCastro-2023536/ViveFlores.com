package com.viveflores.blogturistico.Entity;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table (name = "Eventos")
public class Evento {

    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    @Column (name = "id_evento")
    private Integer idEvento;

    @Column (name = "nombre_evento")
    private String nombreEvento;

    @Column (name = "descripcion")
    private String descripcion;

    @Lob
    @Column (name = "foto")
    private byte[] foto;

    @Column (name = "fecha_inicio")
    private LocalDateTime fechaInicio;

    @Column (name = "fecha_fin")
    private LocalDateTime fechaFin;

    @Column (name = "ubicacion")
    private String ubicacion;

    @Column (name = "id_usuario")
    private Integer idUsuario;

    public Integer getIdEvento() {
        return idEvento;
    }

    public void setIdEvento(Integer idEvento) {
        this.idEvento = idEvento;
    }

    public String getNombreEvento() {
        return nombreEvento;
    }

    public void setNombreEvento(String nombreEvento) {
        this.nombreEvento = nombreEvento;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public byte[] getFoto() {
        return foto;
    }

    public void setFoto(byte[] foto) {
        this.foto = foto;
    }

    public LocalDateTime getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(LocalDateTime fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public LocalDateTime getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(LocalDateTime fechaFin) {
        this.fechaFin = fechaFin;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public Integer getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }
}