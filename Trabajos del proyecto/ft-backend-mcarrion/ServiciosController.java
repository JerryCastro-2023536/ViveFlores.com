package com.viveflores.blogturistico.Controller;

import com.viveflores.blogturistico.Entity.Servicios;
import com.viveflores.blogturistico.Service.ServiciosServiceImplement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/servicios")
public class ServiciosController {

    @Autowired
    private ServiciosServiceImplement ServiciosServiceImplement;

    @GetMapping
    public List<Servicios> getAllServicios() {
        return ServiciosServiceImplement.getAllServicios();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Servicios> getServiciosById(@PathVariable Integer id) {
        Optional<Servicios> servicios = ServiciosServiceImplement.getServiciosById(id);
        return servicios.map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public Servicios createServicios(@RequestBody Servicios servicios) {
        return ServiciosServiceImplement.saveServicios(servicios);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Servicios> updateServicios(@PathVariable Integer id, @RequestBody Servicios serviciosDetails) {
        Optional<Servicios> optionalServicios = ServiciosServiceImplement.getServiciosById(id);
        if (!optionalServicios.isPresent()) {
            return ResponseEntity.notFound().build();
        }
        Servicios servicios = optionalServicios.get();
        servicios.setNombreServicio(serviciosDetails.getNombreServicio());
        servicios.setDescripcion(serviciosDetails.getDescripcion());
        servicios.setTelefono(serviciosDetails.getTelefono());
        servicios.setFoto(serviciosDetails.getFoto());
        servicios.setFechaCreacion(serviciosDetails.getFechaCreacion());
        servicios.setIdUsuario(serviciosDetails.getIdUsuario());

        Servicios updatedServicios = ServiciosServiceImplement.updateServicios(servicios);
        return ResponseEntity.ok(updatedServicios);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteServicios(@PathVariable Integer id) {
        Optional<Servicios> servicios = ServiciosServiceImplement.getServiciosById(id);
        if (!servicios.isPresent()) {
            return ResponseEntity.notFound().build();
        }
        ServiciosServiceImplement.deleteServicios(id);
        return ResponseEntity.noContent().build();
    }
}