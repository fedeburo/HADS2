<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImportarTareasXMLDocument.aspx.cs" Inherits="webprueba.Profesor.ImportarTareasXMLDocument" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
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
</head>
<body>
    <form id="form2" runat="server">
        <div style="height: 415px">
             <div style="height: 70px">
            <asp:Panel ID="Panel1" runat="server" Height="94px">
                <asp:Panel ID="Panel4" runat="server" Height="81px" Width="833px">
                    &nbsp;
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Profesor/Profesor.aspx">Volver a Inicio</asp:HyperLink>
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Black" Text="PROFESOR-IMPORTAR TAREAS"></asp:Label>
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCerrarSesion" runat="server" BackColor="#008CBA" class="mybutton" OnClick="btnCerrarSesion_Click" Text="Cerrar sesion" />
                    <br />
                    <br />
                    <br />
                </asp:Panel>
            </asp:Panel>
            <br />
            <br />
        
            <br />
            <br />
            <br />
        </div>
            <asp:Panel ID="Panel2" runat="server" Height="192px" Width="433px" float="left">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AmigosConnectionString %>" SelectCommand="SELECT Asignaturas.codigo FROM ProfesoresGrupo INNER JOIN GruposClase ON ProfesoresGrupo.codigogrupo = GruposClase.codigo INNER JOIN Asignaturas ON GruposClase.codigoasig = Asignaturas.codigo WHERE (ProfesoresGrupo.email = @email)">
                    <SelectParameters>
                        <asp:SessionParameter Name="email" SessionField="correo" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                &nbsp;<asp:Label ID="lblMensaje" runat="server"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="Seleccionar la asignatura"></asp:Label>
                <br />
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="codigo" DataValueField="codigo" Height="16px" Width="150px" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" OnDataBound="DropDownList1_DataBound">
                </asp:DropDownList>
                <br />
                <br />
                <asp:Button ID="btnImportar" runat="server" Text="Importar XML" OnClick="btnInsertarTarea_Click" />
                <br />
                <br />
                <br />
                <asp:Xml ID="Xml1" runat="server"></asp:Xml>
            </asp:Panel>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
    </form>
</body>
</html>
