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

    public IActionResult Registrarte(int IdUsuario)
    {
        ViewBag.IdUsuarioo = IdUsuario;
        return View("Registro");
    }
    public IActionResult GuardarCliente(Cliente cliente)
    {
        BD.Registro(cliente);
        return RedirectToAction("Login");
    }

    public IActionResult GuardarReseña(Reseña reseña)
    {
         BD.AgregarReseña(reseña);
        return View("confirmacionReseña");
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
    public static void AgregarReserva(Reserva reserva)
    {
        using(SqlConnection db = new SqlConnection(connectionString))
        {
            string sp = "sp_AgregarReserva";
            db.Execute(sp, new{@IdRestaurante = reserva.IdRestaurante, @IdCliente = reserva.IdCliente, @FechaReserva = reserva.FechaReserva, @Hora = reserva.HoraReserva, @Cantidad = reserva.CantidadPersonas}, 
            commandType: System.Data.CommandType.StoredProcedure);
        }
    }

public IActionResult ObtenerReseñas(int idResto)
{
    ViewBag.Reseñas = BD.GetListaReseñasDeUnRestaurante(idResto);
    return View("VerReseñas");
}



    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}




