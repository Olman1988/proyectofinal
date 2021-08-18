<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Matriculas.aspx.cs" Inherits="Registro.Matriculas" %>

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
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
       <div class="collapse navbar-collapse" id="navbarColor01">
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
        <div class="col-lg-8 col-lg-11 mx-auto">
            <h3 class="mt-5" style="text-align:center;margin:30px 0px;padding:10px 30px; color:#00a2b1">Matrículas</h3 >
                <div class="col-lg-12 row">
                    <div class="col-lg-6" style="background-color:#00ffef; border-radius:10px; box-shadow:2px 2px 2px gray;">
                        <div class="form-group justify-content-center">
                            <label for="identificacion" style="font-size:15px">ID Estudiante: </label>
                            <input type="text" id="txt_id_estudiante" style="width:70%" runat="server" class="form-control" name="identificacion"  value="" placeholder="Ingrese la identificación o DNI" />
                           <asp:Button ID="Button1" runat="server" CssClass="btn btn-success" Text="Buscar" OnClick="Button1_Click1" />
                        </div>
                        
                        <div class="form-group justify-content-center mx-auto" style="padding:10px;background:rgba(0, 189, 214, 0.7); color:white;">
                           <label for="identificacion" style="font-size:15px">Id: </label>
                        <asp:Label ID="id_consulta" runat="server" Text=""></asp:Label>
                            <label for="identificacion" style="font-size:15px">Identificación: </label>
                            <asp:Label ID="lbl_dni" runat="server" Text=""></asp:Label>
                            <label for="nombre" style="font-size:15px">Nombre: </label>
                            <asp:Label ID="name_e" runat="server" Text=""></asp:Label>

                            <asp:Label ID="apellido_e" runat="server" Text=""></asp:Label>
                            
                        </div>
                        <div class="container form-group mx-auto justify-content-center text-center"><asp:Label ID="lblmensajes" Visible="false" CssClass="mx-auto correcto" runat="server" Text=""></asp:Label></div>
                        <div class="form-group justify-content-center mx-auto" style="font-size:15px; margin-top:50px;">
                            <label for="identificacion" style="font-size:15px; text-align:center">Cursos: </label>
                             
                            
                            <asp:GridView ID="GridViewCurso" CssClass="table table table-hover" 
                BorderColor="#33CCFF" runat="server" OnRowDeleting="rowdeleting" AutoGenerateColumns="False" DataKeyNames="id">
                                <Columns>
                    <asp:TemplateField HeaderText="Código">
                        <ItemTemplate> 
                        <asp:Label ID="Label2" runat="server" Text='<% #Bind("id") %>'></asp:Label>
                            </ItemTemplate> 
                        
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Curso:">
                        <ItemTemplate> 
                        <asp:Label ID="Label9" runat="server" Text='<% #Bind("curso") %>'></asp:Label>
                            </ItemTemplate> 
                        
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre Estudiante">
                        <ItemTemplate> 
                        <asp:Label ID="Label3" runat="server" Text='<% #Bind("nombre") %>'></asp:Label>
                            </ItemTemplate> 
                        
                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Estado">
                        <ItemTemplate> 
                        <asp:Label ID="LabelEstado" runat="server" Text='<% #Bind("estado") %>'></asp:Label>
                            </ItemTemplate> 
                        
                    </asp:TemplateField>
                   
                    
                    <asp:CommandField  HeaderText="Acciones" ButtonType="Link" ShowDeleteButton="true" UpdateImageUrl="image/editar.png" />
                </Columns>

                            </asp:GridView>
                            
                            <div id="agregar_curso" class="" style="">
                                <label for="identificacion" style="font-size:15px; text-align:center">Nombre del Curso: </label>
                                <asp:DropDownList ID="ListaCursos" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="name" CssClass="form-select" BackColor="#66FFFF" ForeColor="#999999" Font-Size="20px" Height="35px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EstudiantesConnectionString %>" SelectCommand="SELECT [id], [name], [price] FROM [tbl_cursos]"></asp:SqlDataSource>
                                <asp:Button ID="btn_matricular" runat="server" Text="Matricular" CssClass="btn btn-success" OnClick="btn_matricular_Click"/>
                            </div>
                            <label for="identificacion" id="" style="font-size:15px"> 

                            </label>
                        </div>
                       </div>
                        <div class="col-lg-6" style="">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/image/student.jpg" />
                        </div>
                    
                 </div>
        </div>
    </form>
</body>
</html>
