using System.Data.SqlClient;
using Dapper;
public static class BD
{
    private static string connectionString = @"Server=localhost;DataBase=ReservaRestaurantes;Trusted_Connection=True;";
    public static void AgregarMenu(Menu men)
    {
        using(SqlConnection db = new SqlConnection(connectionString))
        {
            string sp = "sp_AgregarMenu";
            db.Execute(sp, new{@IdRestaurante = men.IdRestaurante, @Nombree = men.Nombre, @DescripcionMenu = men.Descripcion, @Precioo = men.Precio}, 
            commandType: System.Data.CommandType.StoredProcedure);
        }
    }

    public static void AgregarRestaurante(Restaurante resto)
    {
        using(SqlConnection db = new SqlConnection(connectionString))
        {
            string sp = "sp_AgregarRestaurante";
            db.Execute(sp, new{@NomRestaurante = resto.Nombre, @Direccionn = resto.Direccion, @HoraApertura = resto.HorarioApertura, @HoraClausura = resto.HorarioClausura, @FechaFunda = resto.FechaFundacion, @Img = resto.Imagen, @Descripcionn = resto.Descripcion}, 
            commandType: System.Data.CommandType.StoredProcedure);
        }
    }
    public static void AgregarReseña(int IdCliente, int IdRestaurante, string Comentario, int Valoracion)
    {
        using(SqlConnection db = new SqlConnection(connectionString))
        {
            string sp = "sp_AgregarReseña";
            db.Execute(sp, new{@IdResto = IdRestaurante, @IdClient = IdCliente, @Comment = Comentario, @Valoracion = Valoracion}, 
            commandType: System.Data.CommandType.StoredProcedure);
        }
    }
    public static List<Restaurante> GetListaRestaurantes()
    {
        List<Restaurante> ListaRestaurantes = null;
        using(SqlConnection db = new SqlConnection(connectionString))
        {
            string sp = "sp_GetListaRestaurantes";
            ListaRestaurantes = db.Query<Restaurante>(sp, commandType: System.Data.CommandType.StoredProcedure).ToList();
        }
        return ListaRestaurantes;
    }
      public static void AgregarReserva(int IdRestaurante, int IdCliente, DateTime FechaReserva, string HoraReserva, int CantidadPersonas)
    {
        using(SqlConnection db = new SqlConnection(connectionString))
        {
            string sp = "sp_AgregarReserva";
            db.Execute(sp, new{@IdRestaurante = IdRestaurante, @IdCliente = IdCliente, @FechaReserva = FechaReserva, @Hora = HoraReserva, @Cantidad = CantidadPersonas}, 
            commandType: System.Data.CommandType.StoredProcedure);
        }
    }
    public static Restaurante GetInfoRestaurante(int idRestaurante)
    {
        Restaurante Restaurante = new Restaurante();
        using(SqlConnection db = new SqlConnection(connectionString))
        {
            string sp = "sp_GetInfoRestaurante";
            Restaurante = db.QueryFirstOrDefault<Restaurante>(sp,new{@IdRestaurante = idRestaurante}, 
            commandType: System.Data.CommandType.StoredProcedure);
        }
        return Restaurante;
    }
    public static Menu GetInfoMenu(int idRestaurante)
    {
        Menu Menu = new Menu();
        using(SqlConnection db = new SqlConnection(connectionString))
        {
            string sp = "sp_GetInfoMenu";
            Menu = db.QueryFirstOrDefault<Menu>(sp,new{@IdRestaurante = idRestaurante}, 
            commandType: System.Data.CommandType.StoredProcedure);
        }
        return Menu;
    }
    public static List<Reseña> GetListaReseñasDeUnRestaurante(int idRestaurante)
    {
        List<Reseña> ListaReseñas = null;
        using(SqlConnection db = new SqlConnection(connectionString))
        {
            string sp = "sp_GetListaReseñasDeUnRestaurante";
            ListaReseñas = db.Query<Reseña>(sp,new{@IdRestaurante = idRestaurante}, 
            commandType: System.Data.CommandType.StoredProcedure).ToList();
        }
        return ListaReseñas;
    }
    public static void Registro(Cliente cliente)
    {
        using(SqlConnection db = new SqlConnection(connectionString))
        {
            string sp = "sp_Registro";
            db.Execute(sp, new{@Nombre = cliente.Nombre, @Apellido = cliente.Apellido,  @Email = cliente.Email,@Contraseña = cliente.Contraseña}, 
            commandType: System.Data.CommandType.StoredProcedure);
        }
    }
    public static Cliente VerificarCredenciales(string Email, string Contraseña)
    {
            string sp = "sp_VerificarCredenciales";
            using (SqlConnection db = new SqlConnection(connectionString))
        {
            Cliente usuario = db.QueryFirstOrDefault<Cliente>(sp, new {@Email = Email}, 
            commandType: System.Data.CommandType.StoredProcedure);

            if (usuario != null && usuario.Contraseña == Contraseña)
            {
                return usuario; 
            }
            else
            {
                return null;
            }
        }
    }
    public static Cliente ObtenerContraseñaPorEmail(string email)
    {
        string sp = "sp_VerificarCredenciales";
        using (SqlConnection db = new SqlConnection(connectionString))
        {
            return db.QueryFirstOrDefault<Cliente>(sp, new {@Email = email},
            commandType: System.Data.CommandType.StoredProcedure);
        }
    }

   
}