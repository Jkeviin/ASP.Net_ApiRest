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
        integrity="sha384-
        ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container">
            <div class="row mt-3">
                <div class="col-12">
                    <form>
                        <input type="hidden" id="txtidusuario" />
                        <div class="form-group">
                            <label for="exampleInputEmail1">Documento Identidad</label>
                            <input type="text" class="form-control" id="txtdocumento" placeholder="">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Nombres</label>
                            <input type="text" class="form-control" id="txtnombres" placeholder="">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Telefono</label>
                            <input type="text" class="form-control" id="txttelefono" placeholder="">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Correo</label>
                            <input type="text" class="form-control" id="txtcorreo" placeholder="">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Ciudad</label>
                            <input type="text" class="form-control" id="txtciudad" placeholder="">
                        </div>
                        <button type="button" class="btn btn-primary" onclick="GuardarUsuario()">Guardar</button>
                        <button type="button" class="btn btn-warning" onclick="IrFormularioInicio()">Volver</button>
                    </form>
                </div>
            </div>
        </div>
        <script>

            // Editar
            let editar = false;

            window.onload = function () {
                let id = $.urlParam('id');
                console.log(id);
                if (id != null) {
                    editar = true;
                    $("#txtidusuario").val(id);
                    PintarUsuario(id);
                }
             };

            // Por id
            function PintarUsuario(idUsuario) {
                $.get("http://localhost:58683/api/Usuario/" + idUsuario)
                    .done(function (response) {
                        console.log(response);
                        $("#txtdocumento").val(response.DocumentoIdentidad),
                            $("#txtnombres").val(response.Nombres),
                            $("#txttelefono").val(response.Telefono),
                            $("#txtcorreo").val(response.Correo),
                            $("#txtciudad").val(response.Ciudad)
                    });
            }

            $.urlParam = function (name) {
                let results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
                if (results == null) {
                    return null;
                }
                return decodeURI(results[1]) || 0;
            }

            // Guardar Usuario
            function GuardarUsuario() {
                if (editar) {
                    var data = {

                        IdUsuario: $("#txtidusuario").val(),
                        DocumentoIdentidad: $("#txtdocumento").val(),
                        Nombres: $("#txtnombres").val(),
                        Telefono: $("#txttelefono").val(),
                        Correo: $("#txtcorreo").val(),
                        Ciudad: $("#txtciudad").val()
                    }
                    $.ajax({
                        method: "PUT",
                        url: "http://localhost:58683/api/Usuario",
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
                        DocumentoIdentidad: $("#txtdocumento").val(),
                        Nombres: $("#txtnombres").val(),
                        Telefono: $("#txttelefono").val(),
                        Correo: $("#txtcorreo").val(),
                        Ciudad: $("#txtciudad").val()
                    }
                    $.post("http://localhost:58683/api/Usuario", data)
                        .done(function (response) {
                            console.log(response);
                            if (response) {
                                alert("Usuario Creado");
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
