<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Confirmar.aspx.cs" Inherits="webprueba.Confirmar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblSucces" runat="server" Text="Su registro se ha completado exitosamente." Visible="False"></asp:Label>
            <br />
            <asp:Label ID="lblError" runat="server" ForeColor="#CC0000" Text="No hemos podido completar su registro, intente nuevamente" Visible="False"></asp:Label>
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#3333FF" NavigateUrl="~/Inicio.aspx">Volver a la pagina de inicio</asp:HyperLink>
        </div>
    </form>
</body>
</html>
