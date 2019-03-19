<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Confirmar.aspx.vb" Inherits="ProyectoHADS1.Confirmar1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Su registro se ha completado exitosamente."></asp:Label>
            <br />
            <asp:Label ID="Label2" runat="server" ForeColor="#CC0000" Text="No hemos podido completar su registro, intente nuevamente"></asp:Label>
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#3333FF">Ir a la pagina de inicio</asp:HyperLink>
        </div>
    </form>
</body>
</html>
