package Service;

import Entity.Servicio;

import java.util.List;

public interface ServicioService {
    List<Servicio> getAllServicios();
    Servicio getServicioById (Integer id);
    Servicio saveServicio (Servicio servicio) throws RuntimeException;
    Servicio updateServicio (Integer id, Servicio servicio);
    void deleteServicio (Integer id);
}
