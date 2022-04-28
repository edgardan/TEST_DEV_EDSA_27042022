using API_Rest_DB_Persona_Manager.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API_Rest_DB_Persona_Manager.Services
{
    public interface InterfacePersonaFisicaServices
    {
        //Tb_PersonasFisicas Buscar(int dto);
        List<Tb_PersonasFisicas> Listar();
        Tb_PersonasFisicas Crear(Tb_PersonasFisicas dto);
        int Actualizar(Tb_PersonasFisicas dto);
        int Eliminar(int dto);
    }
}
