using Microsoft.AspNetCore.Mvc;

namespace ExamenFinal.MVC.Controllers
{
    public class NotasController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}