<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InstanciarTarea.aspx.cs" Inherits="webprueba.Alumno.InstanciarTarea" %>

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
    <form id="form1" runat="server">
        <div style="height: 70px">
                    <asp:Panel ID="Panel4" runat="server" Height="81px" Width="627px">
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnCerrarSesion" runat="server" class="mybutton"  OnClick="btnCerrarSesion_Click" Text="Cerrar sesion" BackColor="#008CBA"   />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Black" Text="ALUMNOS-INSTANCIAR TAREA"></asp:Label>
                        <br />
                    </asp:Panel>
            <br />
            <br />
            <br />
            <br />
             <asp:GridView ID="GridView1" runat="server"  style="margin-left: 334px" Width="228px">
            </asp:GridView>
            <br />
        </div>


        <div style="height: 312px; width: 381px">

            <asp:Label ID="Label1" runat="server" Text="Usuario: " ForeColor="Black"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtUsuario" runat="server" ReadOnly="True" Width="150px" BackColor="#CCCCFF"></asp:TextBox>

            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Tarea"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtTarea" runat="server" ReadOnly="True" Width="150px" BackColor="#CCCCFF"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Horas est."></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtHorasEst" runat="server" ReadOnly="True" Width="150px" BackColor="#CCCCFF"></asp:TextBox>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtHorasRea" ErrorMessage="*Debe ingresar un numero" ForeColor="#CC0000" ValidationExpression="[1-9]\d{0,}"></asp:RegularExpressionValidator>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Horas reales"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtHorasRea" runat="server" Width="150px"></asp:TextBox>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <asp:Button ID="btnAceptar" runat="server" Height="28px" Text="Aceptar" Width="87px" OnClick="btnAceptar_Click" />
            <br />
            <br />
            <asp:Label ID="lblMensaje" runat="server"></asp:Label>
            <br />
            <br />
        </div>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Alumno/Alumno.aspx">Volver a inicio</asp:HyperLink>
    </form>
</body>
</html>
