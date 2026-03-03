package com.viveflores.blogturistico.Service;

import com.viveflores.blogturistico.Entity.Categorias;
import com.viveflores.blogturistico.Repository.CategoriasRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoriasServiceImplements implements CategoriasService {

    private final CategoriasRepository categoriasRepository;

    public CategoriasServiceImplements(CategoriasRepository categoriasRepository) {
        this.categoriasRepository = categoriasRepository;
    }

    @Override
    public List<Categorias> getAllCategorias() {
        return categoriasRepository.findAll();
    }

    @Override
    public Categorias getCategoriaById(Integer id) {
        return categoriasRepository.findById(id).orElse(null);
    }

    @Override
    public Categorias saveCategorias(Categorias categorias) {
        return categoriasRepository.save(categorias);
    }

    @Override
    public Categorias updateCategorias(Integer id, Categorias categorias) {
        Categorias categorias1 = categoriasRepository.findById(id).orElse(null);
        if (categorias1 != null) {
            categorias1.setNombre_categoria(categorias.getNombre_categoria());
            categorias1.setDescripcion(categorias.getDescripcion());
        } else {
            throw new IllegalArgumentException("El id no existe");
        }
        return categoriasRepository.save(categorias1);
    }

    @Override
    public void deleteCategorias(Integer id) {
        Categorias categorias = categoriasRepository.findById(id).orElse(null);
        categoriasRepository.delete(categorias);
    }
}