package com.viveflores.blogturistico.Service;

import com.viveflores.blogturistico.Entity.Categorias;
import com.viveflores.blogturistico.Repository.CategoriasRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CategoriasServiceImplement {

    @Autowired
    private CategoriasRepository categoriasRepository;

    public List<Categorias> getAllCategorias() {
        return categoriasRepository.findAll();
    }

    public Optional<Categorias> getCategoriaById(Integer id) {
        return categoriasRepository.findById(id);
    }

    public Categorias saveCategoria(Categorias categoria) {
        return categoriasRepository.save(categoria);
    }

    public void deleteCategoria(Integer id) {
        categoriasRepository.deleteById(id);
    }
}