<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profesor.aspx.cs" Inherits="webprueba.Profesor.Profesor1" %>

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
                    <div style="display: inline-block; margin-left: 166px; width: 454px; height: 13px; margin-top: 0px;">
                        <asp:Panel ID="Panel3" runat="server" BackColor="#99CCFF" Height="243px" style="margin-left: 6px;" Width="452px" Font-Strikeout="False">
                            <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="GESTION WEB DE TAREAS PARA  PROFESORES"></asp:Label>
                        </asp:Panel>
                    </div>
                        <br />
            <br />
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
                    <br />
                  
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <br />
                <asp:Label ID="lblCantAlumnos" runat="server" Text="Cantidad de alumnos conectados: "></asp:Label>
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblNumAlumnos" runat="server"></asp:Label>
                <br />
                <asp:ListBox ID="listBoxAlumnos" runat="server" Width="199px"></asp:ListBox>
                <ajaxToolkit:RoundedCornersExtender ID="listBoxAlumnos_RoundedCornersExtender" runat="server" BehaviorID="listBoxAlumnos_RoundedCornersExtender" BorderColor="DarkRed" Color="DarkRed" TargetControlID="listBoxAlumnos" Radius="8" />
                <br />
                <br />
                <asp:Label ID="lblCantProfes" runat="server" Text="Cantidad de profesores conectados: "></asp:Label>
                &nbsp;<asp:Label ID="lblNumProfes" runat="server"></asp:Label>
                <br />
                <asp:ListBox ID="listBoxProfes" runat="server" Width="194px"></asp:ListBox>
                <ajaxToolkit:RoundedCornersExtender ID="listBoxProfes_RoundedCornersExtender" runat="server" BehaviorID="listBoxProfes_RoundedCornersExtender" BorderColor="DarkRed" Color="DarkRed" Radius="8" TargetControlID="listBoxProfes" />
                <asp:Timer ID="Timer1" runat="server" Interval="3000" OnTick="Timer1_Tick">
                </asp:Timer>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </ContentTemplate>
        </asp:UpdatePanel>
            <br />
        </div>
    </form>
</body>
</html>
