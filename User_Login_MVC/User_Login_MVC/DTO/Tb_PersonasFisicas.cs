using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace User_Login_MVC.DTO //Data Transport Object
{
    public class Tb_PersonasFisicas
    {
        [Key]
        public int IdPersonaFisica { get; set; }
        //[Required(ErrorMessage = "Nombre es requerido")]
        //[StringLength(50, ErrorMessage = "Logitud máxima 50")]
        public string Nombre { get; set; }
        //[Required(ErrorMessage = "Apellido Paterno es requerido")]
        //[StringLength(50, ErrorMessage = "Logitud máxima 50")]
        public string ApellidoPaterno { get; set; }
        //[Required(ErrorMessage = "Apellido Materno es requerido")]
        //[StringLength(50, ErrorMessage = "Logitud máxima 50")]
        public string ApellidoMaterno { get; set; }
        //[Required(ErrorMessage = "RFC es requerido con homoclave")]
        //[StringLength(50, ErrorMessage = "Logitud máxima 13")]
        public string RFC { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public int UsuarioAgrega { get; set; }
    }
}