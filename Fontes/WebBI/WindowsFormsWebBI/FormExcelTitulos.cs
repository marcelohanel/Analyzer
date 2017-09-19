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
    public partial class FormExcelTitulos : Form
    {
        public DataTable tblTitulos = new DataTable();
        public int zCodExcel = -1;

        public FormExcelTitulos()
        {
            InitializeComponent();
        }

        public void GeraTemp()
        {
            this.Text = "Títulos do Excel " + zCodExcel.ToString();

            ClassWebBI.Dados.ClassTitulos clTitulos = new ClassWebBI.Dados.ClassTitulos();

            tblTitulos = clTitulos.getTitulos(zCodExcel, "COD_TITULO");

            dataGridView1.DataSource = tblTitulos;

            dataGridView1.Columns["COD_TITULO"].HeaderText = "Código";
            dataGridView1.Columns["NOME"].HeaderText = "Nome";
            dataGridView1.Columns["ATIVO"].HeaderText = "Ativo";
            dataGridView1.Columns["TIPO_ARMAZENAGEM"].HeaderText = "Armazengem";
            dataGridView1.Columns["DT_GERACAO"].HeaderText = "Dt.Geração";
            dataGridView1.Columns["HR_GERACAO"].HeaderText = "Hr.Geração";
        }

        private void btnSair_Click(object sender, EventArgs e)
        {
            this.Close();
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

        private void FormExcelTitulos_Shown(object sender, EventArgs e)
        {
            GeraTemp();
            InitPesq();
        }

        private void edtPesq_TextChanged(object sender, EventArgs e)
        {
            try
            {
                tblTitulos.DefaultView.RowFilter = dataGridView1.Columns[cbxPesq.SelectedIndex].Name + " LIKE '" + edtPesq.Text + "%'";
            }
            catch
            {
                try
                {
                    tblTitulos.DefaultView.RowFilter = dataGridView1.Columns[cbxPesq.SelectedIndex].Name + " = " + edtPesq.Text;
                }
                catch
                {
                    tblTitulos.DefaultView.RowFilter = "";
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

            string sMensagem = string.Format("Confirma a Exclusão do Título {0} - {1}",
                dataGridView1.SelectedRows[0].Cells["COD_TITULO"].Value,
                dataGridView1.SelectedRows[0].Cells["NOME"].Value);

            if (MessageBox.Show(sMensagem, "Confirmar", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.Yes)
            {
                ClassWebBI.Dados.ClassTitulos clTitulos = new ClassWebBI.Dados.ClassTitulos();
                
                string sAux = clTitulos.delTitulo(Convert.ToInt32(dataGridView1.SelectedRows[0].Cells["COD_TITULO"].Value.ToString()));

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
            FormManExcelTitulos frmManExcelTitulos = new FormManExcelTitulos();
            frmManExcelTitulos.sTipo = "Incluir";
            frmManExcelTitulos.iCodExcel = zCodExcel;
            frmManExcelTitulos.Inicializa();
            frmManExcelTitulos.ShowDialog();

            if (frmManExcelTitulos.DialogResult == System.Windows.Forms.DialogResult.OK)
                GeraTemp();
        }

        private void btnAlterar_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("Selecione um registro !", "Informação", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            FormManExcelTitulos frmManExcelTitulos = new FormManExcelTitulos();
            frmManExcelTitulos.sTipo = "Alterar";
            frmManExcelTitulos.iCodigo = Convert.ToInt32(dataGridView1.SelectedRows[0].Cells["COD_TITULO"].Value.ToString());
            frmManExcelTitulos.iCodExcel = zCodExcel;

            frmManExcelTitulos.Inicializa();
            frmManExcelTitulos.ShowDialog();

            if (frmManExcelTitulos.DialogResult == System.Windows.Forms.DialogResult.OK)
                GeraTemp();
        }

        private void dataGridView1_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            btnAlterar_Click(sender, e);
        }

        private void btnGerar_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("Selecione um registro !", "Informação", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            ClassWebBI.Dados.ClassExcel clExcel = new ClassWebBI.Dados.ClassExcel();

            string sArquivo = clExcel.gerarPDF(Convert.ToInt32(dataGridView1.SelectedRows[0].Cells["COD_TITULO"].Value.ToString()), false);

            if (File.Exists(sArquivo))
            {
                new ClassWebBI.ClassFuncoes().ExecProcess(sArquivo, false);
            }
        }

        private void btnArmazenar_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("Selecione um registro !", "Informação", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            if (MessageBox.Show("Deseja realmente gerar e armazenar o PDF do registro selecionado ?", "Confirmar", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.No)
                return;

            ClassWebBI.Dados.ClassExcel clExcel = new ClassWebBI.Dados.ClassExcel();

            string sArquivo = clExcel.gerarPDF(Convert.ToInt32(dataGridView1.SelectedRows[0].Cells["COD_TITULO"].Value.ToString()), true);

            GeraTemp();

            MessageBox.Show("Geração e Armazenagem concluídas !", "Informação", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }


        private void btnAnexos_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("Selecione um registro !", "Informação", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            FormAnexos frmAnexos = new FormAnexos();
            frmAnexos.zCodigo = Convert.ToInt32(dataGridView1.SelectedRows[0].Cells["COD_TITULO"].Value.ToString());
            frmAnexos.zArmazenagem = dataGridView1.SelectedRows[0].Cells["TIPO_ARMAZENAGEM"].Value.ToString();
            frmAnexos.ShowDialog();
        }

        private void btnAssinaturas_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("Selecione um registro !", "Informação", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            FormExcelTituloAssinaturas frmAssinaturas = new FormExcelTituloAssinaturas();
            frmAssinaturas.zCodigo = Convert.ToInt32(dataGridView1.SelectedRows[0].Cells["COD_TITULO"].Value.ToString());
            frmAssinaturas.ShowDialog();
        }
    }
}
