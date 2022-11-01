<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="API_REST.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <head>
    <!-- CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.0.0.js"crossorigin="anonymous"></script>
    <!-- jQuery and JS bundle w/ Popper.js -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container">
            <div class="row mb-3 mt-3">
                <div class="col-4">
                    <button type="button" class="btn btn-primary" id="IrFormulario"">Crear Nuevo</button>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                            <th scope="col">Placa</th>
                            <th scope="col">Marca</th>
                            <th scope="col">Modelo</th>
                            <th scope="col">Año</th>
                            <th scope="col">Cilindraje</th>
                            <th scope="col">Traspaso</th>
                            <th scope="col">Precio</th>
                            <th scope="col">Kilometraje</th>
                            <th scope="col">FechaIngreso</th>
                            <th scope="col">VgSoat</th>
                            <th scope="col">VgTecno</th>
                            <th></th>
                            </tr>
                        </thead>
                    <tbody>
                    </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script>

            document.getElementById("IrFormulario").addEventListener("click", IrFormularioCrear);

            //Onload
            window.onload = function () {
                listar();
            };

            //Listar
            function listar() {
                $(".table tbody").html("");
                $.get("https://localhost:44384/api/Vehiculo")
                    .done(function (response) {
                        console.log(response);
                        $.each(response, function (id, fila) {
                            $("<tr>").append(
                                $("<td>").text(fila.Placa),
                                $("<td>").text(fila.Marca),
                                $("<td>").text(fila.Modelo),
                                $("<td>").text(fila.Año),
                                $("<td>").text(fila.Cilindraje),
                                $("<td>").text(fila.Traspaso),
                                $("<td>").text(fila.Precio),
                                $("<td>").text(fila.Kilometraje),
                                $("<td>").text(fila.FechaIngreso),
                                $("<td>").text(fila.VgSoat),
                                $("<td>").text(fila.VgTecno),
                                $("<td>").append(
                                    $("<button>").data("placa", fila.Placa).addClass("btn btn-success btn-sm mr-1 editar").text("Editar ").attr({ "type": "button" }),
                                    $("<button>").data("placa", fila.Placa).addClass("btn btn-danger btn-sm eliminar").text("Eliminar").attr({ "type": "button" })
                                )
                            ).appendTo(".table");
                        });
                    });
            }

            // Evento Editar
            $(document).on('click', '.editar', function () {

                console.log($(this).data("placa"));
                window.location = "Registro.aspx?id=" + $(this).data("placa");

            });

            // Evento Eliminar
            $(document).on('click', '.eliminar', function () {
                console.log($(this).data("placa"));
                $.ajax({
                    method: "DELETE",
                    url: "https://localhost:44384/api/Vehiculo/" + $(this).data("placa")
                })
                    .done(function (response) {
                        console.log(response);
                        if (response) {
                            listar();
                        } else {
                            alert("Error al eliminar")
                        }
                    });
            });

            // Ruta
            function IrFormularioCrear() {

                window.location = "Registro.aspx";
            }

        </script>
    </body>
</asp:Content>