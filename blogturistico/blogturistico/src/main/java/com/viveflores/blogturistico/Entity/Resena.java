package com.viveflores.blogturistico.Entity;

import jakarta.persistence.*;

import java.time.LocalDate;

@Entity
@Table (name = "Resenas")
public class Resena {
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    @Column (name = "id_resena")
    private Integer idResena;

    @Column (name = "titulo_resena")
    private String tituloResena;

    @Column (name = "comentario")
    private String comentario;

    @Column (name = "calificacion")
    private Integer calificacion;

    @Column (name = "fecha_creacion")
    private LocalDate fecha_creacion;

    @Column (name = "id_usuario")
    private Integer idUsuario;

    @Column (name = "id_publicacion")
    private Integer idPublicacion;

    public Integer getIdResena() {
        return idResena;
    }

    public void setIdResena(Integer idResena) {
        this.idResena = idResena;
    }

    public String getTituloResena() {
        return tituloResena;
    }

    public void setTituloResena(String tituloResena) {
        this.tituloResena = tituloResena;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public Integer getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(Integer calificacion) {
        this.calificacion = calificacion;
    }

    public LocalDate getFecha_creacion() {
        return fecha_creacion;
    }

    public void setFecha_creacion(LocalDate fecha_creacion) {
        this.fecha_creacion = fecha_creacion;
    }

    public Integer getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }

    public Integer getIdPublicacion() {
        return idPublicacion;
    }

    public void setIdPublicacion(Integer idPublicacion) {
        this.idPublicacion = idPublicacion;
    }
}
