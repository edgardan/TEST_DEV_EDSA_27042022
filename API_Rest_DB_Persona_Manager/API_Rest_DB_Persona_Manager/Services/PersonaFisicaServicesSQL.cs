using API_Rest_DB_Persona_Manager.Context;
using API_Rest_DB_Persona_Manager.DTO;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;

namespace API_Rest_DB_Persona_Manager.Services
{
    //Esta clase hereda de la InterfacePersonaFisicaServices ya que es una platilla para que no falte ninguna funcionalidad
    public class PersonaFisicaServicesSQL : InterfacePersonaFisicaServices
    {
        private readonly CoreDbContext _coreDbContext; // esta variable es privada para que nadie tenga acceso a la bd mas que la clase 
        public PersonaFisicaServicesSQL(CoreDbContext coreDbContext)
        {
            this._coreDbContext = coreDbContext;
        }

        /**
         * Este metodo actualiza una persona fisica 
         */
        public int Actualizar(Tb_PersonasFisicas dto)
        {
            _coreDbContext.Database.ExecuteSqlRaw("sp_ActualizarPersonaFisica {0},{1},{2},{3},{4},{5},{6}", dto.IdPersonaFisica, dto.Nombre, dto.ApellidoPaterno, dto.ApellidoMaterno, dto.RFC, dto.FechaNacimiento, dto.UsuarioAgrega);
            return _coreDbContext.SaveChanges();
        }
        /**
         * Este metodo crea una persona fisica 
         */
        public Tb_PersonasFisicas Crear(Tb_PersonasFisicas dto)
        {
            _coreDbContext.Database.ExecuteSqlRaw("sp_AgregarPersonaFisica {0},{1},{2},{3},{4},{5}", dto.Nombre, dto.ApellidoPaterno, dto.ApellidoMaterno, dto.RFC, dto.FechaNacimiento, dto.UsuarioAgrega);
            _coreDbContext.SaveChanges();
            return dto;
        }
        /**
         * ESte metodo elimina una persona fisica dado su ID
         */
        public int Eliminar(int dto)
        {
            _coreDbContext.Database.ExecuteSqlRaw("sp_EliminarPersonaFisica {0}", dto);
            return _coreDbContext.SaveChanges();
        }
        /**
         * Este metodo obtiene una lista de las personas fisicas 
         */
        public List<Tb_PersonasFisicas> Listar()
        {
           //return _coreDbContext.Tb_PersonasFisicas.ToList();
           return  _coreDbContext.Tb_PersonasFisicas.FromSqlRaw("sp_ListarPersonaFisica").ToList();
           //return _coreDbContext.SaveChanges();
        }
    }
}