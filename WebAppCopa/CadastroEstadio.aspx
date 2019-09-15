<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CadastroEstadio.aspx.cs" Inherits="WebAppCopa.CadastroEstadio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="Scripts/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="Scripts/bootstrap.min.js" type="text/javascript"></script>
    <script src="Scripts/bootbox.min.js" type="text/javascript"></script>
    <script src="Scripts/toastr.js" type="text/javascript"></script>

    <link href="Content/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="Content/toastr.css" rel="stylesheet" type="text/css"/>

    <script type="text/javascript">
        function ChamarFecharPopUp() {
            parent.FecharPopUp();
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container">

                <div class="row form-group">
                    <div class="col-sm-3">
                    </div>
                    <div class="col-sm-9">
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-sm-3">
                        ID
                    </div>
                    <div class="col-sm-9">
                        <asp:TextBox ID="txtID" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-sm-3">
                        Estádio
                    </div>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txtNome" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-sm-3">
                        Cidade
                    </div>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txtCidade" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-sm-3">
                        Capacidade
                    </div>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txtCapacidade" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-sm-3">
                        <asp:Button ID="btnAdicionar" runat="server" Text="Adicionar" CssClass="btn btn-primary" OnClick="btnAdicionar_Click1" />
                    </div>
                    <div class="col-sm-3">
                        <asp:Button ID="btnConcluir" runat="server" Text="Concluir"
                            CssClass="btn btn-success" OnClientClick="return ChamarFecharPopUp();" />
                    </div>
                </div>

                <div class="row form-group">
                    <asp:GridView ID="gvEstadios" runat="server"></asp:GridView>
                </div>


            </div>
        </div>
    </form>
</body>
</html>
