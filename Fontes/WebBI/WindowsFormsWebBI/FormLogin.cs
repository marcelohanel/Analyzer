using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace WindowsFormsWebBI
{
    public partial class FormLogin : Form
    {
        string sUsuario = "";
        string sSenha = "";

        public FormLogin(string psUsuario, string psSenha)
        {
            InitializeComponent();

            edtDtMovto.Text = DateTime.Today.ToShortDateString();
            sUsuario = psUsuario;
            sSenha = psSenha;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnConfirmar_Click(object sender, EventArgs e)
        {
            if (new ClassWebBI.ClassLogin().ValidaLogin(sUsuario, sSenha, edtDtMovto.Value) == false)
            {
                MessageBox.Show("As informações para login estão inválidas !", "Informação", MessageBoxButtons.OK, MessageBoxIcon.Information);
                Application.Exit();
            }
            else
            {
                this.Close();
            }
        }
    }
}
