namespace User_Login_MVC
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class User
    {
        public int UserId { get; set; }

        [Required(ErrorMessage = "Campo requerido")]
        public string Username { get; set; }

        [Required(ErrorMessage = "Campo requerido")]
        public string Password { get; set; }

        [Required(ErrorMessage = "Campo requerido")]
        [Compare("Password", ErrorMessage = "Las contrase�as no coinciden")]
        public string ConfirmPassword { get; set; }

        [Required(ErrorMessage = "Campo requerido")]
        [EmailAddress(ErrorMessage = "Correo inv�lido")]
        public string Email { get; set; }

        public System.DateTime CreatedDate { get; set; }

        public Nullable<System.DateTime> LastLoginDate { get; set; }

        public bool RememberMe { get; set; }
    }
}
