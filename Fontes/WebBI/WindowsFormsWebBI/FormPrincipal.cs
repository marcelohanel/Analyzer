using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.IO;
using System.Reflection;

namespace WindowsFormsWebBI
{
    public partial class FormPrincipal : Form
    {
        public FormPrincipal(string[] args)
        {
            InitializeComponent();

            this.Text = AssemblyTitle + " - " + AssemblyVersion;

            ClassWebBI.ClassFuncoes clFuncoes = new ClassWebBI.ClassFuncoes();

            string[] vVersao = AssemblyVersion.Split(new char[] { '.' });
            string sVersao = vVersao[0] + vVersao[1];

            clFuncoes.LeConfig();

            FormLogin frmLogin = new FormLogin(args[1].ToString(), args[2].ToString());
            frmLogin.ShowDialog();
        }

        public string AssemblyVersion
        {
            get
            {
                return Assembly.GetExecutingAssembly().GetName().Version.ToString();
            }
        }

        public string AssemblyTitle
        {
            get
            {
                object[] attributes = Assembly.GetExecutingAssembly().GetCustomAttributes(typeof(AssemblyTitleAttribute), false);
                if (attributes.Length > 0)
                {
                    AssemblyTitleAttribute titleAttribute = (AssemblyTitleAttribute)attributes[0];
                    if (titleAttribute.Title != "")
                    {
                        return titleAttribute.Title;
                    }
                }
                return System.IO.Path.GetFileNameWithoutExtension(Assembly.GetExecutingAssembly().CodeBase);
            }
        }

        private void Inicializa()
        {
            ClassWebBI.ClassFuncoes clFuncoes = new ClassWebBI.ClassFuncoes();

            lblVersao.Text = AssemblyVersion;
            lblData.Text = Convert.ToDateTime(clFuncoes.GetProperties("fData")).ToString("dd/MM/yyyy");
            lblUsuario.Text = clFuncoes.GetProperties("fUsuario").ToString() + " - " +
                clFuncoes.GetProperties("fNomeUsuario").ToString() +
                " (" + clFuncoes.GetProperties("fMail").ToString() + ")";

            if (DateTime.Today.ToString("dd/MM/yyyy") != lblData.Text)
                lblData.ForeColor = Color.Red;
        }

        private void FormPrincipal_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (MessageBox.Show("Deseja realmente encerrar a aplicação ?", "Confirmar", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.No)
                e.Cancel = true;

            new ClassWebBI.ClassFuncoes().LimpaDiretorioUsuarioLogado();
        }

        private void btnFechar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnGrupos_Click(object sender, EventArgs e)
        {
            FormGrupos frmGrupos = new FormGrupos();
            frmGrupos.ShowDialog();
        }

        private void btnUsuarios_Click(object sender, EventArgs e)
        {
            FormUsuarios frmUsuarios = new FormUsuarios();
            frmUsuarios.ShowDialog();
        }

        private void btnExcel_Click(object sender, EventArgs e)
        {
            FormExcel frmExcel = new FormExcel();
            frmExcel.ShowDialog();
        }

        private void btnTitulos_Click(object sender, EventArgs e)
        {
            FormExcelTitulos frmExcelTitulos = new FormExcelTitulos();
            frmExcelTitulos.ShowDialog();

        }

        private void btnParametros_Click(object sender, EventArgs e)
        {
        }

        private void FormPrincipal_Shown(object sender, EventArgs e)
        {
            Inicializa();
        }

    }
}
