using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ExamenFinal.Dominio.Modelo;
using ExamenFinal.Infraestructura.Datos;

namespace ExamenFinal.MVC.Controllers
{
    public class AlumnosController : Controller
    {
        private readonly FinalDbContext _finalDbContext;
        public AlumnosController(FinalDbContext finalDbContext)
        {
            _finalDbContext = finalDbContext;
        }

        public async Task<IActionResult> Index(string nombres, string apellidos)
        {
            var alumnos = from a in _finalDbContext.Alumno
                          select a;

            if (!String.IsNullOrEmpty(nombres))
            {
                alumnos = alumnos.Where(a => a.Nombres.Contains(nombres));
            }

            if (!String.IsNullOrEmpty(apellidos))
            {
                alumnos = alumnos.Where(a => a.Apellidos.Contains(apellidos));
            }

            return View(await alumnos.ToListAsync());
        }

        public async Task<IActionResult> Editar(int id)
        {
            var alumno = await _finalDbContext.Alumno
                    .Where(p => p.AlumnoID == id)
                    .FirstOrDefaultAsync();

            return View(alumno);
        }

        [HttpPost]
        public async Task<IActionResult> Editar(Alumnos model)
        {
            if (model.AlumnoID > 0)
                _finalDbContext.Update(model);
            else
                _finalDbContext.Add(model);

            await _finalDbContext.SaveChangesAsync();

            //return View(model);
            return RedirectToAction("Index");
        }

        public async Task<IActionResult> Nuevo()
        {
            var model = new Alumnos();
            return View("Editar", model);
        }

        public IActionResult Atras()
        {
            return RedirectToAction("Index", "Alumnos");
        }
    }
}
