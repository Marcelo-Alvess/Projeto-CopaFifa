<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CadastroJogador.aspx.cs" Inherits="WebAppCopa.CadastroJogador" %>

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

        function ChamarExibirMensagemErro(msg) {
            parent.ExibirMensagemErro(msg);
        }

        function ChamarExibirMensagemSucesso(msg) {
            parent.ExibirMensagemSucesso(msg);
            ChamarFecharPopUp();
        }

        function ConfirmarExclusao(sender) {
            if ($(sender).attr("ExclusaoConfirmada") == "true") {
                return true;
            }

            bootbox.confirm({
                message: "Deseja realmente excluir este jogador?",
                buttons: {
                    confirm: {
                        label: 'Sim',
                        className: 'btn-success'
                    },
                    cancel: {
                        label: 'Não',
                        className: 'btn-danger'
                    }
                },
                callback: function (confirmed) {
                    if (confirmed) {
                        $(sender).attr("ExclusaoConfirmada", confirmed).trigger("click");
                    }
                }
            });
            return false;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <!-- ID -->
            <div>
                <div>
                    ID
                </div>

                <div>
                    <asp:TextBox ID="txtId" runat="server"></asp:TextBox>
                </div>
            </div>

            <br />

            <!-- Nome do jogador -->
            <div>
                <div>
                    Nome
                </div>               

                <div>
                    <asp:TextBox ID="txtNome" runat="server"></asp:TextBox>
                </div>
            </div>
            <br />

            <br />

            <!-- Data de Nascimento -->
            <div>
                <div>
                    Data de Nascimento
                </div>

                <div>
                    <asp:TextBox ID="txtDataNascimento" runat="server"></asp:TextBox>
                </div>
            </div>
            <br />

            <br />

            <!-- Número camisa -->
            <div>
                <div>
                    Numero Camisa
                </div>

                <div>
                    <asp:TextBox ID="txtNumeroCamisa" runat="server"></asp:TextBox>
                </div>
            </div>
            <br />

            <br />

            <!-- Posição -->
            <div>
                <div>
                    Posição
                </div>

                <div>
                    <%--<<asp:TextBox ID="txtPosicao" runat="server"></asp:TextBox>--%>
                    <asp:DropDownList ID="ddlPosicao" runat="server"></asp:DropDownList>
                </div>
            </div>
            <br />

            <br />

            <!-- Convocação -->
            <div>
                <div>
                    Convocação
                </div>

                <div>
                    <asp:TextBox ID="txtConvocacao" runat="server"></asp:TextBox>
                </div>
            </div>
            <br />

            <br />

            <!-- Dispensa -->
            <div>
                <div>
                    Dispensa
                </div>

                <div>
                    <asp:TextBox ID="txtDispensa" runat="server"></asp:TextBox>
                </div>
            </div>
            <br />

            <br />

            <!-- Label-->
            <div>
                <div>
                    <asp:Label ID="lblMensagem" runat="server" Text=""></asp:Label>
                </div>
                <br />
            </div>

            <br />

            <!-- Botões Exibir Dados e Calcular idade-->
            <div>
                <div>
                    <asp:Button ID="btnExibirDados" runat="server" Text="Exibir Dados" OnClick="btnExibirDados_Click" CssClass="btn btn-primary" />
                    <asp:Button ID="btnCalcularIndenizacaoFifa" runat="server" Text="Calcular Indenização"  CssClass="btn btn-secondary" OnClick="btnCalcularIndenizacaoFifa_Click" />
                    <asp:Button ID="btnCalcularIdade" runat="server" Text="Calcular idade" OnClick="btnCalcularIdade_Click" CssClass="btn btn-success" />
                    <asp:Button ID="btnSalvar" runat="server" Text="Salvar" OnClick="btnSalvar_Click" CssClass="btn btn-info" />
                    <asp:Button ID="btnExcluir" runat="server" Text="Excluir"  CssClass="btn btn-danger" OnClientClick="return ConfirmarExclusao(this);" />
                </div>
            </div>

        </div>
    </form>
</body>
</html>
