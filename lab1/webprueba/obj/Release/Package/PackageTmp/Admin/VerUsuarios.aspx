<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerUsuarios.aspx.cs" Inherits="webprueba.Admin.VerUsuarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #form1 {
            height: 50px;
        }



.mybutton{
      background-color: #008CBA; 
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 12px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius: 8px;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 46px">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Arial Black" Font-Size="X-Large" Text="ADMIN - VER USUARIOS"></asp:Label>
                    <asp:Button ID="btnCerrarSesion" runat="server" BackColor="#008CBA" class="mybutton" OnClick="btnCerrarSesion_Click" Text="Cerrar sesion" />
        </div>
        <div style="height: 217px">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AmigosConnectionString %>" SelectCommand="SELECT [email], [nombre], [apellidos], [tipo], [pass] FROM [Usuarios]"></asp:SqlDataSource>
            <asp:Label ID="Label2" runat="server" Text="Tabla Usuarios:"></asp:Label>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="email" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="email" HeaderText="email" ReadOnly="True" SortExpression="email" />
                    <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                    <asp:BoundField DataField="apellidos" HeaderText="apellidos" SortExpression="apellidos" />
                    <asp:BoundField DataField="tipo" HeaderText="tipo" SortExpression="tipo" />
                    <asp:BoundField DataField="pass" HeaderText="pass" SortExpression="pass" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
