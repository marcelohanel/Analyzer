using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Data.SqlClient;
using System.Data;

namespace ConsoleWebBI
{
    class Program
    {
        static void Main(string[] args)
        {
            string sOperacao = "";
            int iCodUsuario = 0;

            if (args.Length < 2)
                return;

            sOperacao = args[0].ToString();
            iCodUsuario = Convert.ToInt32(args[1].ToString());

            new ClassWebBI.ClassFuncoes().LeConfig();

            if (!new ClassWebBI.ClassLogin().ValidaLogin(iCodUsuario, DateTime.Now))
                return;

            if (sOperacao == "/Atualiza")
            {
                AtualizaExcelAll();
                GeraPDFAll();
                EnviaMailAll();
            }

            new ClassWebBI.ClassFuncoes().LimpaDiretorioUsuarioLogado();
        }

        static void GeraPDFAll()
        {
            ClassWebBI.Dados.ClassExcel clExcel = new ClassWebBI.Dados.ClassExcel();

            DataTable tblAnexos = new DataTable();

            SqlCommand sCommand = new SqlCommand("SELECT COD_TITULO, ATIVO FROM EXCEL_TITULOS WHERE ATIVO = 1 ORDER BY COD_TITULO");

            tblAnexos = new ClassWebBI.ClassFuncoes().ExecReader(sCommand);

            for (int i = 0; i <= tblAnexos.Rows.Count - 1; i++)
                clExcel.gerarPDF(Convert.ToInt32(tblAnexos.Rows[i]["COD_TITULO"].ToString()), true);
        }

        static void AtualizaExcelAll()
        {
            ClassWebBI.Dados.ClassExcel clExcel = new ClassWebBI.Dados.ClassExcel();

            DataTable tblExcel = new DataTable();

            SqlCommand sCommand = new SqlCommand("SELECT COD_EXCEL, ATIVO FROM EXCEL WHERE ATIVO = 1 ORDER BY COD_EXCEL");

            tblExcel = new ClassWebBI.ClassFuncoes().ExecReader(sCommand);

            for (int i = 0; i <= tblExcel.Rows.Count - 1; i++)
                clExcel.atualizaExcel(Convert.ToInt32(tblExcel.Rows[i]["COD_EXCEL"].ToString()));
        }

        static void EnviaMailAll()
        {
            string sAnexo = "";
            string sMail = "";
            int iCodAnexo = 0;
            int iCodTitulo = 0;
            int iCodUsuario = 0;
            string sAssunto = "";
            string sMensagem = "";

            ClassWebBI.Dados.ClassExcel clExcel = new ClassWebBI.Dados.ClassExcel();
            ClassWebBI.Dados.ClassAssinaturas clAssinaturas = new ClassWebBI.Dados.ClassAssinaturas();
            ClassWebBI.Dados.ClassUsuarios clUsuarios = new ClassWebBI.Dados.ClassUsuarios();
            ClassWebBI.ClassFuncoes clFuncoes = new ClassWebBI.ClassFuncoes();
            ClassWebBI.Dados.ClassParametros clParametros = new ClassWebBI.Dados.ClassParametros();

            clParametros.getParametro();

            DataTable tblTitulos = new DataTable();
            DataTable tblAnexos = new DataTable();
            DataTable tblAssinaturas = new DataTable();

            SqlCommand sCommand = new SqlCommand();
            sCommand.CommandText = "SELECT COD_TITULO, COD_EXCEL FROM EXCEL_TITULOS WHERE EXCEL_TITULOS.ATIVO = 1";
            tblTitulos = new ClassWebBI.ClassFuncoes().ExecReader(sCommand);

            for (int i = 0; i <= tblTitulos.Rows.Count - 1; i++)
            {
                clExcel.getExcel(Convert.ToInt32(tblTitulos.Rows[i]["COD_EXCEL"].ToString()));

                SqlCommand sCommand1 = new SqlCommand();

                SqlParameter pTitulo = new SqlParameter("@COD_TITULO", System.Data.SqlDbType.Int);
                sCommand1.Parameters.Add(pTitulo);
                sCommand1.Parameters["@COD_TITULO"].Value = Convert.ToInt32(tblTitulos.Rows[i]["COD_TITULO"].ToString());

                sCommand1.CommandText = "SELECT COD_ANEXO, COD_TITULO" +
                    " FROM EXCEL_TITULO_ANEXOS" +
                    " WHERE COD_TITULO = @COD_TITULO" +
                    " ORDER BY DT_GERACAO DESC";

                tblAnexos = new ClassWebBI.ClassFuncoes().ExecReader(sCommand1);

                sCommand1.Dispose();

                iCodAnexo = Convert.ToInt32(tblAnexos.Rows[0]["COD_ANEXO"].ToString());
                iCodTitulo = Convert.ToInt32(tblAnexos.Rows[0]["COD_TITULO"].ToString());
                sAnexo = clExcel.abrirArquivoPDF(iCodAnexo, false, true);

                tblAssinaturas = clAssinaturas.getAssinaturas(iCodTitulo, "");

                for (int a = 0; a <= tblAssinaturas.Rows.Count - 1; a++)
                {
                    if (Convert.ToBoolean(tblAssinaturas.Rows[a]["ATIVO"]))
                    {
                        iCodUsuario = Convert.ToInt32(tblAssinaturas.Rows[a]["COD_USUARIO"].ToString());

                        clAssinaturas.getAssinatura(iCodUsuario, iCodTitulo);

                        if (clAssinaturas.podeEnviarMail())
                        {
                            clUsuarios.getUsuario(iCodUsuario);

                            if (tblAssinaturas.Rows[a]["EMAIL_ALTERNATIVO"].ToString() == "")
                                sMail = tblAssinaturas.Rows[a]["MAIL"].ToString();
                            else
                                sMail = tblAssinaturas.Rows[a]["EMAIL_ALTERNATIVO"].ToString();

                            sAssunto = clParametros.fmail_assunto;
                            sMensagem = clParametros.fmail_mensagem;

                            if (clExcel.fmail_assunto != "")
                                sAssunto = clExcel.fmail_assunto;

                            if (clExcel.fmail_mensagem != "")
                                sMensagem = clExcel.fmail_mensagem;

                            clFuncoes.EnviaMail(clUsuarios.fservidor_mail,
                                clUsuarios.fporta_mail,
                                clUsuarios.fendereco_mail,
                                sMail,
                                sAssunto,
                                sMensagem,
                                clUsuarios.fusuario_mail,
                                clUsuarios.fsenha_mail,
                                clUsuarios.fssl,
                                sAnexo);
                        }
                    }
                }
            }
        }
    }
}
