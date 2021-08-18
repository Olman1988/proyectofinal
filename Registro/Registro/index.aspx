<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Registro.index" %>


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
    
<body style="">


    <div class="container mx-auto col-lg-8 col-md-10 mt-5 p-5" style="" >
        
 
     <form runat="server">
                   
             <asp:Label ID="lblmsj" runat="server" CssClass="lab" ForeColor="White" Visible="False"><asp:Button ID="Button2" runat="server" Text="Cerrar" CssClass="btn btn-danger" /></asp:Label>
             
        
     <div class="container border-primary p-5" style="border:solid 2px #0094ff; border-radius:10px;max-width:500px">
     <div class="form-group"><h2 style="font-size:17px;color:#0094ff">Iniciar Sesión</h2>
                                     <label for="email">Correo: </label>
                                     <input type="email" id="txtemaili" runat="server" class="form-control" name="email"  value="" placeholder="Ingrese su correo" required="required" />
                                </div>
                                <div class="form-group" style="">
                                     <label for="password">Contraseña: </label>
                                        <input type="password" id="txtpassi" runat="server" class="form-control" name="password"  value="" placeholder="Ingrese su contraseña" />
                                </div>
         <button type="button" style ='' class="btn btn-info" id="btn_agregar">Agregar+</button>  
       <asp:Button ID="Button3" runat="server" Text="Iniciar Sesión" CssClass="btn-primary" OnClick="Button1_Click"/>
         <a href="./">¿Olvidaste tu contraseña?</a>
    </div>
                         
         <div  style="" id="div_agregar" class="div_agregar mt-5">
                                <div class="form-group"><h2 style="font-size:17px;color:#0094ff">Ingrese los datos solicitados</h2>
                                     <label for="name">Nombre: </label>
                                     <input type="text" id="txtname" runat="server" class="form-control" name="name"   value="" placeholder="Ingrese su nombre"  />
                                </div>
                                <div class="form-group">
                                     <label for="apellidos">Apellidos: </label>
                                        <input type="text" id="txtapellidos" runat="server" class="form-control" name="firstLastname"   value="" placeholder="Ingrese sus apellidos" />
                                </div>
                <div class="form-group">
                                     <label for="email">Email: </label>
                                        <input type="email" id="txtemail" runat="server" class="form-control" name="secondApellido"   value="" placeholder="Ingrese su correo electrónico" />
                                </div>
             
                        
                            <div class="form-group">
                            <label for="pass">Contraseña: </label>
                            <input type="password" id="txtpass" runat="server" class="form-control" name="identificacion"  value="" placeholder="Ingrese su contraseña" />
                        </div>
                            <div class="form-group">
                            <label for="age">Perfil: </label>
                            <asp:DropDownList ID="txtperfil" runat="server" Font-Size="Large">
                            <asp:ListItem>Administrador</asp:ListItem>
                            <asp:ListItem>Cliente</asp:ListItem>
                        </asp:DropDownList>                        </div>
                
                            <div class="form-group">
                            
                        <asp:Button ID="Button1" runat="server" Text="Registrar" CssClass="btn-primary" OnClick="Button1_Click1" />
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
