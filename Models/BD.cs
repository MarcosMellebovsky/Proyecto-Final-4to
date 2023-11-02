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
}