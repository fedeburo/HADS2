﻿
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Alumno.aspx.cs" Inherits="webprueba.Alumno.Alumno" %>

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
  margin: 4px 2px 4px 96px;
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
                        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Black" Text="ALUMNOS"></asp:Label>
                        <asp:Button ID="btnCerrarSesion" runat="server" BackColor="#008CBA" class="mybutton" OnClick="btnCerrarSesion_Click" Text="Cerrar sesion" />
                        <br />
                    </asp:Panel>
                    <div style="display: inline-block; margin-left: 166px; width: 454px; height: 13px; margin-top: 0px;">
                        <asp:Panel ID="Panel3" runat="server" BackColor="#99CCFF" Height="243px" style="margin-left: 6px;" Width="452px" Font-Strikeout="False">
                            <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="GESTION WEB DE TAREAS PARA   ALUMNOS"></asp:Label>
                        </asp:Panel>
                    </div>
                    <br />
                    <asp:HyperLink ID="tareasGenericasHL" runat="server" NavigateUrl="~/Alumno/TareasAlumno.aspx">Tareas Genericas</asp:HyperLink>
                    <br />
                    <br />
                    <asp:HyperLink ID="tareasPpiasHL" runat="server">Tareas propias</asp:HyperLink>
                    <br />
                    <br />
                    <asp:HyperLink ID="gruposHL" runat="server">Grupos</asp:HyperLink>
                    </asp:Panel>
                    </div>

            </asp:Panel>

        </div>
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <br />
                <br />
                <br />
                <asp:Label ID="lblCantAlumnos" runat="server" Text="Cantidad de alumnos conectados: "></asp:Label>
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblNumAlumnos" runat="server"></asp:Label>
                <br />
                <asp:ListBox ID="listBoxAlumnos" runat="server" Width="198px" ></asp:ListBox>
                <ajaxToolkit:RoundedCornersExtender ID="listBoxAlumnos_RoundedCornersExtender" runat="server" BehaviorID="listBoxAlumnos_RoundedCornersExtender" BorderColor="DarkRed" Color="DarkRed" Radius="8" TargetControlID="listBoxAlumnos" />
                <br />
                <br />
                <asp:Label ID="lblCantProfes" runat="server" Text="Cantidad de profesores conectados: "></asp:Label>
                &nbsp;<asp:Label ID="lblNumProfes" runat="server"></asp:Label>
                <br />
                <asp:ListBox ID="listBoxProfes" runat="server" Width="195px"></asp:ListBox>
                <ajaxToolkit:RoundedCornersExtender ID="listBoxProfes_RoundedCornersExtender" runat="server" BehaviorID="listBoxProfes_RoundedCornersExtender" BorderColor="DarkRed" Color="DarkRed" Radius="8" TargetControlID="listBoxProfes" />
                <asp:Timer ID="Timer1" runat="server" Interval="3000" OnTick="Timer1_Tick">
                </asp:Timer>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
        <br />
        <br />
        <br />
    </form>
</body>
</html>
