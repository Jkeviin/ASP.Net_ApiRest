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
        public static bool registrarVehiculo(Vehiculo oVehiculo)
        {
            ConexionBD objEst = new ConexionBD();
            string sentencia;
            string vgSoat = oVehiculo.VgSoat.ToString("yyyy-MM-dd");
            string VgTecno = oVehiculo.VgTecno.ToString("yyyy-MM-dd");
            sentencia = $"EXECUTE USP_REGISTRAR '{oVehiculo.Placa}','{oVehiculo.Marca}','{oVehiculo.Modelo}','{oVehiculo.Año}','{oVehiculo.Cilindraje}','{oVehiculo.Traspaso}',{oVehiculo.Precio},{oVehiculo.Kilometraje},'{prueba}','{prueba2}'";
            //sentencia = "EXECUTE usp_registrar "+"'{oVehiculo.Placa}"+"','"+ "{oVehiculo.Marca}" + "','" + "{oVehiculo.Modelo}" + "','" + "{oVehiculo.Año}" + "','" + "{oVehiculo.Cilindraje}" + "','" + "{oVehiculo.Traspaso}" + "'," + "{oVehiculo.Precio}" + "," + "{oVehiculo.Kilometraje}" + ",'" + "{oVehiculo.VgSoat}" + "','" + "{oVehiculo.VgTecno}'";
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

        public static bool actualizarVehiculo(Vehiculo oVehiculo)
        {
            ConexionBD objEst = new ConexionBD();
            string sentencia;
            sentencia = $"EXECUTE USP_ACTUALIZAR '{oVehiculo.Placa}','{oVehiculo.Marca}','{oVehiculo.Modelo}','{oVehiculo.Año}','{oVehiculo.Cilindraje}','{oVehiculo.Traspaso}',{oVehiculo.Precio},{oVehiculo.Kilometraje},'{oVehiculo.FechaIngreso}','{oVehiculo.VgSoat}','{oVehiculo.VgTecno}'";
            
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

        public static bool eliminarVehiculo(string placa)
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
            List<Vehiculo> oListaVehiculo = new List<Vehiculo>();
            ConexionBD objEst = new ConexionBD();
            string sentencia;
            sentencia = "EXECUTE USP_LISTAR";
            if (objEst.Consultar(sentencia, false))
            {
                SqlDataReader dr = objEst.Reader;
                while (dr.Read())
                {
                    oListaVehiculo.Add(new Vehiculo()
                    {
                        Placa = dr["Placa"].ToString(),
                        Marca = dr["Marca"].ToString(),
                        Modelo = dr["Modelo"].ToString(),
                        Año = dr["Año"].ToString(),
                        Cilindraje = dr["Cilindraje"].ToString(),
                        Kilometraje = float.Parse(dr["Kilometraje"].ToString()),
                        Traspaso = dr["Traspaso"].ToString(),
                        Precio = float.Parse(dr["Precio"].ToString()),
                        FechaIngreso = Convert.ToDateTime(dr["FechaIngreso"].ToString()),
                        VgSoat = Convert.ToDateTime(dr["VgSoat"].ToString()),
                        VgTecno = Convert.ToDateTime(dr["VgTecno"].ToString())
                    });
                }
                return oListaVehiculo;
            }
            else
            {
                return oListaVehiculo;
            }
        }


        public static List<Vehiculo> Obtener(string placa)
        {
            List<Vehiculo> oListaVehiculo = new List<Vehiculo>();
            ConexionBD objEst = new ConexionBD();
            string sentencia;
            sentencia = $"EXECUTE USP_OBTENER '{placa}'";
            if (objEst.Consultar(sentencia, false))
            {
                SqlDataReader dr = objEst.Reader;
                while (dr.Read())
                {
                    oListaVehiculo.Add(new Vehiculo()
                    {
                        Placa = dr["Placa"].ToString(),
                        Marca = dr["Marca"].ToString(),
                        Modelo = dr["Modelo"].ToString(),
                        Año = dr["Año"].ToString(),
                        Cilindraje = dr["Cilindraje"].ToString(),
                        Kilometraje = float.Parse(dr["Kilometraje"].ToString()),
                        Traspaso = dr["Traspaso"].ToString(),
                        Precio = float.Parse(dr["Precio"].ToString()),
                        FechaIngreso = Convert.ToDateTime(dr["FechaIngreso"].ToString()),
                        VgSoat = Convert.ToDateTime(dr["VgSoat"].ToString()),
                        VgTecno = Convert.ToDateTime(dr["VgTecno"].ToString())
                    });
                }
                return oListaVehiculo;
            }
            else
            {
                return oListaVehiculo;
            }
        }

    }

}