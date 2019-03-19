<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logueado.aspx.cs" Inherits="webprueba.Logueado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblCorrecto" runat="server" Text="Ha ingresado correctamente!" ValidateRequestMode="Disabled"></asp:Label>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Inicio.aspx">Volver a Inicio</asp:HyperLink>
        </div>
    </form>
</body>
</html>
