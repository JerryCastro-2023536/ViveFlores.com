package com.viveflores.blogturistico.Repository;

import com.viveflores.blogturistico.Entity.Servicios;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ServiciosRepository extends JpaRepository<Servicios, Integer> {
    // Puedes agregar consultas personalizadas si lo necesitas
}