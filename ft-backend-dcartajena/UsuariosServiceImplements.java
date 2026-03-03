package com.viveflores.blogturistico.Service;

import com.viveflores.blogturistico.Entity.Usuarios;
import com.viveflores.blogturistico.Repository.UsuariosRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UsuariosServiceImplements implements UsuariosService{
    private final UsuariosRepository UsuarioRepository;

    public UsuariosServiceImplements(UsuariosRepository usuarioRepository) {
        UsuarioRepository = usuarioRepository;
    }

    @Override
    public List<Usuarios> getAllUsuarios() {
        return UsuarioRepository.findAll();
    }

    @Override
    public Usuarios getUsuariosById(Integer id) {
        return UsuarioRepository.findById(id).orElse(null);
    }

    @Override
    public Usuarios saveUsuarios(Usuarios usuarios) throws RuntimeException {
        return UsuarioRepository.save(usuarios);
    }

    @Override
    public Usuarios updateUsuarios(Integer id, Usuarios usuarios) {
        return UsuarioRepository.save(usuarios);
    }

    @Override
    public void deleteUsuarios(Integer id) {
        UsuarioRepository.deleteById(id);
    }
}
