using APP_Api.Models;
using Ejemplo_Api2.Data;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace APP_Api.Data
{
    public class VehiculoData
    {
        public static bool registrarUsuario(Vehiculo oVehiculo)
        {
            ConexionBD objEst = new ConexionBD();
            string sentencia;
            sentencia = $"EXECUTE usp_registrar '{oVehiculo.Placa}','{oVehiculo.Marca}','{oVehiculo.Modelo}','{oVehiculo.Año}','{oVehiculo.Cilindraje}',{oVehiculo.Precio},{oVehiculo.Kilometraje},'{oVehiculo.VgSoat}','{oVehiculo.VgTecno}";

            if (!objEst.EjecutarSentencia(sentencia, false))
            {
                objEst = null;
                return false;
            }
            else
            {
                objEst = null;
                return true;
            }
        }

        public static bool actualizarUsuario(Vehiculo oVehiculo)
        {
            ConexionBD objEst = new ConexionBD();
            string sentencia;
            sentencia = $"EXECUTE USP_ACTUALIZAR '{oVehiculo.Placa}','{oVehiculo.Marca}','{oVehiculo.Modelo}','{oVehiculo.Año}','{oVehiculo.Cilindraje}',{oVehiculo.Precio},{oVehiculo.Kilometraje},'{oVehiculo.FechaIngreso}','{oVehiculo.VgSoat}','{oVehiculo.VgTecno}'";
            if (!objEst.EjecutarSentencia(sentencia, false))
            {
                objEst = null;
                return false;
            }
            else
            {
                objEst = null;
                return true;
            }
        }

        public static bool eliminarUsuario(string placa)
        {
            ConexionBD objEst = new ConexionBD();
            string sentencia;
            sentencia = $"EXECUTE USP_ELIMINAR '{placa}'";
            if (!objEst.EjecutarSentencia(sentencia, false))
            {
                objEst = null;
                return false;
            }
            else
            {
                objEst = null;
                return true;
            }
        }
        public static List<Vehiculo> Listar()
        {
            List<Vehiculo> oListaUsuario = new List<Vehiculo>();
            ConexionBD objEst = new ConexionBD();
            string sentencia;
            sentencia = "EXECUTE USP_LISTAR";
            if (objEst.Consultar(sentencia, false))
            {
                SqlDataReader dr = objEst.Reader;
                while (dr.Read())
                {
                    oListaUsuario.Add(new Vehiculo()
                    {
                        Marca = dr["Marca"].ToString(),
                        Modelo = dr["Modelo"].ToString(),
                        Año = dr["Año"].ToString(),
                        Cilindraje = dr["Modelo"].ToString(),
                        Kilometraje = float.Parse(dr["Kilometraje"].ToString()),
                        Precio = float.Parse(dr["Precio"].ToString()),
                        FechaIngreso = Convert.ToDateTime(dr["FechaIngreso"].ToString()),
                        VgSoat = Convert.ToDateTime(dr["VgSoat"].ToString()),
                        VgTecno = Convert.ToDateTime(dr["VgTecno"].ToString())
                    });
                }
                return oListaUsuario;
            }
            else
            {
                return oListaUsuario;
            }
        }


        public static List<Vehiculo> Obtener(string placa)
        {
            List<Vehiculo> oListaUsuario = new List<Vehiculo>();
            ConexionBD objEst = new ConexionBD();
            string sentencia;
            sentencia = $"EXECUTE usp_obtener '{placa}'";
            if (objEst.Consultar(sentencia, false))
            {
                SqlDataReader dr = objEst.Reader;
                while (dr.Read())
                {
                    oListaUsuario.Add(new Vehiculo()
                    {
                        Placa = dr["Placa"].ToString(),
                        Modelo = dr["Modelo"].ToString(),
                        Marca = dr["Marca"].ToString(),
                        Año = dr["Año"].ToString(),
                        Precio = float.Parse(dr["Precio"].ToString()),
                        Kilometraje = float.Parse(dr["Kilometraje"].ToString()),
                        FechaIngreso = Convert.ToDateTime(dr["FechaIngreso"].ToString()),
                        VgSoat = Convert.ToDateTime(dr["VgSoat"].ToString()),
                        VgTecno = Convert.ToDateTime(dr["VgTecno"].ToString())
                    });
                }
                return oListaUsuario;
            }
            else
            {
                return oListaUsuario;
            }
        }

    }

}