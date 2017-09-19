using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.IO;

namespace WindowsFormsWebBI
{
    public partial class FormManExcel : Form
    {
        ClassWebBI.Dados.ClassExcel clExcel = new ClassWebBI.Dados.ClassExcel();

        public string sTipo;
        public int iCodigo;

        public FormManExcel()
        {
            InitializeComponent();
        }

        private void AssinalaZoom()
        {
            ClassWebBI.Dados.ClassGrupos clGrupos = new ClassWebBI.Dados.ClassGrupos();
            clGrupos.getGrupo(edtGrupo.Text);
            edtNomeGrupo.Text = clGrupos.fnome;
        }

        public void Inicializa()
        {
            clExcel.getExcel(iCodigo);
            
            lblTipo.Text = sTipo;

            if (sTipo == "Alterar")
            {
                edtCodigo.Text = clExcel.fcod_excel.ToString();
                edtNome.Text = clExcel.fnome;
                edtGrupo.Text = clExcel.fcod_grupo.ToString();
                chkAtivo.Checked = clExcel.fativo;
                edtAssunto.Text = clExcel.fmail_assunto;
                edtMensagem.Text = clExcel.fmail_mensagem;

                edtCodigo.Enabled = false;
                AssinalaZoom();
            }

            if (sTipo == "Incluir")
                edtCodigo.Text = Convert.ToString(clExcel.getMaxCodExcel());
        }

        private bool ValidaTela()
        {
            if (Convert.ToInt32(edtCodigo.Text) <= 0)
            {
                MessageBox.Show("Informe o código do Excel !", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }

            if (edtNome.Text == "")
            {
                MessageBox.Show("Informe o nome do Excel !", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }

            if (edtGrupo.Text == "")
            {
                MessageBox.Show("Informe o nome do Grupo !", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }

            return true;
        }

        private void lblArquivo_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            if (openFileDialog1.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                edtExcel.Text = openFileDialog1.FileName;
                edtNome.Text = openFileDialog1.SafeFileName;
            }
        }

        private void btnConfirmar_Click(object sender, EventArgs e)
        {
            if (ValidaTela() == false)
                return;

            clExcel.fcod_excel =  Convert.ToInt32(edtCodigo.Text);
            clExcel.fnome = edtNome.Text;
            clExcel.fcod_grupo = edtGrupo.Text;
            clExcel.fativo = chkAtivo.Checked;
            clExcel.fnome_arquivo = edtExcel.Text;
            clExcel.fmail_assunto = edtAssunto.Text;
            clExcel.fmail_mensagem = edtMensagem.Text;

            string sAux = clExcel.setExcel(sTipo);

            if (sAux != "")
            {
                MessageBox.Show(sAux, "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error);

                if (sTipo == "Incluir")
                    edtCodigo.Focus();
                else
                    if (sTipo == "Alterar")
                        edtNome.Focus();
                return;
            }
            this.DialogResult = System.Windows.Forms.DialogResult.OK;
        }

        private void edtGrupo_Leave(object sender, EventArgs e)
        {
            AssinalaZoom();
        }

        private void lblGrupo_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            FormGrupos frmGrupos = new FormGrupos();

            frmGrupos.zCodGrupo = edtGrupo.Text;
            frmGrupos.ShowDialog();

            edtGrupo.Text = frmGrupos.zCodGrupo;
            AssinalaZoom();
        }
    }
}
