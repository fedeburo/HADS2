﻿
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Alumno.aspx.cs" Inherits="webprueba.Alumno.Alumno" %>

    <style type="text/css">

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

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin-top: 22px; display: inline-block">
            <asp:Panel ID="Panel2" runat="server" Height="292px">
               <div style='display: inline-block; height: 50px;'>
                <asp:Panel ID="Panel1" runat="server" Height="287px" style="margin-left: 0px" Width="157px"  >
                    <asp:Panel ID="Panel4" runat="server" Height="81px" Width="627px">
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnCerrarSesion" runat="server" class="mybutton"  OnClick="btnCerrarSesion_Click" Text="Cerrar sesion" BackColor="#008CBA"   />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Black" Text="PROFESORES"></asp:Label>
                        <br />
                    </asp:Panel>
                    <div style="display: inline-block; margin-left: 166px; width: 454px; height: 13px; margin-top: 0px;">
                        <asp:Panel ID="Panel3" runat="server" BackColor="#99CCFF" Height="243px" style="margin-left: 6px;" Width="452px" Font-Strikeout="False">
                            <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="GESTION WEB DE TAREAS PARA  PROFESORES"></asp:Label>
                        </asp:Panel>
                    </div>
                        <asp:HyperLink ID="HLAsig0" runat="server">Asignaturas</asp:HyperLink>
                        <br />
                        <br />
                        <asp:HyperLink ID="HLTareas" runat="server" NavigateUrl="~/Profesor/TareasProfesor.aspx">Tareas</asp:HyperLink>
                        <br />
                        <br />
                        <asp:HyperLink ID="HLGrupos" runat="server">Grupos</asp:HyperLink>
                        <br />
                        <br />
                        <asp:HyperLink ID="HLImportar" runat="server">Importar XML</asp:HyperLink>
                        <br />
                        <br />
                        <asp:HyperLink ID="HLExportar" runat="server">Exportar</asp:HyperLink>
                        <br />
                        <br />
                        <asp:HyperLink ID="HLImportarDS" runat="server">Importar DataSet</asp:HyperLink>
                    <asp:HyperLink ID="gruposHL" runat="server">Grupos</asp:HyperLink>
                    </asp:Panel>
                    </div>

            </asp:Panel>

        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
    </form>
</body>
</html>
