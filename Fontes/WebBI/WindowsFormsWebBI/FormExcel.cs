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
    public partial class FormExcel : Form
    {
        public DataTable tblExcel = new DataTable();
        public int zCodigo = -1;

        public FormExcel()
        {
            InitializeComponent();
        }

        public void GeraTemp()
        {
            this.Text = "Arquivos Excel";

            ClassWebBI.Dados.ClassExcel clExcel = new ClassWebBI.Dados.ClassExcel();
            tblExcel = clExcel.getExcels("COD_EXCEL");

            dataGridView1.DataSource = tblExcel;

            dataGridView1.Columns["COD_EXCEL"].HeaderText = "Código";
            dataGridView1.Columns["NOME"].HeaderText = "Nome";
            dataGridView1.Columns["COD_GRUPO"].HeaderText = "Grupo";
            dataGridView1.Columns["ATIVO"].HeaderText = "Ativo";
            dataGridView1.Columns["DT_ATUALIZA"].HeaderText = "Dt.Atualiza";
            dataGridView1.Columns["HR_ATUALIZA"].HeaderText = "Hr.Atualiza";
        }
        
        public void Zoom()
        {
            btnExportar.Enabled = true;

            try
            {
                int rowIndex = -1;

                foreach (DataGridViewRow row in dataGridView1.Rows)
                {
                    if (row.Cells["COD_EXCEL"].Value.ToString() == zCodigo.ToString())
                    {
                        rowIndex = row.Index;
                        break;
                    }
                }

                dataGridView1.Rows[rowIndex].Selected = true;
            }
            catch
            {
            }
        }
        
        private void btnSair_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnExcluir_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("Selecione um registro !", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            string sMensagem = string.Format("Confirma a Exclusão do Excel {0} - {1}",
                dataGridView1.SelectedRows[0].Cells["COD_EXCEL"].Value,
                dataGridView1.SelectedRows[0].Cells["NOME"].Value);

            if (MessageBox.Show(sMensagem, "Confirmar", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.Yes)
            {
                ClassWebBI.Dados.ClassExcel clExcel = new ClassWebBI.Dados.ClassExcel();

                string sAux = clExcel.delExcel(Convert.ToInt32(dataGridView1.SelectedRows[0].Cells["COD_EXCEL"].Value.ToString()));
                
                if (sAux != "")
                {
                    MessageBox.Show(sAux, "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                GeraTemp();
            }
        }

        private void dataGridView1_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (btnExportar.Enabled)
                btnExportar_Click(sender, e);
            else
                btnAlterar_Click(sender, e);
        }

        private void btnAlterar_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("Selecione um registro !", "Informação", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            FormManExcel frmManExcel = new FormManExcel();
            frmManExcel.sTipo = "Alterar";
            frmManExcel.iCodigo = Convert.ToInt32(dataGridView1.SelectedRows[0].Cells["COD_EXCEL"].Value.ToString());

            frmManExcel.Inicializa();
            frmManExcel.ShowDialog();

            if (frmManExcel.DialogResult == System.Windows.Forms.DialogResult.OK)
                GeraTemp();
        }

        private void btnExportar_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("Selecione um registro !", "Informação", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            try
            {
                zCodigo = Convert.ToInt32(dataGridView1.SelectedRows[0].Cells["COD_EXCEL"].Value.ToString());
            }
            catch
            {
                zCodigo = -1;
            }

            this.Close();

        }

        private void FormExcel_Shown(object sender, EventArgs e)
        {
            GeraTemp();
            InitPesq();

            if (zCodigo != -1)
                Zoom();
        }

        private void btnIncluir_Click(object sender, EventArgs e)
        {
            FormManExcel frmManExcel = new FormManExcel();
            frmManExcel.sTipo = "Incluir";
            frmManExcel.Inicializa();
            frmManExcel.ShowDialog();

            if (frmManExcel.DialogResult == System.Windows.Forms.DialogResult.OK)
                GeraTemp();
        }

        private void btnAbrir_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("Selecione um registro !", "Informação", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            ClassWebBI.Dados.ClassExcel clExcel = new ClassWebBI.Dados.ClassExcel();
            clExcel.abrirArquivoExcel(Convert.ToInt32(dataGridView1.SelectedRows[0].Cells["COD_EXCEL"].Value.ToString()),false);
        }

        private void btnAtualizar_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("Selecione um registro !", "Informação", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            if (MessageBox.Show("Deseja realmente atualizar o registro selecionado ?", "Confirmar", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.No)
                return;

            ClassWebBI.Dados.ClassExcel clExcel = new ClassWebBI.Dados.ClassExcel();

            clExcel.atualizaExcel(Convert.ToInt32(dataGridView1.SelectedRows[0].Cells["COD_EXCEL"].Value.ToString()));

            GeraTemp();
            
            MessageBox.Show("Atualização Completa !", "Informação", MessageBoxButtons.OK, MessageBoxIcon.Information);
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
                tblExcel.DefaultView.RowFilter = dataGridView1.Columns[cbxPesq.SelectedIndex].Name + " LIKE '" + edtPesq.Text + "%'";
            }
            catch
            {
                try
                {
                    tblExcel.DefaultView.RowFilter = dataGridView1.Columns[cbxPesq.SelectedIndex].Name + " = " + edtPesq.Text;
                }
                catch
                {
                    tblExcel.DefaultView.RowFilter = "";
                }
            }

        }

        private void btnTitulos_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("Selecione um registro !", "Informação", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            FormExcelTitulos frmExcelTitulos = new FormExcelTitulos();
            frmExcelTitulos.zCodExcel = Convert.ToInt32(dataGridView1.SelectedRows[0].Cells["COD_EXCEL"].Value.ToString());
            frmExcelTitulos.ShowDialog();

        }
    }
}
