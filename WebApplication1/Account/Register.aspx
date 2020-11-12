<%@ Page Title="Registro" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication1.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Registre un nuevo lugar!!</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Lugar" CssClass="col-md-2 control-label">Lugar</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Lugar" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Lugar"
                    CssClass="text-danger" ErrorMessage="El Lugar es requerido." />
            </div>
        </div>
         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Descripcion" CssClass="col-md-2 control-label">Descripcion</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Descripcion" CssClass="form-control"  TextMode="SingleLine"/>
                <asp:RequiredFieldValidator runat="server"  ControlToValidate="Descripcion"
                    CssClass="text-danger" ErrorMessage="La Descripcion es requerida" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Producto" CssClass="col-md-2 control-label">Producto</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Producto" CssClass="form-control"  TextMode="SingleLine"/>
                <asp:RequiredFieldValidator runat="server"  ControlToValidate="Producto"
                    CssClass="text-danger" ErrorMessage="El Producto es requerido" />
            </div>
        </div>
        
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Precio" CssClass="col-md-2 control-label">Precio</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Precio" CssClass="form-control"  TextMode="SingleLine"/>
                <asp:RequiredFieldValidator runat="server"  ControlToValidate="Precio"
                    CssClass="text-danger" ErrorMessage="EL Precio es Requerido" />
            </div>
        </div>

          <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="East" CssClass="col-md-2 control-label">East</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="East" CssClass="form-control" TextMode="SingleLine"/>
                <asp:RequiredFieldValidator runat="server"  ControlToValidate="East"
                    CssClass="text-danger" ErrorMessage="La cordenada East es requerida" />
            </div>
        </div>

         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="West" CssClass="col-md-2 control-label">West</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="West" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server"   ControlToValidate="West"
                    CssClass="text-danger" ErrorMessage="La cordenada West es requerida" />
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Registrar" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
</asp:Content>
