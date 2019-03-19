<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Inicio.aspx.vb" Inherits="ProyectoHADS1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 278px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Label ID="Label1" runat="server" Text="E-mail"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtCorreo" runat="server" Height="17px" Width="133px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="validadorCorreoNulo" runat="server" ControlToValidate="txtCorreo" ErrorMessage="* Campo obligatorio" ForeColor="#CC0000"></asp:RequiredFieldValidator>
&nbsp;
        <asp:RegularExpressionValidator ID="validadorCorreo" runat="server" ControlToValidate="txtCorreo" ErrorMessage="Correo electronico en formato erroneo" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Password: "></asp:Label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="validadorPasswordNulo" runat="server" ControlToValidate="txtPassword" ErrorMessage="* Campo obligatorio" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <br />
        <br />
        <br />
        <asp:Button ID="btnLogin" runat="server" Text="Login" />
        <br />
        <br />
        <asp:HyperLink ID="linkRegistrarse" runat="server" ForeColor="#3333CC">Registrarse</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="linkModificarPassword" runat="server" ForeColor="#3333CC">Modificar password</asp:HyperLink>
    </form>
</body>
</html>
