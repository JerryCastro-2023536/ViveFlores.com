package Service;

import Entity.Resena;
import Repository.ResenaRepository;

import java.util.List;

public class ResenaServiceImplements implements ResenaService{

    private final ResenaRepository resenaRepository;

    public ResenaServiceImplements (ResenaRepository resenaRepository){
        this.resenaRepository = resenaRepository;
    }

    @Override
    public List<Resena> getAllResenas(){
        return resenaRepository.findAll();
    }

    @Override
    public Resena getResenaById (Integer id){
        return resenaRepository.findById(id).orElse(null);
    }

    @Override
    public Resena saveResena (Resena resena) throws RuntimeException{
        return resenaRepository.save(resena);
    }

    @Override
    public void deleteResena(Integer id){
        if (!resenaRepository.existsById(id)){
            throw new RuntimeException("Resena no existe");
        }
        resenaRepository.deleteById(id);
    }

    @Override
    public Resena updateResena (Integer id, Resena resena){
        Resena existingResena= resenaRepository.findById(id).orElseThrow() -> new RuntimeException("La resena no existe");

        existingResena.setTituloResena(resena.getTituloResena());
        existingResena.setComentario(resena.getComentario());
        existingResena.setCalificacion(resena.getCalificacion());
        existingResena.setFecha_creacion(resena.getFecha_creacion());
        existingResena.setIdUsuario(resena.getIdUsuario());
        existingResena.setIdPublicacion(resena.getIdPublicacion());

        return resenaRepository.save(existingResena);
    }
}
