<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="webprueba.Inicio" %>

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
        <br />
        <asp:TextBox ID="txtCorreo" runat="server" Height="17px" Width="190px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="validadorCorreoNulo" runat="server" ControlToValidate="txtCorreo" ErrorMessage="* Campo obligatorio" ForeColor="#CC0000"></asp:RequiredFieldValidator>
&nbsp;
        <br />
        <asp:RegularExpressionValidator ID="validadorCorreo" runat="server" ControlToValidate="txtCorreo" ErrorMessage="Correo electronico en formato erroneo" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Password: "></asp:Label>
        <br />
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="190px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="validadorPasswordNulo" runat="server" ControlToValidate="txtPassword" ErrorMessage="* Campo obligatorio" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="lblErrorCorreo" runat="server" ForeColor="#CC0000" Text="*El correo electronico y el password no coinciden, o el usuario no ha sido confirmado." Visible="False"></asp:Label>
        <br />
        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
        <br />
        <br />
        <asp:HyperLink ID="linkRegistrarse" runat="server" ForeColor="#3333CC" NavigateUrl="~/Registro.aspx">Registrarse</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="linkModificarPassword" runat="server" ForeColor="#3333CC" NavigateUrl="~/CambiarPassword.aspx">Modificar password</asp:HyperLink>
    </form>
</body>
</html>
