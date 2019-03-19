<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CambiarPassword.aspx.cs" Inherits="webprueba.CambiarPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label4" runat="server" Text="E-mail"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
            <asp:TextBox ID="txtCorreo" runat="server" Width="190px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCorreo" ErrorMessage="*Campo obligatorio" ForeColor="#CC0000"></asp:RequiredFieldValidator>
&nbsp;
            <br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtCorreo" ErrorMessage="Correo en formato erroneo" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <br />
            <asp:Button ID="btnCorreo" runat="server" Text="Enviar codigo" OnClick="btnCorreo_Click" />
            <br />
            <asp:Label ID="lblCorreoMandado" runat="server"></asp:Label>
            <br />
            <asp:Label ID="lblErrorCorreo" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <asp:Panel ID="Panel1" runat="server" Enabled="False" Height="192px">
                <asp:Label ID="Label1" runat="server" Text="Codigo:"></asp:Label>
                &nbsp;<br />
                <asp:TextBox ID="txtCodigo" runat="server" Width="190px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCodigo" Enabled="False" EnableTheming="False" ErrorMessage="*Campo obligatorio" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:Label ID="lblpassword" runat="server" Text="Password:"></asp:Label>
                &nbsp;
                <br />
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="190px"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" Enabled="False" ErrorMessage="*Campo obligatorio" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:Label ID="Label3" runat="server" Text="Repetir password:"></asp:Label>
                <br />
                <asp:TextBox ID="txtPassword2" runat="server" style="margin-bottom: 0px" TextMode="Password" Width="190px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPassword2" Enabled="False" ErrorMessage="*Campo obligatorio" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtPassword2" Enabled="False" ErrorMessage="CompareValidator" ForeColor="#CC0000">Las password no coinciden</asp:CompareValidator>
                &nbsp;&nbsp;&nbsp;
            </asp:Panel>
            <br />
            <br />
            <asp:Label ID="lblSucces" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Button ID="btnEnviar" runat="server" Text="Enviar" OnClick="btnEnviar_Click" Visible="False" />
        </div>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Inicio.aspx">Volver a Inicio</asp:HyperLink>
    </form>
</body>
</html>
