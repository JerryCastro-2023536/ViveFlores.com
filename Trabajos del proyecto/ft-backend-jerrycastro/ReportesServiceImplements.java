package com.viveflores.blogturistico.Service;

import com.viveflores.blogturistico.Entity.Reportes;
import com.viveflores.blogturistico.Repository.ReportesRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReportesServiceImplements implements ReportesService{

    private final ReportesRepository reportesRepository;

    public ReportesServiceImplements(ReportesRepository reportesRepository) {
        this.reportesRepository = reportesRepository;
    }

    @Override
    public List<Reportes> getAllReportes() {
        return reportesRepository.findAll();
    }

    @Override
    public Reportes getReporteById(Integer id) {
        return reportesRepository.findById(id).orElse(null);
    }

    @Override
    public Reportes saveReportes(Reportes reportes) {
        return reportesRepository.save(reportes);
    }

    @Override
    public Reportes updateReportes(Integer id, Reportes reportes) {
        Reportes reportes1 = reportesRepository.findById(id).orElse(null);
        if(reportes1 != null){
            reportes1.setAsunto(reportes.getAsunto());
            reportes1.setMensaje(reportes.getMensaje());
            reportes1.setFecha_envio(reportes.getFecha_envio());
            reportes1.setId_usuario(reportes.getId_usuario());
        }else{
            throw new IllegalArgumentException("El id no existe");
        }
        return reportesRepository.save(reportes1);
    }

    @Override
    public void deleteReportes(Integer id) {
        Reportes reportes = reportesRepository.findById(id).orElse(null);
        reportesRepository.delete(reportes);
    }
}
