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
    public partial class FormMail : Form
    {
        public int iCodAnexo;
        public int iCodTitulo;

        public FormMail()
        {
            InitializeComponent();
        }

        private void btnConfirmar_Click(object sender, EventArgs e)
        {
            if (edtDe.Text == "")
            {
                MessageBox.Show("Configure o usuário de origem !", "Atenção", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            if (cbxPara.Text == "")
            {
                MessageBox.Show("Informe o usuário de destino !", "Informações", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            if (edtAssunto.Text == "")
            {
                MessageBox.Show("Informe o assunto !", "Informações", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            if (edtMensagem.Text == "")
            {
                MessageBox.Show("Informe a mensagem !", "Informações", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            ClassWebBI.ClassFuncoes clFuncoes = new ClassWebBI.ClassFuncoes();
            ClassWebBI.Dados.ClassUsuarios clUsuarios = new ClassWebBI.Dados.ClassUsuarios();

            clUsuarios.getUsuario(Convert.ToInt32(clFuncoes.GetProperties("fCodUsuario").ToString()));

            clFuncoes.EnviaMail(clUsuarios.fservidor_mail,
                clUsuarios.fporta_mail,
                clUsuarios.fendereco_mail,
                cbxPara.Text,
                edtAssunto.Text,
                edtMensagem.Text,
                clUsuarios.fusuario_mail,
                clUsuarios.fsenha_mail,
                clUsuarios.fssl,
                edtAnexo.Text);
            
            this.DialogResult = System.Windows.Forms.DialogResult.OK;
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.DialogResult = System.Windows.Forms.DialogResult.Cancel;
        }

        public void Inicializa()
        {
            DataTable tblAssinaturas = new DataTable();

            ClassWebBI.ClassFuncoes clFuncoes = new ClassWebBI.ClassFuncoes();
            ClassWebBI.Dados.ClassExcel clExcel = new ClassWebBI.Dados.ClassExcel();
            ClassWebBI.Dados.ClassTitulos clTitulos = new ClassWebBI.Dados.ClassTitulos();
            ClassWebBI.Dados.ClassParametros clParametros = new ClassWebBI.Dados.ClassParametros();
            ClassWebBI.Dados.ClassAssinaturas clAssinaturas = new ClassWebBI.Dados.ClassAssinaturas();

            clParametros.getParametro();
            clTitulos.getTitulo(iCodTitulo);
            clExcel.getExcel(clTitulos.fcod_excel);

            edtDe.Text = clFuncoes.GetProperties("fMail").ToString();

            edtAssunto.Text = clParametros.fmail_assunto;
            edtMensagem.Text = clParametros.fmail_mensagem;

            if (clExcel.fmail_mensagem != "")
                edtMensagem.Text = clExcel.fmail_mensagem;

            if (clExcel.fmail_assunto != "")
                edtAssunto.Text = clExcel.fmail_assunto;
            
            edtAnexo.Text = clExcel.abrirArquivoPDF(iCodAnexo, false, true);
            
            tblAssinaturas = clAssinaturas.getAssinaturas(iCodTitulo, "USUARIOS.MAIL");

            for (int i = 0; i <= tblAssinaturas.Rows.Count - 1; i++)
            {
                cbxPara.Items.Add(tblAssinaturas.Rows[i]["MAIL"].ToString());
            }
        }
    }
}
