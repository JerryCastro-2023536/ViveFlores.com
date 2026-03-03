package com.viveflores.blogturistico.Service;

import com.viveflores.blogturistico.Entity.Evento;
import com.viveflores.blogturistico.Repository.EventoRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EventoServiceImplements implements EventoService{
    private final EventoRepository eventoRepository;

    public EventoServiceImplements (EventoRepository eventoRepository) {
        this.eventoRepository = eventoRepository;
    }

    @Override
    public List<Evento> getAllEventos() {
        return eventoRepository.findAll();
    }

    @Override
    public Evento getEventoById(Integer id) {
        return eventoRepository.findById(id).orElse(null);
    }

    @Override
    public Evento saveEvento(Evento evento) throws RuntimeException {
        return eventoRepository.save(evento);
    }

    @Override
    public void deleteEvento(Integer id) {
        if (!eventoRepository.existsById(id)) {
            throw new RuntimeException("Evento no existe");
        }
        eventoRepository.deleteById(id);
    }

    @Override
    public Evento updateEvento(Integer id, Evento evento){
        Evento existingEvento = eventoRepository.findById(id).orElseThrow(() -> new RuntimeException("El evento no existe"));

        existingEvento.setNombreEvento(evento.getNombreEvento());
        existingEvento.setDescripcion(evento.getDescripcion());
        existingEvento.setFoto(evento.getFoto());
        existingEvento.setFechaInicio(evento.getFechaInicio());
        existingEvento.setFechaFin(evento.getFechaFin());
        existingEvento.setUbicacion(evento.getUbicacion());
        existingEvento.setIdUsuario(evento.getIdUsuario());

        return eventoRepository.save(existingEvento);

    }
}
