<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="API_REST.Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <head>
        <!-- CSS -->
        <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-
        TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
        crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.0.0.js" crossorigin="anonymous"></script>
        <!-- jQuery and JS bundle w/ Popper.js -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-IrFormularioCrear 
        ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container">
            <div class="row mt-3">
                <div class="col-12">
                    <form>
                        <div class="form-group">
                            <label sfor="exampleInputEmail1">Placa</label>
                            <input type="text" class="form-control" id="txtplaca" placeholder="">
                        </div>
                        <div class="form-group">
                            <label sfor="exampleInputEmail1">Marca</label>
                            <input type="text" class="form-control" id="txtmarca" placeholder="">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Modelo</label>
                            <input type="text" class="form-control" id="txtmodelo" placeholder="">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Año</label>
                            <input type="text" class="form-control" id="txtaño" placeholder="">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">cilindraje</label>
                            <input type="text" class="form-control" id="txtcilindraje" placeholder="">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Traspaso</label>
                            <input type="radio" class="" id="txttraspaso" name="traspaso" value="TRUE" checked> SI
                            <input type="radio" class="" id="txttraspaso2" name="traspaso" value="FALSE"> NO
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Precio</label>
                            <input type="number" class="form-control" id="txtprecio" placeholder="">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Kilometraje</label>
                            <input type="number" class="form-control" id="txtkilometraje" placeholder="">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Fecha Ingreso</label>
                            <input type="date" class="form-control" id="txtfechaingreo" placeholder="">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">VgSoat</label>
                            <input type="date" class="form-control" id="txtvgsoat" placeholder="">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">VgTecno</label>
                            <input type="date" class="form-control" id="txtvgtecno" placeholder="">
                        </div>
                        <button type="button" class="btn btn-primary" onclick="GuardarVehiculo()">Guardar</button>
                        <button type="button" class="btn btn-warning" onclick="IrFormularioInicio()">Volver</button>
                    </form>
                </div>
            </div>
        </div>
        <script>

            // Editar
            let editar = false;

            window.onload = function () {
                let placa = $.urlParam('placa');
                console.log(placa);
                if (placa != null) {
                    editar = true;
                    $("#txtplaca").val(placa);
                    PintarVehiculo(placa);
                }
             };

            // Por id
            function PintarVehiculo(Placa) {
                let traspasoVal = document.querySelector('input[name="traspaso"]:checked')
                $.get("https://localhost:44384/api/Vehiculo/" + Placa)
                    .done(function (response) {
                            $("#txtplaca").val(response[0].Placa),
                            $("#txtmarca").val(response[0].Marca),
                            $("#txtmodelo").val(response[0].Modelo),
                            $("#txtaño").val(response[0].Año),
                            $("#txtcilindraje").val(response[0].Cilindraje),
                            traspasoVal.value = response[0].Traspaso,
                            $("#txtprecio").val(response[0].Precio),
                            $("#txtkilometraje").val(response[0].Kilometraje),
                            $("#txtfechaingreso").val(response[0].FechaIngreso),
                            $("#txtvgsoat").val(response[0].VgSoat),
                            $("#txtvgtecno").val(response[0].VgTecno)
                    });
            }

            $.urlParam = function (name) {
                let results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
                if (results == null) {
                    return null;
                }
                return decodeURI(results[1]) || 0;
            }

            // Guardar Vehiculo
            function GuardarVehiculo() {
                let traspasoVal = document.querySelector('input[name="traspaso"]:checked');
                if (editar) {
                    var data = {
                        Placa: $("#txtplaca").val(),
                        Marca: $("#txtmarca").val(),
                        Modelo: $("#txtmodelo").val(),
                        Año: $("#txtaño").val(),
                        Cilindraje: $("#txtcilindraje").val(),
                        Traspaso: traspasoVal.value,
                        Precio: $("#txtprecio").val(),
                        Kilometraje: $("#txtkilometraje").val(),
                        FechaIngreso: $("#txtfechaingreso").val(),
                        VgSoat: $("#txtvgsoat").val(),
                        VgTecno: $("#txtvgtecno").val()
                    }
                    $.ajax({
                        method: "PUT",
                        url: "https://localhost:44384/api/Vehiculo",
                        contentType: 'application/json',
                        data: JSON.stringify(data), // access in body
                    })
                        .done(function (response) {
                            console.log(response);
                            if (response) {
                                alert("Se guardaron los cambios");
                                window.location = "Index.aspx";
                            } else {
                                alert("Error al Modificar")
                            }
                        });
                } else {
                    var data = {
                        Placa: $("#txtplaca").val(),
                        Marca: $("#txtmarca").val(),
                        Modelo: $("#txtmodelo").val(),
                        Año: $("#txtaño").val(),
                        Cilindraje: $("#txtcilindraje").val(),
                        Traspaso: traspasoVal.value,
                        Precio: $("#txtprecio").val(),
                        Kilometraje: $("#txtkilometraje").val(),
                        FechaIngreso: $("#txtfechaingreso").val(),
                        VgSoat: $("#txtvgsoat").val(),
                        VgTecno: $("#txtvgtecno").val()
                    }
                    $.post("https://localhost:44384/api/Vehiculo", data)
                        .done(function (response) {
                            console.log(response);
                            if (response) {
                                alert("Vehiculo Creado");
                                window.location = "Index.aspx";
                            } else {
                                alert("Error al crear");
                            }
                        });
                }
            }

            // Ruta
            function IrFormularioInicio() {
                window.location = "Index.aspx";
            }
        </script>
    </body>
</asp:Content>
