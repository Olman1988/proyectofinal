<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cursos.aspx.cs" Inherits="Registro.cursos" %>

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
        <div class="form-group col-lg-6 col-md-11 container mx-auto mt-5" style="max-width:80%;" >
        
        
     <div class="table-responsive">
         <div class="container col-lg-5">
                  <button type="button" style ="" class="btn btn-info text-center" id="btn_agregar">Agregar+</button> 
             </div>
         
         <asp:GridView ID="GridView1" CssClass="mx-auto table-primary table-responsive-lg" runat="server" AutoGenerateColumns="False" CellPadding="20" DataKeyNames="id" ForeColor="#333333" GridLines="None" OnRowCancelingEdit="cancelingRow" OnRowDeleting="delitingRow" OnRowEditing="editingRow" OnRowUpdating="editarRow">
             <AlternatingRowStyle BackColor="White" />
             <Columns>
                 <asp:TemplateField HeaderText="id" InsertVisible="False" SortExpression="id">
                     <EditItemTemplate>
                         <asp:Label ID="id" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Nombre" >
                     <EditItemTemplate>
                         <asp:TextBox ID="txtname" runat="server" Text='<%# Bind("Nombre") %>'></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label2" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Descripcion"  ValidateRequestMode="Enabled">
                     <EditItemTemplate>
                         <asp:TextBox ID="txtdescription" runat="server" Text='<%# Bind("Descripcion") %>'></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label3" runat="server" Text='<%# Bind("Descripcion") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Precio" >
                     <EditItemTemplate>
                         <asp:TextBox ID="txtprice" runat="server" Text='<%# Bind("Precio") %>'></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label4" runat="server" Text='<%# Bind("Precio") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:CommandField ButtonType="Button" HeaderText="Acciones" ShowDeleteButton="True" ShowEditButton="True" ShowHeader="True" />
             </Columns>
             <EditRowStyle BackColor="#2461BF" />
             <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
             <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
             <RowStyle BackColor="#EFF3FB" />
             <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
             <SortedAscendingCellStyle BackColor="#F5F7FB" />
             <SortedAscendingHeaderStyle BackColor="#6D95E1" />
             <SortedDescendingCellStyle BackColor="#E9EBEF" />
             <SortedDescendingHeaderStyle BackColor="#4870BE" />
         </asp:GridView>
         
         </div>
            </div>
        <div class="container col-lg-4 mx-auto">
        <asp:Label ID="lblmsj" runat="server" CssClass="lab"  ForeColor="White" Visible="False"></asp:Label>
           </div>
    <div  style="" id="div_agregar" class="div_agregar col-lg-6 col-md-11 container mx-auto mt-5" style="">
                                <div class="form-group"><h2 style="font-size:17px;color:#0094ff">Ingrese los datos solicitados</h2>
                                     <label for="name">Nombre: </label>
                                     <input type="text" id="txt_name" runat="server" class="form-control" name="name"  pattern="[A-Za-z ]+" value="" placeholder="Ingrese el nombre del Estudiante" />
                                </div>
                                <div class="form-group">
                                     <label for="descripcion">Descripcion: </label>
                                         <input type="text" id="txt_descripcion" runat="server" class="form-control" name="identificacion"  value="" placeholder="Descripcion" />
                                </div>
                
             
                        
                            <div class="form-group">
                            <label for="precio">Precio: </label>
                            <input type="number" id="txt_precio" runat="server" class="form-control" name="identificacion"  value="" placeholder="Ingrese le precio"/>
                        </div>
                            
                <div class="form-group">
                            
                       
                            <asp:Label CssClass="mt-5" ID="Label4" runat="server" Text="Estado:" Font-Size=""></asp:Label><asp:DropDownList ID="estado" runat="server" Font-Size="">
                            <asp:ListItem>Activo</asp:ListItem>
                            <asp:ListItem>Inactivo</asp:ListItem>
                        </asp:DropDownList>
                    <br/>
                    <asp:Button ID="Button2" runat="server" Text="Guardar" CssClass="btn-primary" OnClick="Button2_Click"/>
                    </div>
                 </div>
         
         </form>
   
   
   
 <%--  --%>

    
<script>
    $(document).ready(function () {
        var action = true;
        $("#btn_agregar").click(function () {
            if (action) {
                $("#div_agregar").css("height", "60vh");
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
