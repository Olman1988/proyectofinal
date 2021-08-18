<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Registro.WebForm1"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registro de Estudiantes</title>
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
    
<body style="">
    
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

    <div class="container mx-auto col-lg-8 col-md-10 mt-5" >
        
 
     <form runat="server">
            <button type="button" style ='' class="btn btn-info" id="btn_agregar">Agregar+</button>         
             <asp:Label ID="lblmsj" runat="server" CssClass="lab" ForeColor="White" Visible="False"><asp:Button ID="Button2" runat="server" Text="Cerrar" CssClass="btn btn-danger" /></asp:Label>
             
        
     <div class="form-group">
     <div class="table-responsive">
       
            <asp:GridView ID="GridView2" runat="server" CssClass="table table table-hover mt-5" 
                BorderColor="#33CCFF"
                BorderStyle="Dotted" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" 
               
                AutoGenerateColumns="False" OnRowCancelingEdit="Rowcancel" OnRowDeleting="Rowdeleting" OnRowEditing="rowEditing" OnRowUpdating="rowUpdatingEvent" DataKeyNames="id">
               
                <Columns>
                    <asp:TemplateField HeaderText="id">
                        <ItemTemplate> 
                        <asp:Label ID="Label2" runat="server" Text='<% #Bind("id") %>'></asp:Label>
                            </ItemTemplate> 
                        
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre:">
                        <ItemTemplate> 
                        <asp:Label ID="Label9" runat="server" Text='<% #Bind("nombre") %>'></asp:Label>
                            </ItemTemplate> 
                        <EditItemTemplate>
                            <asp:TextBox ID="txtnameed" runat="server" Text='<% #Bind("nombre") %>' ></asp:TextBox>

                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Primer Apellido">
                        <ItemTemplate> 
                        <asp:Label ID="Label3" runat="server" Text='<% #Bind("PrimerApellido") %>'></asp:Label>
                            </ItemTemplate> 
                        <EditItemTemplate>
                            <asp:TextBox ID="txtflastnameed" runat="server" Text='<% #Bind("PrimerApellido") %>' ></asp:TextBox>

                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Segundo Apellido">
                        <ItemTemplate> 
                        <asp:Label ID="Label4" runat="server" Text='<% #Bind("SegundoApellido") %>'></asp:Label>
                            </ItemTemplate> 
                        <EditItemTemplate>
                            <asp:TextBox ID="txtsecondnameed" runat="server" Text='<% #Bind("SegundoApellido") %>' ></asp:TextBox>

                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Identificación">
                        <ItemTemplate> 
                        <asp:Label ID="Label5" runat="server" Text='<% #Bind("Identificación") %>'></asp:Label>
                            </ItemTemplate> 
                        <EditItemTemplate>
                            <asp:TextBox ID="txtdnied" runat="server" Text='<% #Bind("Identificación") %>' ></asp:TextBox>

                        </EditItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Edad">
                        <ItemTemplate> 
                        <asp:Label ID="Label6" runat="server" Text='<% #Bind("Edad") %>'></asp:Label>
                            </ItemTemplate> 
                        <EditItemTemplate>
                            <asp:TextBox ID="txtageed" runat="server" Text='<% #Bind("Edad") %>' ></asp:TextBox>

                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fecha de Registro">
                        <ItemTemplate> 
                        <asp:Label ID="Label7" runat="server" Text='<% #Bind("FechaRegistro") %>'></asp:Label>
                            </ItemTemplate> 
                        <EditItemTemplate>
                            <asp:TextBox ID="txtdateed" runat="server" Text='<% #Bind("FechaRegistro") %>' ></asp:TextBox>

                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField  HeaderText="Acciones" ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" UpdateImageUrl="image/editar.png" />
                </Columns>
            </asp:GridView>
        </div>
      

    </div>
                         
         <div  style="" id="div_agregar" class="div_agregar">
                                <div class="form-group"><h2 style="font-size:17px;color:#0094ff">Ingrese los datos solicitados</h2>
                                     <label for="name">Nombre: </label>
                                     <input type="text" id="txtname" runat="server" class="form-control" name="name"  pattern="[A-Za-z ]+" value="" placeholder="Ingrese el nombre del Estudiante" required="required" />
                                </div>
                                <div class="form-group">
                                     <label for="apellidos">Primer Apellido: </label>
                                        <input type="text" id="txtfirstLastname" runat="server" class="form-control" name="firstLastname"  pattern="[A-Za-z ]+" value="" placeholder="Ingrese el primer apellido" />
                                </div>
                <div class="form-group">
                                     <label for="secondLastname">Segundo Apellido: </label>
                                        <input type="text" id="txtsecondLastname" runat="server" class="form-control" name="secondApellido"  pattern="[A-Za-z ]+" value="" placeholder="Ingrese el segundo apellido" required="required" />
                                </div>
             
                        
                            <div class="form-group">
                            <label for="identificacion">Identificación: </label>
                            <input type="text" id="txtidentificacion" runat="server" class="form-control" name="identificacion"  value="" placeholder="Ingrese la identificación o DNI" required="required"/>
                        </div>
                            <div class="form-group">
                            <label for="age">Edad: </label>
                            <input type="number" runat="server" id="txtage" class="form-control" name="age"  pattern="[0-9 ]+" value="" placeholder="" required="required"/>
                        </div>
                
                            <div class="form-group">
                            <label for="registerDate">Fecha de Registro: </label>
                            <input type="date" runat="server" id="txtregisterDate" class="form-control" name="registerDate"   value="" placeholder="Guardar" required="required" />
                        <asp:Button ID="Button1" runat="server" Text="Guardar" CssClass="btn-primary" OnClick="Button1_Click2"/>
                            </div>
                 </div>
         
         </form>
    </div>
   
   
 <%--  --%>

    
<script>
    $(document).ready(function () {
        var action = true;
        $("#btn_agregar").click(function () {
            if (action) {
                $("#div_agregar").css("height", "90vh");
                $("#div_agregar").css("padding", "20px");
                
                action = false;
            } else {
                $("#div_agregar").css("height", "0px");
                $("#div_agregar").css("padding", "0px");
                action = true;
            }
        });

    });

</script>
</body>
</html>
