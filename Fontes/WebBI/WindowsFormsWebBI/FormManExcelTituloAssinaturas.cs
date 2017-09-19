using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace WindowsFormsWebBI
{
    public partial class FormManExcelTituloAssinaturas : Form
    {
        ClassWebBI.Dados.ClassAssinaturas clAssinaturas = new ClassWebBI.Dados.ClassAssinaturas();

        public string sTipo;
        public int iCodTitulo;
        public int iCodUsuario;

        public FormManExcelTituloAssinaturas()
        {
            InitializeComponent();
        }

        public void Inicializa()
        {
            lblTipo.Text = sTipo;
            cbxTipoEnvio.SelectedIndex = 0;

            if (sTipo == "Alterar")
            {
                clAssinaturas.getAssinatura(iCodUsuario, iCodTitulo);

                edtUsuario.Text = clAssinaturas.fusuario;
                edtCodUsuario.Text = clAssinaturas.fcod_usuario.ToString();
                edtNomeUsuario.Text = clAssinaturas.fnome_usuario;
                chkAtivo.Checked = clAssinaturas.fativo;
                edtMailAlternativo.Text = clAssinaturas.femail_alternativo;

                edtUsuario.Enabled = false;
                lblUsuario.Enabled = false;

                if (clAssinaturas.ftipo_envio == "S")
                    cbxTipoEnvio.SelectedIndex = 0;
                else
                    if (clAssinaturas.ftipo_envio == "M")
                        cbxTipoEnvio.SelectedIndex = 1;

                string [] vAux = clAssinaturas.fdias_envio.ToString().Split(new char[] {';'});

                for (int i = 0; i <= vAux.Length - 1; i++)
                    for (int a = 0; a <= chkDias.Items.Count - 1; a++)
                        if (chkDias.Items[a].ToString() == vAux[i].ToString())
                            chkDias.SetItemChecked(a,true);
            }
        }

        private void AssinalaZoom()
        {
            ClassWebBI.Dados.ClassUsuarios clUsuarios = new ClassWebBI.Dados.ClassUsuarios();
            
            clUsuarios.getUsuario(edtUsuario.Text);

            edtNomeUsuario.Text = clUsuarios.fnome;
            edtCodUsuario.Text = clUsuarios.fcod_usuario.ToString();
        }

        private void edtUsuario_Leave(object sender, EventArgs e)
        {
            AssinalaZoom();
        }

        private void lblUsuario_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            FormUsuarios frmUsuarios = new FormUsuarios();

            frmUsuarios.zUsuario = edtUsuario.Text;
            frmUsuarios.ShowDialog();

            edtUsuario.Text = frmUsuarios.zUsuario;
            AssinalaZoom();
        }

        private bool ValidaTela()
        {
            if (Convert.ToInt32(edtCodUsuario.Text) == 0)
            {
                MessageBox.Show("Informe o usuário !", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }

            if (chkDias.CheckedItems.Count == 0)
            {
                MessageBox.Show("Informe os dias a serem enviados os e-mails !", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }

            return true;
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnConfirmar_Click(object sender, EventArgs e)
        {
            if (ValidaTela() == false)
                return;

            clAssinaturas.fcod_usuario = Convert.ToInt32(edtCodUsuario.Text);
            clAssinaturas.fcod_titulo = iCodTitulo;
            clAssinaturas.fativo = chkAtivo.Checked;
            clAssinaturas.femail_alternativo = edtMailAlternativo.Text;

            if (cbxTipoEnvio.SelectedIndex == 0)
                clAssinaturas.ftipo_envio = "S";

            if (cbxTipoEnvio.SelectedIndex == 1)
                clAssinaturas.ftipo_envio = "M";

            string sDias = "";

            for (int i = 0; i <= chkDias.CheckedItems.Count - 1; i++)
            {
                if (sDias == "")
                    sDias = chkDias.CheckedItems[i].ToString();
                else
                    sDias = sDias + ";" + chkDias.CheckedItems[i].ToString();
            }

            clAssinaturas.fdias_envio = sDias;

            string sAux = clAssinaturas.setAssinatura(sTipo);

            if (sAux != "")
            {
                MessageBox.Show(sAux, "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error);

                if (sTipo == "Incluir")
                    edtUsuario.Focus();
                else
                    if (sTipo == "Alterar")
                        cbxTipoEnvio.Focus();

                return;
            }

            this.DialogResult = System.Windows.Forms.DialogResult.OK;
        }

        private void cbxTipoEnvio_SelectedIndexChanged(object sender, EventArgs e)
        {
            chkDias.Items.Clear();

            if (cbxTipoEnvio.SelectedIndex == 0)
            {
                chkDias.Items.Add("Domingo");
                chkDias.Items.Add("Segunda-Feira");
                chkDias.Items.Add("Terça-Feira");
                chkDias.Items.Add("Quarta-Feira");
                chkDias.Items.Add("Quinta-Feira");
                chkDias.Items.Add("Sexta-Feira");
                chkDias.Items.Add("Sábado");
            }

            if (cbxTipoEnvio.SelectedIndex == 1)
            {
                for (int i = 1; i <= 31; i++)
                    chkDias.Items.Add(Convert.ToString(i));
            }
        }
    }
}
