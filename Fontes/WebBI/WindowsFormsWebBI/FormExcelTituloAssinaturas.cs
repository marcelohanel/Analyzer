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
    public partial class FormExcelTituloAssinaturas : Form
    {
        public DataTable tblAssinaturas = new DataTable();
        public int zCodigo = -1;

        public FormExcelTituloAssinaturas()
        {
            InitializeComponent();
        }

        public void GeraTemp()
        {
            this.Text = "Assinaturas do Título";
            this.Text = this.Text + " " + zCodigo;

            ClassWebBI.Dados.ClassAssinaturas clAssinaturas = new ClassWebBI.Dados.ClassAssinaturas();
            
            tblAssinaturas = clAssinaturas.getAssinaturas(zCodigo, "USUARIOS.NOME");

            dataGridView1.DataSource = tblAssinaturas;

            dataGridView1.Columns["COD_USUARIO"].HeaderText = "Cód.Usuário";
            dataGridView1.Columns["ID_USUARIO"].HeaderText = "Usuário";
            dataGridView1.Columns["NOME"].HeaderText = "Nome Usuário";
            dataGridView1.Columns["MAIL"].HeaderText = "E-mail Principal";
            dataGridView1.Columns["EMAIL_ALTERNATIVO"].HeaderText = "E-mail Alternativo";
            dataGridView1.Columns["ATIVO"].HeaderText = "Ativo";
        }
        
        private void btnSair_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void FormExcelTituloAssinaturas_Shown(object sender, EventArgs e)
        {
            GeraTemp();
            InitPesq();
        }

        private void InitPesq()
        {
            cbxPesq.Items.Clear();
            for (int i = 0; i <= dataGridView1.Columns.Count - 1; i++)
            {
                cbxPesq.Items.Add(dataGridView1.Columns[i].HeaderText);
            }
            cbxPesq.SelectedIndex = 0;
        }

        private void edtPesq_TextChanged(object sender, EventArgs e)
        {
            try
            {
                tblAssinaturas.DefaultView.RowFilter = dataGridView1.Columns[cbxPesq.SelectedIndex].Name + " LIKE '" + edtPesq.Text + "%'";
            }
            catch
            {
                try
                {
                    tblAssinaturas.DefaultView.RowFilter = dataGridView1.Columns[cbxPesq.SelectedIndex].Name + " = " + edtPesq.Text;
                }
                catch
                {
                    tblAssinaturas.DefaultView.RowFilter = "";
                }
            }
        }

        private void btnExcluir_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("Selecione um registro !", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            string sMensagem = string.Format("Confirma a Exclusão da Assinatura do Usuário {0}",
                dataGridView1.SelectedRows[0].Cells["NOME"].Value);

            if (MessageBox.Show(sMensagem, "Confirmar", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.Yes)
            {
                ClassWebBI.Dados.ClassAssinaturas clAssintaturas = new ClassWebBI.Dados.ClassAssinaturas();
                string sAux = clAssintaturas.delAssinatura(Convert.ToInt32(dataGridView1.SelectedRows[0].Cells["COD_USUARIO"].Value), zCodigo);

                if (sAux != "")
                {
                    MessageBox.Show(sAux, "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                GeraTemp();
            }

        }

        private void btnIncluir_Click(object sender, EventArgs e)
        {
            FormManExcelTituloAssinaturas frmManAssinatura = new FormManExcelTituloAssinaturas();
            frmManAssinatura.sTipo = "Incluir";
            frmManAssinatura.iCodTitulo = zCodigo;
            frmManAssinatura.Inicializa();
            frmManAssinatura.ShowDialog();

            if (frmManAssinatura.DialogResult == System.Windows.Forms.DialogResult.OK)
                GeraTemp();

        }

        private void btnAlterar_Click(object sender, EventArgs e)
        {
            FormManExcelTituloAssinaturas frmManAssinatura = new FormManExcelTituloAssinaturas();
            frmManAssinatura.sTipo = "Alterar";
            frmManAssinatura.iCodTitulo = zCodigo;
            frmManAssinatura.iCodUsuario = Convert.ToInt32(dataGridView1.SelectedRows[0].Cells["COD_USUARIO"].Value);
            frmManAssinatura.Inicializa();
            frmManAssinatura.ShowDialog();

            if (frmManAssinatura.DialogResult == System.Windows.Forms.DialogResult.OK)
                GeraTemp();

        }

        private void dataGridView1_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            btnAlterar_Click(sender, e);
        }

    }
}
