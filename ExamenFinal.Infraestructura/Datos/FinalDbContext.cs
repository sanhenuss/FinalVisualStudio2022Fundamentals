using Microsoft.EntityFrameworkCore;
using ExamenFinal.Dominio.Modelo;

namespace ExamenFinal.Infraestructura.Datos
{
    public class FinalDbContext: DbContext
    {
        public FinalDbContext(DbContextOptions<FinalDbContext> options) : base(options)
        {

        }

        public DbSet<Alumnos> Alumno { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Alumnos>(
                p =>
                {
                    p.ToTable("Alumno");
                    p.HasKey(c => c.AlumnoID);
                }
                );


            base.OnModelCreating(modelBuilder);
        }

    }
}
