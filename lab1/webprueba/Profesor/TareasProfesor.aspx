<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TareasProfesor.aspx.cs" Inherits="webprueba.Profesor.TareasProfesor" %>

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
  margin: 4px 2px 4px 35px;
            cursor: pointer;
            border-radius: 8px;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 415px">
             <div style="height: 70px">
            <asp:Panel ID="Panel1" runat="server" Height="94px">
                <asp:Panel ID="Panel4" runat="server" Height="81px" Width="812px">
                    &nbsp;&nbsp;
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Profesor/Profesor.aspx">Volver a Inicio</asp:HyperLink>
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Black" Text="PROFESOR-GESTION DE TAREAS"></asp:Label>
                    <asp:Button ID="btnCerrarSesion" runat="server" BackColor="#008CBA" class="mybutton" OnClick="btnCerrarSesion_Click" Text="Cerrar sesion" />
                    <br />
                    <br />
                    <br />
                </asp:Panel>
            </asp:Panel>
            <br />
                 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                     <ContentTemplate>
                         <asp:Label ID="Label2" runat="server" Text="Seleccionar la asignatura"></asp:Label>
                                         <br />
                <br />
                <asp:Button ID="btnInsertarTarea" runat="server" Text="Insertar tarea" OnClick="btnInsertarTarea_Click" />
                         <br />
                         <br />
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" DataSourceID="SqlDataSource1" DataTextField="codigo" DataValueField="codigo" Height="16px" OnDataBound="DropDownList1_DataBound" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="150px">
                </asp:DropDownList>
                         <br />
                         <asp:UpdateProgress ID="UpdateProgress1" runat="server"  DisplayAfter="200" AssociatedUpdatePanelID="UpdatePanel1">
                         <ProgressTemplate>
                            <div class="progress">
                                <img src="../ajax-loader.gif" />&nbsp;Espere por favor  
                            </div>
                            </ProgressTemplate>
                         </asp:UpdateProgress>
                         <asp:ScriptManager ID="ScriptManager1" runat="server">
                         </asp:ScriptManager>
                         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Codigo" DataSourceID="SqlDataSource2" Height="150px" style="margin-left: 201px" Width="230px">
                             <Columns>
                                 <asp:CommandField ShowEditButton="True" />
                                 <asp:BoundField DataField="Codigo" HeaderText="Codigo" ReadOnly="True" SortExpression="Codigo" />
                                 <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                                 <asp:BoundField DataField="CodAsig" HeaderText="CodAsig" SortExpression="CodAsig" />
                                 <asp:BoundField DataField="HEstimadas" HeaderText="HEstimadas" SortExpression="HEstimadas" />
                                 <asp:CheckBoxField DataField="Explotacion" HeaderText="Explotacion" SortExpression="Explotacion" />
                                 <asp:BoundField DataField="TipoTarea" HeaderText="TipoTarea" SortExpression="TipoTarea" />
                             </Columns>
                         </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AmigosConnectionString %>" SelectCommand="SELECT Asignaturas.codigo FROM ProfesoresGrupo INNER JOIN GruposClase ON ProfesoresGrupo.codigogrupo = GruposClase.codigo INNER JOIN Asignaturas ON GruposClase.codigoasig = Asignaturas.codigo WHERE (ProfesoresGrupo.email = @email)">
                    <SelectParameters>
                        <asp:SessionParameter Name="email" SessionField="correo" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                         <br />
                         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AmigosConnectionString %>" DeleteCommand="DELETE FROM [TareasGenericas] WHERE [Codigo] = @Codigo" InsertCommand="INSERT INTO [TareasGenericas] ([Codigo], [Descripcion], [CodAsig], [HEstimadas], [Explotacion], [TipoTarea]) VALUES (@Codigo, @Descripcion, @CodAsig, @HEstimadas, @Explotacion, @TipoTarea)" SelectCommand="SELECT [Codigo], [Descripcion], [CodAsig], [HEstimadas], [Explotacion], [TipoTarea] FROM [TareasGenericas] WHERE ([CodAsig] = @CodAsig)" UpdateCommand="UPDATE [TareasGenericas] SET [Descripcion] = @Descripcion, [CodAsig] = @CodAsig, [HEstimadas] = @HEstimadas, [Explotacion] = @Explotacion, [TipoTarea] = @TipoTarea WHERE [Codigo] = @Codigo">
                             <DeleteParameters>
                                 <asp:Parameter Name="Codigo" Type="String" />
                             </DeleteParameters>
                             <InsertParameters>
                                 <asp:Parameter Name="Codigo" Type="String" />
                                 <asp:Parameter Name="Descripcion" Type="String" />
                                 <asp:Parameter Name="CodAsig" Type="String" />
                                 <asp:Parameter Name="HEstimadas" Type="Int32" />
                                 <asp:Parameter Name="Explotacion" Type="Boolean" />
                                 <asp:Parameter Name="TipoTarea" Type="String" />
                             </InsertParameters>
                             <SelectParameters>
                                 <asp:ControlParameter ControlID="DropDownList1" DefaultValue="" Name="CodAsig" PropertyName="SelectedValue" Type="String" />
                             </SelectParameters>
                             <UpdateParameters>
                                 <asp:Parameter Name="Descripcion" Type="String" />
                                 <asp:Parameter Name="CodAsig" Type="String" />
                                 <asp:Parameter Name="HEstimadas" Type="Int32" />
                                 <asp:Parameter Name="Explotacion" Type="Boolean" />
                                 <asp:Parameter Name="TipoTarea" Type="String" />
                                 <asp:Parameter Name="Codigo" Type="String" />
                             </UpdateParameters>
                         </asp:SqlDataSource>
                         
                <br />
                <br />
                         <br />
                         <br />
                     </ContentTemplate>
                 </asp:UpdatePanel>
            <br />
        
            <br />
            <br />
            <br />
        </div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
    </form>
</body>
</html>
