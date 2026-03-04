package com.viveflores.blogturistico.Controller;

import com.viveflores.blogturistico.Entity.Categorias;
import com.viveflores.blogturistico.Service.CategoriasServiceImplement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/categorias")
@CrossOrigin(origins = "*")  // Permite acceso desde cualquier origen
public class CategoriasController {

    @Autowired
    private CategoriasServiceImplement CategoriasServiceImplement;

    // GET /api/categorias
    @GetMapping
    public List<Categorias> getAllCategorias() {
        return CategoriasServiceImplement.getAllCategorias();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Categorias> getCategoriaById(@PathVariable Integer id) {
        return CategoriasServiceImplement.getCategoriaById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public Categorias createCategoria(@RequestBody Categorias categoria) {
        return CategoriasServiceImplement.saveCategoria(categoria);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Categorias> updateCategoria(@PathVariable Integer id, @RequestBody Categorias categoriaDetails) {
        return CategoriasServiceImplement.getCategoriaById(id)
                .map(categoria -> {
                    categoria.setNombre_categoria(categoriaDetails.getNombre_categoria());
                    categoria.setDescripcion(categoriaDetails.getDescripcion());
                    Categorias updatedCategoria = CategoriasServiceImplement.saveCategoria(categoria);
                    return ResponseEntity.ok(updatedCategoria);
                })
                .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteCategoria(@PathVariable Integer id) {
        return CategoriasServiceImplement.getCategoriaById(id)
                .map(categoria -> {
                    CategoriasServiceImplement.deleteCategoria(id);
                    return ResponseEntity.noContent().<Void>build();
                })
                .orElse(ResponseEntity.notFound().build());
    }
}