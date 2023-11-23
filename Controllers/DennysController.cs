using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using ProyectoFinal4To.Models;

namespace ProyectoFinal4To.Controllers;

public class DennysController : Controller
{
     private readonly ILogger<DennysController> _logger;

    public DennysController(ILogger<DennysController> logger)
    {
        _logger = logger;
    }
      public IActionResult Login()
    {
        return View("Login");
    }
      public IActionResult Ayuda()
    {
        return View("Ayuda");
    }
    public IActionResult Bienvenida()
    {
        return View("Bienvenida");
    }

    public IActionResult Registrarte(int IdUsuario)
    {
        ViewBag.IdUsuarioo = IdUsuario;
        return View("Registro");
    }

    public bool GuardarReseñaAjax(int IdCliente, int IdRestaurante, string Comentario, int Valoracion)
    {
        BD.AgregarReseña(IdCliente, IdRestaurante, Comentario, Valoracion);
        return true;
    }
    
    public void GuardarReservaAjax(int IdCliente, int IdRestaurante, DateTime fechaReserva, int personasReserva, string horarioReserva)
    {
        BD.AgregarReserva(IdRestaurante, IdCliente, fechaReserva, horarioReserva, personasReserva);
    }

   public IActionResult IniciarSesion(string Email, string Contraseña)
{
    Cliente cliente = BD.VerificarCredenciales(Email, Contraseña);
        
    if (cliente != null)
    {
        ViewBag.InfoCliente = cliente;
        ViewBag.ListaRestaurantes = BD.GetListaRestaurantes();
        return View("Bienvenida");
    }
    else
    {
        ViewBag.Error = "Email o contraseña incorrectos.";
        return View("Login");
    }
}

public IActionResult OlvideMiContraseña()
{
    return View("RecuperarContraseña");
}

[HttpPost]
public IActionResult RecuperarContraseña(string email)
{
    Cliente cliente = BD.ObtenerContraseñaPorEmail(email);

    if (cliente != null)
    {
        ViewBag.ContraseñaRecuperada = cliente.Contraseña;
    }
    else
    {
        ViewBag.ErrorRecuperación = "Email no encontrado.";
    }

    return View("RecuperarContraseña");
}
public Restaurante ObtenerDetallesRestaurante(int id)
    {
       Restaurante UnRestaurante = BD.GetInfoRestaurante(id);
       return UnRestaurante;
    }
public Menu ObtenerDetallesMenu(int id)
    {
       Menu UnMenu = BD.GetInfoMenu(id);
       return UnMenu;
    }
  

public IActionResult ObtenerReseñas(int idResto)
{
    ViewBag.ListaReseñas = BD.GetListaReseñasDeUnRestaurante(idResto);
    return View("VerReseñas");
}

public IActionResult AgregarRestaurante()
{
    return View("AgregarRestaurante");
}

public IActionResult GuardarRestaurante(Restaurante resto)
{
    BD.AgregarRestaurante(resto);
    return View("Bienvenida");
}
public IActionResult EliminarRestaurante(int idResto)
{
    BD.EliminarRestaurante(idResto);
    return View("Bienvenida");
}







    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}




