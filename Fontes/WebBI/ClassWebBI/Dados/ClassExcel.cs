using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using Microsoft.Office.Interop.Excel;
using System.IO;

namespace ClassWebBI.Dados
{
    public class ClassExcel
    {
        private int _cod_excel;
        private string _nome;
        private string _cod_grupo;
        private bool _ativo;
        private DateTime _dt_atualiza;
        private string _hr_atualiza;
        private string _nome_arquivo;
        private string _mail_assunto;
        private string _mail_mensagem;
    
        public int fcod_excel
        {
            get
            {
                return _cod_excel;
            }
            set
            {
                _cod_excel = value;
            }
        }

        public string fnome
        {
            get
            {
                return _nome;
            }
            set
            {
                _nome = value;
            }
        }

        public string fcod_grupo
        {
            get
            {
                return _cod_grupo;
            }
            set
            {
                _cod_grupo = value;
            }
        }

        public bool fativo
        {
            get
            {
                return _ativo;
            }
            set
            {
                _ativo = value;
            }
        }

        public DateTime fdt_atualiza
        {
            get
            {
                return _dt_atualiza;
            }
            set
            {
                _dt_atualiza = value;
            }
        }

        public string fhr_atualiza
        {
            get
            {
                return _hr_atualiza;
            }
            set
            {
                _hr_atualiza = value;
            }
        }

        public string fnome_arquivo
        {
            get
            {
                return _nome_arquivo;
            }
            set
            {
                _nome_arquivo = value;
            }
        }

        public string fmail_assunto
        {
            get
            {
                return _mail_assunto;
            }
            set
            {
                _mail_assunto = value;
            }
        }

        public string fmail_mensagem
        {
            get
            {
                return _mail_mensagem;
            }
            set
            {
                _mail_mensagem = value;
            }
        }

        public System.Data.DataTable getExcels(string OrderBy)
        {
            ClassFuncoes clFuncoes = new ClassFuncoes();

            SqlCommand sCommand = new SqlCommand();
            System.Data.DataTable tblExcel = new System.Data.DataTable();

            if (OrderBy != "")
            {
                sCommand.CommandText = "SELECT COD_EXCEL, NOME, COD_GRUPO, ATIVO, DT_ATUALIZA, HR_ATUALIZA FROM EXCEL ORDER BY " + OrderBy;
            }
            else
            {
                sCommand.CommandText = "SELECT COD_EXCEL, NOME, COD_GRUPO, ATIVO, DT_ATUALIZA, HR_ATUALIZA FROM EXCEL";
            }

            tblExcel = clFuncoes.ExecReader(sCommand);

            return tblExcel;
        }

        public string delExcel(int CodExcel)
        {
            ClassWebBI.ClassFuncoes clFuncoes = new ClassWebBI.ClassFuncoes();

            SqlCommand sCommand = new SqlCommand();

            SqlParameter pCodExcel = new SqlParameter("@COD_EXCEL", System.Data.SqlDbType.Int);
            sCommand.Parameters.Add(pCodExcel);
            sCommand.Parameters["@COD_EXCEL"].Value = CodExcel;
            sCommand.CommandText = "DELETE FROM EXCEL WHERE COD_EXCEL = @COD_EXCEL";

            string sAux = clFuncoes.ExecNonQuery(sCommand);

            return sAux;
        }

        public string abrirArquivoExcel(int CodExcel, bool Wait)
        {
            ClassWebBI.ClassFuncoes clFuncoes = new ClassWebBI.ClassFuncoes();

            SqlCommand sCommand = new SqlCommand();
            System.Data.DataTable tblArq = new System.Data.DataTable();

            SqlParameter pCodigo = new SqlParameter("@COD_EXCEL", System.Data.SqlDbType.Int);
            sCommand.Parameters.Add(pCodigo);
            sCommand.Parameters["@COD_EXCEL"].Value = CodExcel;
            sCommand.CommandText = "SELECT NOME, ARQUIVO FROM EXCEL WHERE COD_EXCEL = @COD_EXCEL";

            tblArq = clFuncoes.ExecReader(sCommand);
            string nomeArq = "";

            if (tblArq.Rows.Count > 0)
            {
                nomeArq = clFuncoes.GetProperties("fTempDirUsuario").ToString() + tblArq.Rows[0]["NOME"].ToString();
                byte[] arquivo = (byte[])tblArq.Rows[0]["ARQUIVO"];

                salvaArquivoExcel(CodExcel);
            }

            if (File.Exists(@nomeArq))
            {
                clFuncoes.ExecProcess(@nomeArq, Wait);
            }

            return @nomeArq;
        }

        public void atualizaExcel(int CodExcel)
        {
            string Arquivo = salvaArquivoExcel(CodExcel);

            if (!File.Exists(Arquivo))
                return;

            Application xlsApp = new Application();

            if (xlsApp == null)
                return;

            Workbook workbook = xlsApp.Workbooks.Open(Arquivo);
            workbook.RefreshAll();

            workbook.Close(true);
            workbook = null;

            xlsApp.Quit();
            xlsApp = null;

            GC.Collect();
            GC.WaitForPendingFinalizers();

            ClassWebBI.ClassFuncoes clFuncoes = new ClassWebBI.ClassFuncoes();

            SqlCommand sCommand = new SqlCommand();

            SqlParameter pCodigo = new SqlParameter("@COD_EXCEL", System.Data.SqlDbType.Int);
            sCommand.Parameters.Add(pCodigo);
            sCommand.Parameters["@COD_EXCEL"].Value = CodExcel;

            SqlParameter pAtualiza = new SqlParameter("@DT_ATUALIZA", System.Data.SqlDbType.DateTime);
            sCommand.Parameters.Add(pAtualiza);
            sCommand.Parameters["@DT_ATUALIZA"].Value = clFuncoes.GetProperties("fData");

            SqlParameter pHrAtualiza = new SqlParameter("@HR_ATUALIZA", System.Data.SqlDbType.VarChar, 5);
            sCommand.Parameters.Add(pHrAtualiza);
            sCommand.Parameters["@HR_ATUALIZA"].Value = DateTime.Now.ToString("HH:mm");

            byte[] fArquivo = null;
            fArquivo = clFuncoes.CarregarArquivo(Arquivo);
            SqlParameter pExcel = new SqlParameter("@ARQUIVO", System.Data.SqlDbType.Image, fArquivo.Length);
            sCommand.Parameters.Add(pExcel);
            sCommand.Parameters["@ARQUIVO"].Value = fArquivo;

            sCommand.CommandText = "UPDATE EXCEL" +
                        " SET DT_ATUALIZA = @DT_ATUALIZA" +
                        ", ARQUIVO = @ARQUIVO" +
                        ", HR_ATUALIZA = @HR_ATUALIZA" +
                        " WHERE COD_EXCEL = @COD_EXCEL";

            string sAux = clFuncoes.ExecNonQuery(sCommand);
        }

        public string salvaArquivoExcel(int CodExcel)
        {
            ClassWebBI.ClassFuncoes clFuncoes = new ClassWebBI.ClassFuncoes();

            SqlCommand sCommand = new SqlCommand();
            System.Data.DataTable tblArq = new System.Data.DataTable();

            SqlParameter pCodigo = new SqlParameter("@COD_EXCEL", System.Data.SqlDbType.Int);
            sCommand.Parameters.Add(pCodigo);
            sCommand.Parameters["@COD_EXCEL"].Value = CodExcel;
            sCommand.CommandText = "SELECT NOME, ARQUIVO FROM EXCEL WHERE COD_EXCEL = @COD_EXCEL";

            tblArq = clFuncoes.ExecReader(sCommand);

            string nomeArq = "";

            if (tblArq.Rows.Count > 0)
            {
                nomeArq = clFuncoes.GetProperties("fTempDirUsuario").ToString() + tblArq.Rows[0]["NOME"].ToString();
                byte[] arquivo = (byte[])tblArq.Rows[0]["ARQUIVO"];

                clFuncoes.SalvaArquivo(@nomeArq, arquivo);
            }

            return @nomeArq;
        }

        public string abrirArquivoPDF(int CodAnexo, bool Wait, bool SomenteGerar)
        {
            ClassWebBI.ClassFuncoes clFuncoes = new ClassWebBI.ClassFuncoes();

            SqlCommand sCommand = new SqlCommand();
            System.Data.DataTable tblArq = new System.Data.DataTable();

            SqlParameter pCodigo = new SqlParameter("@COD_ANEXO", System.Data.SqlDbType.Int);
            sCommand.Parameters.Add(pCodigo);
            sCommand.Parameters["@COD_ANEXO"].Value = CodAnexo;
            sCommand.CommandText = "SELECT NOME, ARQUIVO FROM EXCEL_TITULO_ANEXOS WHERE COD_ANEXO = @COD_ANEXO";

            tblArq = clFuncoes.ExecReader(sCommand);
            string nomeArq = "";

            if (tblArq.Rows.Count > 0)
            {
                nomeArq = clFuncoes.GetProperties("fTempDirUsuario").ToString() + tblArq.Rows[0]["NOME"].ToString();
                byte[] arquivo = (byte[])tblArq.Rows[0]["ARQUIVO"];

                clFuncoes.SalvaArquivo(@nomeArq, arquivo);
            }

            if (!SomenteGerar)
            {
                if (File.Exists(@nomeArq))
                {
                    clFuncoes.ExecProcess(@nomeArq, Wait);
                }
            }

            return @nomeArq;
        }

        private void adicionaAnexoBase(int CodTitulo, string ArquivoAnexo, string TipoAnexo, string NomeAnexo, DateTime DtGeracao, string HrGeracao)
        {
            int iCodAnexo = 1;

            ClassWebBI.ClassFuncoes clFuncoes = new ClassWebBI.ClassFuncoes();

            SqlCommand sCommand = new SqlCommand();

            SqlParameter pCodTitulo = new SqlParameter("@COD_TITULO", System.Data.SqlDbType.Int);
            sCommand.Parameters.Add(pCodTitulo);
            sCommand.Parameters["@COD_TITULO"].Value = CodTitulo;

            SqlParameter pNome = new SqlParameter("@NOME", System.Data.SqlDbType.VarChar, 50);
            sCommand.Parameters.Add(pNome);
            sCommand.Parameters["@NOME"].Value = NomeAnexo;

            SqlParameter pTipoAnexo = new SqlParameter("@TIPO_ANEXO", System.Data.SqlDbType.VarChar, 20);
            sCommand.Parameters.Add(pTipoAnexo);
            sCommand.Parameters["@TIPO_ANEXO"].Value = TipoAnexo;

            SqlParameter pDtGeracao = new SqlParameter("@DT_GERACAO", System.Data.SqlDbType.DateTime);
            sCommand.Parameters.Add(pDtGeracao);
            sCommand.Parameters["@DT_GERACAO"].Value = DtGeracao;

            SqlParameter pHrGeracao = new SqlParameter("@HR_GERACAO", System.Data.SqlDbType.VarChar, 5);
            sCommand.Parameters.Add(pHrGeracao);
            sCommand.Parameters["@HR_GERACAO"].Value = HrGeracao;

            SqlParameter pCodAnexo = new SqlParameter("@COD_ANEXO", System.Data.SqlDbType.Int);
            sCommand.Parameters.Add(pCodAnexo);
            sCommand.Parameters["@COD_ANEXO"].Value = iCodAnexo;

            byte[] fArquivo = null;
            fArquivo = clFuncoes.CarregarArquivo(@ArquivoAnexo);
            SqlParameter pAnexo = new SqlParameter("@ARQUIVO", System.Data.SqlDbType.Image, fArquivo.Length);
            sCommand.Parameters.Add(pAnexo);
            sCommand.Parameters["@ARQUIVO"].Value = fArquivo;

            sCommand.CommandText = "SELECT COD_ANEXO FROM EXCEL_TITULO_ANEXOS WHERE NOME = @NOME";

            string sNovoAnexo = clFuncoes.ExecScalar(sCommand);

            if (sNovoAnexo == "")
            {
                sCommand.CommandText = "SELECT MAX(COD_ANEXO) AS NUM_ANEXO FROM EXCEL_TITULO_ANEXOS";
                string sCodAnexo = clFuncoes.ExecScalar(sCommand);

                try
                {
                    iCodAnexo = Convert.ToInt32(sCodAnexo) + 1;
                }
                catch
                {
                }

                pCodAnexo.Value = iCodAnexo;

                sCommand.CommandText = "INSERT INTO EXCEL_TITULO_ANEXOS (COD_ANEXO, NOME, COD_TITULO, ARQUIVO, TIPO, DT_GERACAO, HR_GERACAO)" +
                    " VALUES (" +
                    "  @COD_ANEXO" +
                    ", @NOME" +
                    ", @COD_TITULO" +
                    ", @ARQUIVO" +
                    ", @TIPO_ANEXO" +
                    ", @DT_GERACAO" +
                    ", @HR_GERACAO" +
                    ")";

                string sAux = clFuncoes.ExecNonQuery(sCommand);
            }
            else
            {
                try
                {
                    iCodAnexo = Convert.ToInt32(sNovoAnexo);
                    pCodAnexo.Value = iCodAnexo;

                    sCommand.CommandText = "UPDATE EXCEL_TITULO_ANEXOS" +
                        " SET NOME = @NOME" +
                        ", COD_TITULO = @COD_TITULO" +
                        ", ARQUIVO = @ARQUIVO" +
                        ", TIPO = @TIPO_ANEXO" +
                        ", DT_GERACAO = @DT_GERACAO" +
                        ", HR_GERACAO = @HR_GERACAO" +
                        " WHERE COD_ANEXO = @COD_ANEXO";

                    string sAux = clFuncoes.ExecNonQuery(sCommand);
                }
                catch
                {
                }
            }
        }
        
        public string gerarPDF(int CodTitulo, bool Armazenar)
        {
            ClassWebBI.ClassFuncoes clFuncoes = new ClassWebBI.ClassFuncoes();

            SqlCommand sCommand = new SqlCommand();
            System.Data.DataTable tblTitulo = new System.Data.DataTable();

            SqlParameter pCodigo = new SqlParameter("@COD_TITULO", System.Data.SqlDbType.Int);
            sCommand.Parameters.Add(pCodigo);
            sCommand.Parameters["@COD_TITULO"].Value = CodTitulo;

            SqlParameter pAtualiza = new SqlParameter("@DT_GERACAO", System.Data.SqlDbType.DateTime);
            sCommand.Parameters.Add(pAtualiza);
            sCommand.Parameters["@DT_GERACAO"].Value = clFuncoes.GetProperties("fData");

            SqlParameter pHrAtualiza = new SqlParameter("@HR_GERACAO", System.Data.SqlDbType.VarChar, 5);
            sCommand.Parameters.Add(pHrAtualiza);
            sCommand.Parameters["@HR_GERACAO"].Value = DateTime.Now.ToString("HH:mm");

            sCommand.CommandText = "SELECT COD_TITULO, NOME, COD_EXCEL, NUM_PLAN_PDF, TIPO_ARMAZENAGEM FROM EXCEL_TITULOS WHERE COD_TITULO = @COD_TITULO";

            tblTitulo = clFuncoes.ExecReader(sCommand);

            if (tblTitulo.Rows.Count <= 0)
                return "";

            string Arquivo = salvaArquivoExcel(Convert.ToInt32(tblTitulo.Rows[0]["COD_EXCEL"].ToString()));

            if (!File.Exists(Arquivo))
                return "";

            Application xlsApp = new Application();

            if (xlsApp == null)
                return "";

            string NomeSimples = tblTitulo.Rows[0]["NOME"].ToString().Replace(" ", "") +
                "_" + clFuncoes.GetDataParcial(Convert.ToDateTime(pAtualiza.Value), tblTitulo.Rows[0]["TIPO_ARMAZENAGEM"].ToString());

            string Nome = clFuncoes.GetProperties("fTempDirUsuario").ToString() + NomeSimples + ".pdf";

            Workbook workbook = xlsApp.Workbooks.Open(Arquivo);
            Worksheet worksheet = workbook.Sheets[Convert.ToInt32(tblTitulo.Rows[0]["NUM_PLAN_PDF"].ToString())] as Worksheet;

            worksheet.ExportAsFixedFormat(XlFixedFormatType.xlTypePDF, @Nome, XlFixedFormatQuality.xlQualityStandard);

            //GC.Collect();
           // GC.WaitForPendingFinalizers();

            workbook.Close(true);
            workbook = null;

            xlsApp.Quit();
            xlsApp = null;

            if (Armazenar)
            {
                sCommand.CommandText = "UPDATE EXCEL_TITULOS" +
                            " SET DT_GERACAO = @DT_GERACAO" +
                            ", HR_GERACAO = @HR_GERACAO" +
                            " WHERE COD_TITULO = @COD_TITULO";

                string sAux = clFuncoes.ExecNonQuery(sCommand);

                sAux = NomeSimples + ".pdf";

                adicionaAnexoBase(Convert.ToInt32(pCodigo.Value),
                    @Nome,
                    "PDF",
                    sAux,
                    Convert.ToDateTime(pAtualiza.Value),
                    pHrAtualiza.Value.ToString());
            }

            return @Nome;
        }

        public void getExcel(int CodExcel)
        {
            ClassFuncoes clFuncoes = new ClassFuncoes();

            SqlCommand sCommand = new SqlCommand();
            System.Data.DataTable tblExcel = new System.Data.DataTable();
            
            SqlParameter pCodigo = new SqlParameter("@COD_EXCEL", System.Data.SqlDbType.Int);
            sCommand.Parameters.Add(pCodigo);
            sCommand.Parameters["@COD_EXCEL"].Value = CodExcel;

            sCommand.CommandText = "SELECT COD_EXCEL, NOME, ATIVO, COD_GRUPO, MAIL_ASSUNTO, MAIL_MENSAGEM FROM EXCEL" +
                " WHERE COD_EXCEL = @COD_EXCEL";

            tblExcel = clFuncoes.ExecReader(sCommand);

            if (tblExcel.Rows.Count > 0)
            {
                fcod_excel = Convert.ToInt32(tblExcel.Rows[0]["COD_EXCEL"].ToString());
                fnome = tblExcel.Rows[0]["NOME"].ToString();
                fativo = Convert.ToBoolean(tblExcel.Rows[0]["ATIVO"].ToString());
                fcod_grupo = tblExcel.Rows[0]["COD_GRUPO"].ToString();
                fmail_assunto = tblExcel.Rows[0]["MAIL_ASSUNTO"].ToString();
                fmail_mensagem = tblExcel.Rows[0]["MAIL_MENSAGEM"].ToString();
            }
        }

        public int getMaxCodExcel()
        {
            ClassWebBI.ClassFuncoes clFuncoes = new ClassWebBI.ClassFuncoes();
            SqlCommand sCommand = new SqlCommand();

            sCommand.Parameters.Clear();
            sCommand.CommandText = "SELECT MAX(COD_EXCEL) AS NUM_EXCEL FROM EXCEL";

            string sAux = clFuncoes.ExecScalar(sCommand);

            int iCodigo = 1;

            try
            {
                iCodigo = Convert.ToInt32(sAux) + 1;
            }
            catch
            {
            }

            return iCodigo;
        }

        public string setExcel(string Tipo)
        {
            ClassWebBI.ClassFuncoes clFuncoes = new ClassWebBI.ClassFuncoes();
            SqlCommand sCommand = new SqlCommand();

            SqlParameter pCodigo = new SqlParameter("@COD_EXCEL", System.Data.SqlDbType.Int);
            sCommand.Parameters.Add(pCodigo);
            sCommand.Parameters["@COD_EXCEL"].Value = fcod_excel;

            SqlParameter pNome = new SqlParameter("@NOME", System.Data.SqlDbType.VarChar, 100);
            sCommand.Parameters.Add(pNome);
            sCommand.Parameters["@NOME"].Value = fnome;

            SqlParameter pGrupo = new SqlParameter("@COD_GRUPO", System.Data.SqlDbType.VarChar, 10);
            sCommand.Parameters.Add(pGrupo);
            sCommand.Parameters["@COD_GRUPO"].Value = fcod_grupo;

            SqlParameter pAtivo = new SqlParameter("@ATIVO", System.Data.SqlDbType.Bit);
            sCommand.Parameters.Add(pAtivo);
            sCommand.Parameters["@ATIVO"].Value = fativo;

            SqlParameter pAssunto = new SqlParameter("@MAIL_ASSUNTO", System.Data.SqlDbType.VarChar, 100);
            sCommand.Parameters.Add(pAssunto);
            sCommand.Parameters["@MAIL_ASSUNTO"].Value = fmail_assunto;

            SqlParameter pMensagem = new SqlParameter("@MAIL_MENSAGEM", System.Data.SqlDbType.VarChar, 500);
            sCommand.Parameters.Add(pMensagem);
            sCommand.Parameters["@MAIL_MENSAGEM"].Value = fmail_mensagem;

            if (fnome_arquivo != "")
            {
                byte[] fArquivo = null;
                fArquivo = clFuncoes.CarregarArquivo(fnome_arquivo);
                SqlParameter pExcel = new SqlParameter("@ARQUIVO", System.Data.SqlDbType.Image, fArquivo.Length);
                sCommand.Parameters.Add(pExcel);
                sCommand.Parameters["@ARQUIVO"].Value = fArquivo;
            }
            
            if (Tipo == "Incluir")
                sCommand.CommandText = "INSERT INTO EXCEL (COD_EXCEL, NOME, ATIVO, ARQUIVO, COD_GRUPO, MAIL_ASSUNTO, MAIL_MENSAGEM)" +
                    " VALUES (" +
                    "  @COD_EXCEL" +
                    ", @NOME" +
                    ", @ATIVO" +
                    ", @ARQUIVO" +
                    ", @COD_GRUPO" +
                    ", @MAIL_ASSUNTO" +
                    ", @MAIL_MENSAGEM )";
            else
                if (fnome_arquivo != "")
                {
                    sCommand.CommandText = "UPDATE EXCEL" +
                        " SET NOME = @NOME" +
                        ", ATIVO = @ATIVO" +
                        ", ARQUIVO = @ARQUIVO" +
                        ", COD_GRUPO = @COD_GRUPO" +
                        ", MAIL_ASSUNTO = @MAIL_ASSUNTO" +
                        ", MAIL_MENSAGEM = @MAIL_MENSAGEM" +
                        " WHERE COD_EXCEL = @COD_EXCEL";
                }
                else
                {
                    sCommand.CommandText = "UPDATE EXCEL" +
                        " SET NOME = @NOME" +
                        ", ATIVO = @ATIVO" +
                        ", COD_GRUPO = @COD_GRUPO" +
                        ", MAIL_ASSUNTO = @MAIL_ASSUNTO" +
                        ", MAIL_MENSAGEM = @MAIL_MENSAGEM" +
                        " WHERE COD_EXCEL = @COD_EXCEL";
                }

            string sAux = clFuncoes.ExecNonQuery(sCommand);

            return sAux;
        }
    }
}
