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
    public partial class FormUsuarios : Form
    {
        public DataTable tblUsuarios = new DataTable();
        public string zUsuario = null;

        public FormUsuarios()
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
                    if (row.Cells["ID_USUARIO"].Value.ToString() == zUsuario)
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
            this.Text = "Usuários";

            ClassWebBI.Dados.ClassUsuarios clUsuarios = new ClassWebBI.Dados.ClassUsuarios();

            tblUsuarios = clUsuarios.getUsuarios("COD_USUARIO");

            dataGridView1.DataSource = tblUsuarios;

            dataGridView1.Columns["COD_USUARIO"].HeaderText = "Código";
            dataGridView1.Columns["ID_USUARIO"].HeaderText = "Usuário";
            dataGridView1.Columns["NOME"].HeaderText = "Nome";
        }

        private void btnSair_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void dataGridView1_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            btnExportar_Click(sender, e);
        }

        private void FormUsuarios_Shown(object sender, EventArgs e)
        {
            GeraTemp();
            InitPesq();

            if (zUsuario != null)
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
                tblUsuarios.DefaultView.RowFilter = dataGridView1.Columns[cbxPesq.SelectedIndex].Name + " LIKE '" + edtPesq.Text + "%'";
            }
            catch
            {
                try
                {
                    tblUsuarios.DefaultView.RowFilter = dataGridView1.Columns[cbxPesq.SelectedIndex].Name + " = " + edtPesq.Text;
                }
                catch
                {
                    tblUsuarios.DefaultView.RowFilter = "";
                }
            }
        }

        private void btnExportar_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("Selecione um registro !", "Informação", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            zUsuario = dataGridView1.SelectedRows[0].Cells["ID_USUARIO"].Value.ToString();

            this.Close();
        }
    }
}
