using System.Globalization;
using Library.Business.Exceptions;
using Library.Models;
using Library.Models.Enuns;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppCopa
{
    public partial class CadastroJogador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                ddlPosicao.DataSource = Enum.GetValues(typeof(PosicaoEnum));
                ddlPosicao.DataBind();
                ddlPosicao.Items.Insert(0, new ListItem("---Selecione---", "0"));
            }
        }

        protected void btnExibirDados_Click(object sender, EventArgs e)
        {
            try
            {
                Jogador j = new Jogador();
                j.Id = Convert.ToInt32(txtId.Text);
                j.NmNome = txtNome.Text;
                j.DtNascimento = Convert.ToDateTime(txtDataNascimento.Text);
                j.NrCamisa = Convert.ToInt32(txtNumeroCamisa.Text);
                //j.NmPosição = txtPosicao.Text;
                j.Posicao = (PosicaoEnum)Enum.Parse(typeof(PosicaoEnum), ddlPosicao.SelectedValue);

                if (j.Posicao == PosicaoEnum.LateralDireito)
                    j.NmPosicao = "Lateral Direito";
                else if (j.Posicao == PosicaoEnum.LateralEsquerdo)
                    j.NmPosicao = "Lateral Esquerdo";
                else if (j.Posicao == PosicaoEnum.MeioCampo)
                    j.NmPosicao = "Meio Campo";
                else
                    j.NmPosicao = j.Posicao.ToString();

                j.DtConvocacao = Convert.ToDateTime(txtConvocacao.Text);
                j.DtDispensa = Convert.ToDateTime(txtDispensa.Text);

                lblMensagem.Text = j.ObterDados();
            }
            catch (Exception ex)
            {
                string scriptMensagem = string.Format("<script>ChamarExibirMensagemErro('{0}');</script>", ex.Message);
                ClientScript.RegisterStartupScript(this.GetType(), "ChaveMensagem", scriptMensagem);
            }
        }

        protected void btnCalcularIdade_Click(object sender, EventArgs e)
        {
            try
            {
                Jogador j = new Jogador(Convert.ToDateTime(txtDataNascimento.Text));

                //Antes do construtor.
                //j.DtNascimento = Convert.ToDateTime(txtDataNascimento.Text);

                lblMensagem.Text = Convert.ToString(j.CalcularIdade());
                //lblMensagem.Text = j.CalcularIdade().ToString();//Outra maneira de converter.

            }
            catch (Exception ex)
            {
                string scriptMensagem = string.Format("<script>ChamarExibirMensagemErro('{0}');</script>", ex.Message);
                ClientScript.RegisterStartupScript(this.GetType(), "ChaveMensagem", scriptMensagem);

            }
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(txtNome.Text))
                {
                    throw new NomeInvalidoException("O Nome deve ser digitado.");
                }
                if (ddlPosicao.SelectedValue == "0")
                {
                    throw new PosicaoInvalidaException("Selecione a posição em que o jogador atua.");
                }

                Jogador j = new Jogador();
                j.Id = Convert.ToInt32(txtId.Text);
                j.NmNome = txtNome.Text;
                j.DtNascimento = Convert.ToDateTime(txtDataNascimento.Text);
                j.NrCamisa = Convert.ToInt32(txtNumeroCamisa.Text);                
                j.Posicao = (PosicaoEnum)Enum.Parse(typeof(PosicaoEnum), ddlPosicao.SelectedValue);
                j.DtConvocacao = Convert.ToDateTime(txtConvocacao.Text);
                j.DtDispensa = Convert.ToDateTime(txtDispensa.Text);

                if (j.Posicao == PosicaoEnum.LateralDireito)
                    j.NmPosicao = "Lateral Direito";
                else if (j.Posicao == PosicaoEnum.LateralEsquerdo)
                    j.NmPosicao = "Lateral Esquerdo";
                else if (j.Posicao == PosicaoEnum.MeioCampo)
                    j.NmPosicao = "Meio Campo";
                else
                    j.NmPosicao = j.Posicao.ToString();

                string scriptMensagem = string.Format("<script>ChamarExibirMensagemSucesso('{0}');</script>", j.ObterDados());

                ClientScript.RegisterStartupScript(this.GetType(), "ChaveMensagem", scriptMensagem);
            }
            catch (NomeInvalidoException nEx)
            {
                string scriptMensagem = string.Format("<script>ChamarExibirMensagemErro('{0}');</script>", nEx.Message);

                ClientScript.RegisterStartupScript(this.GetType(), "ChaveMensagem", scriptMensagem);

                //lblMensagem.Text = nEx.Message;
                //lblMensagem.ForeColor = System.Drawing.Color.Red;                
            }
            catch (PosicaoInvalidaException posicaoEx)
            {
                string scriptMensagem = string.Format("<script>ChamarExibirMensagemErro('{0}');</script>", posicaoEx.Message);
                ClientScript.RegisterStartupScript(this.GetType(), "ChaveMensagem", scriptMensagem);
                //lblMensagem.Text = posicaoEx.Message;
                //lblMensagem.ForeColor = System.Drawing.Color.Red;
            }
            catch (Exception ex)
            {
                string scriptMensagem = string.Format("<script>ChamarExibirMensagemErro('{0}');</script>", ex.Message);
                ClientScript.RegisterStartupScript(this.GetType(), "ChaveMensagem", scriptMensagem);
                //lblMensagem.Text = ex.Message;
                //lblMensagem.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnCalcularIndenizacaoFifa_Click(object sender, EventArgs e)
        {
            try
            {
                Jogador j = new Jogador();

                j.DtConvocacao = Convert.ToDateTime(txtConvocacao.Text);
                j.DtDispensa = Convert.ToDateTime(txtDispensa.Text);

                lblMensagem.Text = j.CalcularIndenizacaoFifa().ToString("C", CultureInfo.CreateSpecificCulture("en-US"));

            }
            catch (Exception indenizacaoEx)
            {
                string scriptMensagem = string.Format("<script>ChamarExibirMensagemErro('{0}');</script>", indenizacaoEx.Message);
                ClientScript.RegisterStartupScript(this.GetType(), "ChaveMensagem", scriptMensagem);

            }
            
        }
    }


}