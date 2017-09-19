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
    public partial class FormGrupos : Form
    {
        public DataTable tblGrupos = new DataTable();
        public string zCodGrupo = null;

        public FormGrupos()
        {
            InitializeComponent();
        }

        public void Zoom()
        {
            btnExportar.Enabled = true;

            try
            {
                int rowIndex = -1;

                foreach (DataGridViewRow row in dataGridView1.Rows)
                {
                    if (row.Cells["COD_GRUPO"].Value.ToString() == zCodGrupo)
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

        public void GeraTemp()
        {
            this.Text = "Grupos";

            ClassWebBI.Dados.ClassGrupos clGrupos = new ClassWebBI.Dados.ClassGrupos();
            tblGrupos = clGrupos.getGrupos("COD_GRUPO");
            
            dataGridView1.DataSource = tblGrupos;

            dataGridView1.Columns["COD_GRUPO"].HeaderText = "Código";
            dataGridView1.Columns["NOME"].HeaderText = "Nome";
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

            string sMensagem = string.Format("Confirma a Exclusão do Grupo {0} - {1}", 
                dataGridView1.SelectedRows[0].Cells["COD_GRUPO"].Value,
                dataGridView1.SelectedRows[0].Cells["NOME"].Value);

            if (MessageBox.Show(sMensagem, "Confirmar", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.Yes)
            {
                ClassWebBI.Dados.ClassGrupos clGrupos = new ClassWebBI.Dados.ClassGrupos();
                string sAux = clGrupos.delGrupo(dataGridView1.SelectedRows[0].Cells["COD_GRUPO"].Value.ToString());

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
            FormManGrupos frmManGrupos = new FormManGrupos();
            frmManGrupos.sTipo = "Incluir";
            frmManGrupos.Inicializa();
            frmManGrupos.ShowDialog();

            if (frmManGrupos.DialogResult == System.Windows.Forms.DialogResult.OK)
                GeraTemp();
        }

        private void btnAlterar_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("Selecione um registro !", "Informação", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            FormManGrupos frmManGrupos = new FormManGrupos();
            frmManGrupos.sTipo = "Alterar";
            frmManGrupos.sCodGrupo = dataGridView1.SelectedRows[0].Cells["COD_GRUPO"].Value.ToString();

            frmManGrupos.Inicializa();
            frmManGrupos.ShowDialog();

            if (frmManGrupos.DialogResult == System.Windows.Forms.DialogResult.OK)
                GeraTemp();
        }

        private void dataGridView1_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (btnExportar.Enabled)
                btnExportar_Click(sender, e);
            else
                btnAlterar_Click(sender, e);
        }

        private void btnExportar_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("Selecione um registro !", "Informação", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            zCodGrupo = dataGridView1.SelectedRows[0].Cells["COD_GRUPO"].Value.ToString();

            this.Close();
        }

        private void FormGrupos_Shown(object sender, EventArgs e)
        {
            GeraTemp();
            InitPesq();

            if (zCodGrupo != null)
                Zoom();
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
                tblGrupos.DefaultView.RowFilter = dataGridView1.Columns[cbxPesq.SelectedIndex].Name + " LIKE '" + edtPesq.Text + "%'";
            }
            catch
            {
                try
                {
                    tblGrupos.DefaultView.RowFilter = dataGridView1.Columns[cbxPesq.SelectedIndex].Name + " = " + edtPesq.Text;
                }
                catch
                {
                    tblGrupos.DefaultView.RowFilter = "";
                }
            }

        }
    }
}
