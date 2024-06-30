using Microsoft.AspNetCore.Mvc;

namespace ExamenFinal.MVC.Controllers
{
    public class MatriculaController: Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
