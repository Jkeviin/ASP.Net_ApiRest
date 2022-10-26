using APP_Api.Data;
using APP_Api.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace APP_Api.Controllers
{
    public class VehiculoController : ApiController
    {
        // GET api/<controller>
        public List<Vehiculo> Get()
        {
            return VehiculoData.Listar();
        }
        // GET api/<controller>/5
        public List<Vehiculo> Get(string placa)
        {
            return VehiculoData.Obtener(placa);
        }
        // POST api/<controller>
        public bool Post([FromBody] Vehiculo oVehiculo)
        {
            return VehiculoData.registrarUsuario(oVehiculo);
        }
        // PUT api/<controller>/5
        public bool Put([FromBody] Vehiculo oVehiculo)
        {
            return VehiculoData.actualizarUsuario(oVehiculo);
        }
        // DELETE api/<controller>/5
        public bool Delete(string placa)
        {
            return VehiculoData.eliminarUsuario(placa);
        }
    }
}