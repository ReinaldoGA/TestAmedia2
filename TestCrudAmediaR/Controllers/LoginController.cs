using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using TestCrudAmediaR.Models;
using TestCrudAmediaR.Services;

namespace TestCrudAmediaR.Controllers
{
    public class LoginController : Controller
    {
        ServiceUsers _service = new ServiceUsers();

        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Login(UserViewModel userViewModel)
        {
            if (!string.IsNullOrEmpty(userViewModel.userName) && string.IsNullOrEmpty(userViewModel.password))
            {
                return RedirectToAction("Login");
            }
            var usuario = _service.ValidateUser(userViewModel.userName, userViewModel.password);
            if (usuario != null)
            {
                var identity = new ClaimsIdentity(new[] {
                    new Claim(ClaimTypes.Name,userViewModel.userName)
                }, CookieAuthenticationDefaults.AuthenticationScheme);

                var principal = new ClaimsPrincipal(identity);

                var login = HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, principal);
                if (usuario.cod_rol == 1 ) { return RedirectToAction("Index", "tUsers"); }
                return RedirectToAction("Index", "Home");
            }

           
            return RedirectToAction("Index","Login");
        }

    }
}
