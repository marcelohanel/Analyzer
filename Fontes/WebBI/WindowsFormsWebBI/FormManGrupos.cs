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
    public partial class FormManGrupos : Form
    {
        ClassWebBI.Dados.ClassGrupos clGrupos = new ClassWebBI.Dados.ClassGrupos();

        public string sTipo;
        public string sCodGrupo;

        public FormManGrupos()
        {
            InitializeComponent();
        }

        public void Inicializa()
        {
            lblTipo.Text = sTipo;

            if (sTipo == "Alterar")
            {
                clGrupos.getGrupo(sCodGrupo);

                edtCodigo.Text = clGrupos.fcod_grupo;
                edtNome.Text = clGrupos.fnome;

                edtCodigo.Enabled = false;
            }
        }

        private void btnConfirmar_Click(object sender, EventArgs e)
        {
            if (ValidaTela() == false)
                return;

            string sAux = "";

            clGrupos.fcod_grupo = edtCodigo.Text;
            clGrupos.fnome = edtNome.Text;

            sAux = clGrupos.setGrupo(sTipo);

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

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private bool ValidaTela()
        {
            if (edtCodigo.Text == "")
            {
                MessageBox.Show("Informe o código do grupo !", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }

            if (edtNome.Text == "")
            {
                MessageBox.Show("Informe o nome do grupo !", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }

            return true;
        }
    }
}
