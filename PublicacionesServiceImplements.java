package com.viveflores.blogturistico.Service;

import com.viveflores.blogturistico.Entity.Publicaciones;
import com.viveflores.blogturistico.Repository.PublicacionesRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PublicacionesServiceImplements implements PublicacionesService {
    private final PublicacionesRepository publicacionesRepository;

    public PublicacionesServiceImplements(PublicacionesRepository publicacionesRepository) {
        this.publicacionesRepository = publicacionesRepository;
    }

    @Override
    public List<Publicaciones> getAllPublicaciones() {
        return publicacionesRepository.findAll();
    }

    @Override
    public Publicaciones getPublicacionesById(Integer id) {
        return publicacionesRepository.findById(id).orElse(null);
    }

    @Override
    public Publicaciones savePublicaciones(Publicaciones publicaciones) {
        return publicacionesRepository.save(publicaciones);
    }

    @Override
    public Publicaciones updatePublicaciones(Integer id, Publicaciones publicaciones) {
        Publicaciones publicaciones1 = publicacionesRepository.findById(id).orElse(null);
        if(publicaciones1 != null){
            publicaciones1.setNombre_publicacion(publicaciones.getNombre_publicacion());
            publicaciones1.setDireccion(publicaciones.getDireccion());
            publicaciones1.setFoto(publicaciones.getFoto());
            publicaciones1.setTelefono(publicaciones.getTelefono());
            publicaciones1.setEmail_publicacion(publicaciones.getEmail_publicacion());
            publicaciones1.setHorario(publicaciones.getHorario());
            publicaciones1.setFecha_creacion(publicaciones.getFecha_creacion());
            publicaciones1.setEstado_publicacion(publicaciones.getEstado_publicacion());
            publicaciones1.setId_categoria(publicaciones.getId_categoria());
            publicaciones1.setId_usuario(publicaciones.getId_usuario());
        }
        return publicacionesRepository.save(publicaciones1);
    }

    @Override
    public void deletePublicaciones(Integer id) {
        Publicaciones publicaciones = publicacionesRepository.findById(id).orElse(null);
        publicacionesRepository.delete(publicaciones);
    }
}
