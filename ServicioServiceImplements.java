package Service;

import Entity.Servicio;
import Repository.ServicioRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ServicioServiceImplements implements ServicioService{
    private final ServicioRepository servicioRepository;

    public ServicioServiceImplements (ServicioRepository servicioRepository) {
        this.servicioRepository = servicioRepository;
    }

    @Override
    public List<Servicio> getAllServicios() {
        return servicioRepository.findAll();
    }

    @Override
    public Servicio getServicioById(Integer id) {
        return servicioRepository.findById(id).orElse(null);
    }

    @Override
    public Servicio saveServicio(Servicio servicio) throws RuntimeException {
        return servicioRepository.save(servicio);
    }

    @Override
    public void deleteServicio(Integer id) {
        if (!servicioRepository.existsById(id)) {
            throw new RuntimeException("Servicio no existe");
        }
        servicioRepository.deleteById(id);
    }

    @Override
    public Servicio updateServicio(Integer id, Servicio servicio){
        Servicio existingServicio = servicioRepository.findById(id).orElseThrow(() -> new RuntimeException("El servicio no existe"));

        existingServicio.setNombreServicio(servicio.getNombreServicio());
        existingServicio.setDescripcion(servicio.getDescripcion());
        existingServicio.setTelefono(servicio.getTelefono());
        existingServicio.setFoto(servicio.getFoto());
        existingServicio.setFechaCreacion(servicio.getFechaCreacion());
        existingServicio.setIdUsuario(servicio.getIdUsuario());

        return servicioRepository.save(existingServicio);

    }
}
