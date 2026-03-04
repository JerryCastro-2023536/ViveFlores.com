package com.viveflores.blogturistico.Service;

import com.viveflores.blogturistico.Entity.Servicios;
import com.viveflores.blogturistico.Repository.ServiciosRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ServiciosServiceImplement {

    @Autowired
    private ServiciosRepository serviciosRepository;

    public List<Servicios> getAllServicios() {
        return serviciosRepository.findAll();
    }

    public Optional<Servicios> getServiciosById(Integer id) {
        return serviciosRepository.findById(id);
    }

    public Servicios saveServicios(Servicios servicios) {
        return serviciosRepository.save(servicios);
    }

    public Servicios updateServicios(Servicios servicios) {
        return serviciosRepository.save(servicios);
    }

    public void deleteServicios(Integer id) {
        serviciosRepository.deleteById(id);
    }
}