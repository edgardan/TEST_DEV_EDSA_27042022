using API_Rest_DB_Persona_Manager.DTO;
using API_Rest_DB_Persona_Manager.Services;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API_Rest_DB_Persona_Manager.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PersonaFisicaController : ControllerBase
    {
        private readonly InterfacePersonaFisicaServices _iPersonaFisicaServices; // esta variable es privada para que nadie tenga acceso a la bd mas que la clase 
        public PersonaFisicaController(InterfacePersonaFisicaServices iPersonaFisicaServices)
        {
            this._iPersonaFisicaServices = iPersonaFisicaServices;
        }

       [HttpGet]
        public IActionResult Get()
        {
            return Ok(_iPersonaFisicaServices.Listar());
        }
        
        /*[HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            RPPersonaFisica rpPersonaFisica = new RPPersonaFisica();

            var personaRet = rpPersonaFisica.ObtenerPersonaFisica(id);

            if (personaRet == null)
            {
                var nf = NotFound("La persona fisica " + id.ToString() + " no existe.");
                return nf;
            }

            return Ok(personaRet);
        }*/
        

        [HttpDelete("{id}")] 
        public IActionResult Delete(int id)
        {
            //Borrando persona fisica 
            return Ok(_iPersonaFisicaServices.Eliminar(id));
        }


        [HttpPut("actualizar")]
        public IActionResult ActualizarPersonaFisica([FromBody] Tb_PersonasFisicas dto)
        {
            //Creando persona fisica 
            return Ok(_iPersonaFisicaServices.Actualizar(dto));
        }


        [HttpPost("agregar")]
        public IActionResult AgregarPersonaFisica([FromBody] Tb_PersonasFisicas dto)
        {
            //Validaciones en datos de entrada
            if (string.IsNullOrEmpty(dto.Nombre))
            {
                BadRequest("Error el Nombre es nulo o vacio");
            }
            else if (string.IsNullOrEmpty(dto.ApellidoPaterno))
            {
                BadRequest("Error el Apellido Paterno es nulo o vacio");
            }
            else if (string.IsNullOrEmpty(dto.ApellidoMaterno))
            {
                BadRequest("Error el Apellido Materno es nulo o vacio");
            }
            else if (string.IsNullOrEmpty(dto.RFC))
            {
                BadRequest("Error el RFC es nulo o vacio");
            }
            /*else if (string.IsNullOrEmpty(dto.FechaNacimiento.ToString()))
            {
                BadRequest("Error la Fecha de nacimiento es nula o vacia");
            }*/
            else if (string.IsNullOrEmpty(dto.UsuarioAgrega.ToString()))
            {
                BadRequest("Error el Usuario que Agrega es nulo o vacio");
            }
            //Creando persona fisica 
            return Ok(_iPersonaFisicaServices.Crear(dto));
        }
    }
}

