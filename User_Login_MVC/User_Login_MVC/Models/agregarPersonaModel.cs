using System;
using System.ComponentModel.DataAnnotations;

//namespace User_Registration_MVC.Models
namespace User_Login_MVC.Models
{
    public class agregarPersonaModel
    {
        public agregarPersonaModel()
        {
            this.Id = Guid.NewGuid();
            this.Creado = DateTime.Now;
        }

        [Key]
        [Required]
        public Guid Id { get; set; }

        [Required]
        public DateTime Creado { get; set; }
        [Required]
        public int IdPersonaFisica { get; set; }

        [Required(ErrorMessage = "Nombre es requerido")]
        [StringLength(50, ErrorMessage = "Logitud máxima 50")]
        public string Nombre { get; set; }

        //[Required(ErrorMessage = "Apellido es requerido")]
        [StringLength(50, ErrorMessage = "Logitud máxima 50")]
        public string apellidoPat { get; set; }

        [StringLength(50, ErrorMessage = "Logitud máxima 50")]
        public string apellidoMat { get; set; }

        public string rfc { get; set; }
        public string fechaNac { get; set; }

        //[Required(ErrorMessage = "Email es requerido")]
        //[StringLength(100, ErrorMessage = "Logitud máxima 100")]
        //[DataType(DataType.EmailAddress, ErrorMessage = "Email error")]
        //[EmailAddress(ErrorMessage = "Correo electrónico incorrecto")]
        //public string Email { get; set; }

    }
}