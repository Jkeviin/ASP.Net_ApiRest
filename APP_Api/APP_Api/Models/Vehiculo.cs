using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace APP_Api.Models
{
    public class Vehiculo
    {
        public string Placa { get; set; }
        public string Marca { get; set; }
        public string Modelo { get; set; }
        public string Año { get; set; }
        public string Cilindraje { get; set; }
        public string Traspaso { get; set;  }
        public float Precio { get; set; }
        public float Kilometraje { get; set; }
        public DateTime FechaIngreso { get; set; }
        public DateTime VgSoat {  get; set; }
        public DateTime VgTecno { get; set; }
    }
}