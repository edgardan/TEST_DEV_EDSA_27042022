using API_Rest_DB_Persona_Manager.DTO;
using Microsoft.EntityFrameworkCore;
//using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.SqlServer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API_Rest_DB_Persona_Manager.Context
{
    public class CoreDbContext : DbContext
    {
        public CoreDbContext (DbContextOptions<CoreDbContext> dbContextOptions) : base (dbContextOptions)
         {
         }
        public DbSet<Tb_PersonasFisicas> Tb_PersonasFisicas { get; set; }
    }
}
