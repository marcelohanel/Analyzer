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
    public partial class FormManExcelTitulos : Form
    {
        ClassWebBI.Dados.ClassTitulos clTitulos = new ClassWebBI.Dados.ClassTitulos();

        public string sTipo;
        public int iCodigo;
        public int iCodExcel;

        public FormManExcelTitulos()
        {
            InitializeComponent();
        }

        public void Inicializa()
        {
            lblTipo.Text = sTipo;

            if (sTipo == "Alterar")
            {
                clTitulos.getTitulo(iCodigo);

                edtCodigo.Text = clTitulos.fcod_titulo.ToString();
                edtNome.Text = clTitulos.fnome;
                chkAtivo.Checked = clTitulos.fativo;
                edtNumPlan.Text = clTitulos.fnum_plan_pdf.ToString();

                edtCodigo.Enabled = false;
                edtNome.Enabled = false;
                cbxTipoArmazenagem.Enabled = false;
            }

            if (sTipo == "Incluir")
                edtCodigo.Text = Convert.ToString(clTitulos.getMaxCodTitulo());
        }

        private bool ValidaTela()
        {
            if (Convert.ToInt32(edtCodigo.Text) <= 0)
            {
                MessageBox.Show("Informe o código do Título !", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }

            if (edtNome.Text == "")
            {
                MessageBox.Show("Informe o nome do Título !", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }

            if (Convert.ToInt32(edtNumPlan.Text) <= 0)
            {
                MessageBox.Show("Informe o número da planilha a ser gerado o PDF !", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }
            
            return true;
        }

        private void btnConfirmar_Click(object sender, EventArgs e)
        {
            if (ValidaTela() == false)
                return;

            clTitulos.fcod_titulo = Convert.ToInt32(edtCodigo.Text);
            clTitulos.fcod_excel = iCodExcel; 
            clTitulos.fnum_plan_pdf = Convert.ToInt32(edtNumPlan.Text);
            clTitulos.fnome = edtNome.Text;
            clTitulos.ftipo_armazenagem = cbxTipoArmazenagem.Text;
            clTitulos.fativo = chkAtivo.Checked;

            string sAux = clTitulos.setTitulo(sTipo);

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

        private void FormManExcelTitulos_Shown(object sender, EventArgs e)
        {
            cbxTipoArmazenagem.SelectedIndex = 0;
        }
    }
}
