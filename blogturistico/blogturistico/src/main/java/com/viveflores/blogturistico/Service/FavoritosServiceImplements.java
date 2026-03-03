package com.viveflores.blogturistico.Service;

import com.viveflores.blogturistico.Entity.Favoritos;
import com.viveflores.blogturistico.Repository.FavoritosRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FavoritosServiceImplements implements FavoritosService{
    private final FavoritosRepository favoritosRepository;

    public FavoritosServiceImplements(FavoritosRepository favoritosRepository) {
        this.favoritosRepository = favoritosRepository;
    }

    @Override
    public List<Favoritos> getFavoritosAll() {
        return favoritosRepository.findAll();
    }

    @Override
    public Favoritos getFavoritosById(Integer id) {
        return favoritosRepository.findById(id).orElse(null);
    }

    @Override
    public Favoritos saveFavoritos(Favoritos favoritos) {
        return favoritosRepository.save(favoritos);
    }

    @Override
    public Favoritos updateFavoritos(Integer id, Favoritos favoritos) {
        Favoritos favoritos1 = favoritosRepository.findById(id).orElse(null);
        if(favoritos1 != null){
            favoritos1.setId_usuario(favoritos.getId_usuario());
            favoritos1.setId_publicacion(favoritos.getId_publicacion());
            favoritos1.setId_categoria(favoritos.getId_categoria());
        }else{
            throw new IllegalArgumentException("El id no existe");
        }
        return favoritosRepository.save(favoritos1);
    }

    @Override
    public void deleteFavoritos(Integer id) {
        Favoritos favoritos = favoritosRepository.findById(id).orElse(null);
        favoritosRepository.delete(favoritos);
    }
}
