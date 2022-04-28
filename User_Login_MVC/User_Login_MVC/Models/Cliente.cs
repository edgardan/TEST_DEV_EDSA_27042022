using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace User_Registration_MVC.Models
{
    public class Cliente
    {
        public Cliente(int IdCliente, DateTime FechaRegistroEmpresa,
             string RazonSocial, string RFC, string Sucursal,
             int IdEmpleado, string Nombre, string Paterno, string Materno, int IdViaje)
        {
            this.IdCliente = IdCliente;
            this.FechaRegistroEmpresa = FechaRegistroEmpresa;
            this.RazonSocial = RazonSocial;
            this.RFC = RFC;
            this.Sucursal = Sucursal;
            this.IdEmpleado = IdEmpleado;
            this.Nombre = Nombre;
            this.Paterno = Paterno;
            this.Materno = Materno;
            this.IdViaje = IdViaje;
        }

        [Key]
        public int IdCliente { get; set; }
        public DateTime FechaRegistroEmpresa { get; set; }
        public string RazonSocial { get; set; }
        public string RFC { get; set; }
        public string Sucursal { get; set; }
        public int IdEmpleado { get; set; }
        public string Nombre { get; set; }
        public string Paterno { get; set; }
        public string Materno { get; set; }
        public int IdViaje { get; set; }

    }
}
