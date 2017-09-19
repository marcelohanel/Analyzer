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
    public partial class FormAnexos : Form
    {
        public DataTable tblAnexos = new DataTable();
        public int zCodigo = -1;
        public string zArmazenagem = "";

        public FormAnexos()
        {
            InitializeComponent();
        }

        public void GeraTemp()
        {
            this.Text = "Anexos do Título";
            this.Text = this.Text + " do Título " + zCodigo;

            ClassWebBI.Dados.ClassAnexos clAnexos = new ClassWebBI.Dados.ClassAnexos();
            tblAnexos = clAnexos.getAnexos(zCodigo, "DT_GERACAO DESC");

            dataGridView1.DataSource = tblAnexos;

            dataGridView1.Columns["COD_ANEXO"].HeaderText = "Código";
            dataGridView1.Columns["NOME"].HeaderText = "Nome";
            dataGridView1.Columns["TIPO"].HeaderText = "Tipo";
            dataGridView1.Columns["DT_GERACAO"].HeaderText = "Dt.Geração";
            dataGridView1.Columns["HR_GERACAO"].HeaderText = "Hr.Geração";
            dataGridView1.Columns["DIA"].HeaderText = "Dia";
            dataGridView1.Columns["MES"].HeaderText = "Mês";
            dataGridView1.Columns["ANO"].HeaderText = "Ano";
            dataGridView1.Columns["TRIMESTRE"].HeaderText = "Trimestre";
            dataGridView1.Columns["SEMESTRE"].HeaderText = "Semestre";
            dataGridView1.Columns["NUM_SEMANA"].HeaderText = "Semana";
            dataGridView1.Columns["NUM_SEMANA"].Width = 50;
        }
        
        private void btnSair_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void FormAnexos_Shown(object sender, EventArgs e)
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
                tblAnexos.DefaultView.RowFilter = dataGridView1.Columns[cbxPesq.SelectedIndex].Name + " LIKE '" + edtPesq.Text + "%'";
            }
            catch
            {
                try
                {
                    tblAnexos.DefaultView.RowFilter = dataGridView1.Columns[cbxPesq.SelectedIndex].Name + " = " + edtPesq.Text;
                }
                catch
                {
                    tblAnexos.DefaultView.RowFilter = "";
                }
            }
        }

        private void btnAbrir_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("Selecione um registro !", "Informação", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            ClassWebBI.Dados.ClassExcel clExcel = new ClassWebBI.Dados.ClassExcel();
            clExcel.abrirArquivoPDF(Convert.ToInt32(dataGridView1.SelectedRows[0].Cells["COD_ANEXO"].Value.ToString()), false, false);
        }

        private void dataGridView1_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            btnAbrir_Click(sender, e);
        }

        private void btnExcluir_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("Selecione um registro !", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            string sMensagem = string.Format("Confirma a Exclusão do Anexo {0} - {1}",
                dataGridView1.SelectedRows[0].Cells["COD_ANEXO"].Value,
                dataGridView1.SelectedRows[0].Cells["NOME"].Value);

            if (MessageBox.Show(sMensagem, "Confirmar", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.Yes)
            {
                ClassWebBI.Dados.ClassAnexos clAnexos = new ClassWebBI.Dados.ClassAnexos();
                string sAux = clAnexos.delAnexo(Convert.ToInt32(dataGridView1.SelectedRows[0].Cells["COD_ANEXO"].Value.ToString()));

                if (sAux != "")
                {
                    MessageBox.Show(sAux, "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                GeraTemp();
            }
        }

        private void btnEnviar_Click(object sender, EventArgs e)
        {
            FormMail frmEmail = new FormMail();

            frmEmail.iCodAnexo = Convert.ToInt32(dataGridView1.SelectedRows[0].Cells["COD_ANEXO"].Value.ToString());
            frmEmail.iCodTitulo = zCodigo;

            frmEmail.Inicializa();

            frmEmail.ShowDialog();
        }
    }
}
