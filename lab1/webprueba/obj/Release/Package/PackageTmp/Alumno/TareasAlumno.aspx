<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TareasAlumno.aspx.cs" Inherits="webprueba.Alumno.TareasAlumno" %>

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
  margin: 4px 2px 4px 43px;
            cursor: pointer;
            border-radius: 8px;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
                    <asp:Panel ID="Panel4" runat="server" Height="81px" Width="922px">
                        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Black" Text="ALUMNOS-GESTION DE TAREAS"></asp:Label>
                        <asp:Button ID="btnCerrarSesion" runat="server" BackColor="#008CBA" class="mybutton" OnClick="btnCerrarSesion_Click" Text="Cerrar sesion" />
                        <br />
                    </asp:Panel>
        <asp:Label ID="lblSeleccionar" runat="server" Text="Seleccionar asignatura matriculada"></asp:Label>
        <br />
        <br />
        <asp:DropDownList ID="DropDownListAsig" runat="server" AutoPostBack="true" AppendDataBoundItems="true" Height="16px" Width="237px" >
        </asp:DropDownList>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView_SelectedIndexChanged" AutoGenerateColumns="False">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Codigo" HeaderText="Codigo" SortExpression="Codigo" />
                <asp:BoundField DataField="Descripcion" HeaderText="Desc." SortExpression="Descripcion" />
                <asp:BoundField DataField="HEstimadas" HeaderText="Horas" SortExpression="HEstimadas" />
                <asp:BoundField DataField="TipoTarea" HeaderText="Tipo" SortExpression="TipoTarea" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
