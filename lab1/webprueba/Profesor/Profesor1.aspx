<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profesor1.aspx.cs" Inherits="webprueba.Profesor.Profesor1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">


.mybutton{
        border-style: none;
            border-color: inherit;
            border-width: medium;
            background-color: #008CBA; 
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 12px;
  margin: 4px 2px 4px 0px;
            cursor: pointer;
            border-radius: 8px;
}

    </style>
</head>
<body style="height: 539px">
    <form id="form1" runat="server">
        <div>
                    <asp:Panel ID="Panel4" runat="server" Height="81px" Width="798px">
                        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Black" Text="PROFESORES"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnCerrarSesion" runat="server" BackColor="#008CBA" class="mybutton" OnClick="btnCerrarSesion_Click" Text="Cerrar sesion" />
                        <br />
                    </asp:Panel>
                        <asp:Panel ID="Panel3" runat="server" BackColor="#99CCFF" Height="243px" style="margin-left: 242px;" Width="452px" Font-Strikeout="False">
                            <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="GESTION WEB DE TAREAS PARA  PROFESORES"></asp:Label>
                        </asp:Panel>
                    <asp:HyperLink ID="HyperLink1" runat="server">Asignaturas</asp:HyperLink>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Profesor/TareasProfesor.aspx">Tareas</asp:HyperLink>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink3" runat="server">Grupos</asp:HyperLink>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Profesor/ImportarTareasXMLDocument.aspx">Importar</asp:HyperLink>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/Profesor/ExportarTareas.aspx">Exportar</asp:HyperLink>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink6" runat="server">Importar dataset</asp:HyperLink>
            <br />
        </div>
    </form>
</body>
</html>
