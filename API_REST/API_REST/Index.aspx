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
                    <button type="button" class="btn btn-primary" onclick="IrFormularioCrear()">Crear Nuevo</button>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                            <th scope="col">#</th>
                            <th scope="col">Documento Identidad</th>
                            <th scope="col">Nombres</th>
                            <th scope="col">Telefono</th>
                            <th scope="col">Correo</th>
                            <th scope="col">Ciudad</th>
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

            //Onload
            window.onload = function () {
                listar();
            };

            //Listar
            function listar() {
                $(".table tbody").html("");
                $.get("http://localhost:58683/api/Usuario")
                    .done(function (response) {
                        console.log(response);
                        $.each(response, function (id, fila) {
                            $("<tr>").append(
                                $("<td>").text(fila.IdUsuario),
                                $("<td>").text(fila.DocumentoIdentidad),
                                $("<td>").text(fila.Nombres),
                                $("<td>").text(fila.Telefono),
                                $("<td>").text(fila.Correo),
                                $("<td>").text(fila.Ciudad),
                                $("<td>").append(
                                    $("<button>").data("id", fila.IdUsuario).addClass("btn btn-success btn-sm mr-1 editar").text("Editar ").attr({ "type": "button" }),
                                    $("<button>").data("id", fila.IdUsuario).addClass("btn btn-danger btn-sm eliminar").text("Eliminar").attr({ "type": "button" })
                                )
                            ).appendTo(".table");
                        });
                    });
            }

            // Evento Editar
            $(document).on('click', '.editar', function () {

                console.log($(this).data("id"));
                window.location = "Registro.aspx?id=" + $(this).data("id");

            });

            // Evento Eliminar
            $(document).on('click', '.eliminar', function () {
                console.log($(this).data("id"));
                $.ajax({
                    method: "DELETE",
                    url: "http://localhost:58683/api/Usuario/" + $(this).data("id")
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