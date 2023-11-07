using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using ProyectoFinal4To.Models;

namespace ProyectoFinal4To.Controllers;

public class DennysController : Controller
{
      public IActionResult Login()
    {
        return View("Login");
    }

    public IActionResult Registrarte(int IdUsuario)
    {
        ViewBag.IdUsuarioo = IdUsuario;
        return View("Registro");
    }
    public IActionResult GuardarUsuario(Usuario us)
    {
        BD.Registro(us);
        return RedirectToAction("Login");
    }
   public IActionResult IniciarSesion(string UserName, string Contraseña)
{
    Usuario usuario = BD.VerificarCredenciales(UserName, Contraseña);
        
    if (usuario != null)
    {
        ViewBag.InfoUsuario = usuario;
        
        return View("Bienvenida");
    }
    else
    {
        ViewBag.Error = "Nombre de usuario o contraseña incorrectos.";
        return View("Login");
    }
}

public IActionResult OlvideMiContraseña()
{
    return View("RecuperarContraseña");
}

[HttpPost]
public IActionResult RecuperarContraseña(string UserName)
{
    Usuario usuario = BD.ObtenerContraseñaPorUserName(UserName);

    if (usuario != null)
    {
        ViewBag.ContraseñaRecuperada = usuario.Contraseña;
    }
    else
    {
        ViewBag.ErrorRecuperación = "Nombre de usuario no encontrado.";
    }

    return View("RecuperarContraseña");
}


    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
