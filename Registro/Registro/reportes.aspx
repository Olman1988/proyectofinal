<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reportes.aspx.cs" Inherits="Registro.reportes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registro deEstudiantes</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
  <!--BOOSTRAP-->
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"  crossorigin="anonymous"/>
    <!--ANIMACIONES-->
   <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet"/>
 <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
   <style>
       .ok {
       padding:20px;
       margin: 10px 0px;
       margin-bottom:50px;
       background: rgba(103, 255, 138, 0.9);
       color:white;
       padding-bottom:30px;
       min-width:300px;
       border-radius:10px;
       }
       .error {
     
       padding:20px;
       margin: 10px 0px;
       margin-bottom:50px;
       background: rgba(252, 58, 57, 0.7);
       color:white;
       padding-bottom:30px;
       min-width:300px;
       border-radius:10px;
       }
       .lab {
           
           font-weight:500;
           font-family:Impact;
           letter-spacing:1.5px;
       }
       .div_agregar {
          
       transition: all 0.5s ease;
       height:0px;
       overflow:hidden;
      border-radius: 10px;
      box-shadow: 2px 2px 8px 1px gray;
     padding:0px;
     margin-bottom:50px;
       }

           .div_agregar div label {
           margin-top:10px;
           }
       .nav-item {
       margin-left:30px;
       
       }
       .nav-item a {
       transition: all 0.5s ease;
       /*padding-left:100px;*/
       }
       .nav-item:hover a {
       background-color:#0314da;
       border-radius:20px;
       transform:scale(1.2);
       }
   </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Registro Estudiantes</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
       <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav me-auto">
        <li class="nav-item active">
          <a class="nav-link" href="./Default.aspx">Estudiantes
            
          </a>
        </li>
          <li class="nav-item active">
          <a class="nav-link" href="./Matriculas.aspx">Matrículas
            
          </a>
        </li>
          
          
           
          <li class="nav-item active">
          <a class="nav-link" href="./pagos.aspx">Pagos
            
          </a>
        </li>
          <li class="nav-item active">
          <a class="nav-link" href="./cursos.aspx">Cursos
            
          </a>
        </li>
          <li class="nav-item active">
          <a class="nav-link" href="./reportes.aspx">Reportes
            
          </a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="./index.aspx?action=CerrarSesion">Cerrar Sesión
            
          </a>
        </li>

        
      </ul>
           </div>
    
    </div>
  
</nav>
    <form id="form1" runat="server">
        <div class="container col-lg-9 col-md-10 mt-5">
            <asp:Label ID="titulos" runat="server" CssClass="text-center mx-auto mb-5 mt-3" Text="Estudiantes" ForeColor="#009999" Font-Size="X-Large"></asp:Label>
            <div class="form-group">
                  <asp:DropDownList ID="listaReportes" runat="server"  AutoPostBack="True" OnSelectedIndexChanged="Unnamed1_SelectedIndexChanged">
                        
                      <asp:ListItem>Estudiantes</asp:ListItem>
                            <asp:ListItem>Matrículas</asp:ListItem>
                        <asp:ListItem>Pagos</asp:ListItem>
                        <asp:ListItem>Cursos</asp:ListItem>
                      <asp:ListItem>Usuarios</asp:ListItem>

                    </asp:DropDownList>
            </div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="True" CssClass="table-bordered table-primary col-lg-12" DataKeyNames="id" DataSourceID="SqlDataSource1">
                <Columns>
                  
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EstudiantesConnectionString %>" SelectCommand="SELECT id, name AS Nombre, firstLastname AS Apellido1, secondLastname AS Apellido2, dni AS Identificación, age AS Edad, registerDate AS FechaRegistro FROM tbl_estudiantes"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EstudiantesConnectionString %>" SelectCommand="SELECT tp.id,  tp.monto AS Monto, tp.estado AS Estado, tp.tipoPago AS Tipo, te.name AS Estudiante, te.dni AS Identificación, tp.fecha AS Fecha from tbl_pagos tp INNER JOIN  tbl_estudiantes te ON tp.idestudiante=te.id"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:EstudiantesConnectionString %>" SelectCommand="SELECT id AS Id, name AS Nombre, description AS Descripción, price AS Precio FROM tbl_cursos"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:EstudiantesConnectionString %>" SelectCommand="SELECT tm.id, tc.name AS Curso, te.name AS Nombre, te.firstLastname AS Apellido, tm.estado AS Pago FROM tbl_matriculas_cursos AS tm INNER JOIN tbl_estudiantes AS te ON tm.idestudiante = te.id INNER JOIN tbl_cursos AS tc ON tm.idcurso = tc.id"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:EstudiantesConnectionString %>" SelectCommand="SELECT id AS Id, nombre AS Nombre, apellidos AS Apellidos, email AS Email, perfil AS Perfil FROM tbl_user"></asp:SqlDataSource>
            <div class="form-group">

            <asp:Button ID="Button1" CssClass="btn btn-info mt-4" runat="server" Text="Generar Reporte" OnClick="Button1_Click" />
        </div>
        </div>
        
    </form>
</body>
</html>
