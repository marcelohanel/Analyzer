using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace ClassWebBI.Dados
{
    public class ClassTitulos
    {
        private int _cod_titulo;
        private string _nome;
        private int _cod_excel;
        private int _num_plan_pdf;
        private string _tipo_armazenagem;
        private bool _ativo;
        private DateTime _dt_geracao;
        private string _hr_geracao;
    
        public int fcod_titulo
        {
            get
            {
                return _cod_titulo;
            }
            set
            {
                _cod_titulo = value;
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

        public int fnum_plan_pdf
        {
            get
            {
                return _num_plan_pdf;
            }
            set
            {
                _num_plan_pdf = value;
            }
        }

        public string ftipo_armazenagem
        {
            get
            {
                return _tipo_armazenagem;
            }
            set
            {
                _tipo_armazenagem = value;
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

        public DateTime fdt_geracao
        {
            get
            {
                return _dt_geracao;
            }
            set
            {
                _dt_geracao = value;
            }
        }

        public string fhr_geracao
        {
            get
            {
                return _hr_geracao;
            }
            set
            {
                _hr_geracao = value;
            }
        }
        
        public DataTable getTitulos(int CodExcel, string OrderBy)
        {
            ClassFuncoes clFuncoes = new ClassFuncoes();

            SqlCommand sCommand = new SqlCommand();

            System.Data.DataTable tblTitulos = new System.Data.DataTable();

            SqlParameter pCodigo = new SqlParameter("@COD_EXCEL", System.Data.SqlDbType.Int);
            sCommand.Parameters.Add(pCodigo);
            sCommand.Parameters["@COD_EXCEL"].Value = CodExcel;

            if (OrderBy != "")
                sCommand.CommandText = "SELECT COD_TITULO, NOME, ATIVO, TIPO_ARMAZENAGEM, DT_GERACAO, HR_GERACAO" +
                    " FROM EXCEL_TITULOS" +
                    " WHERE COD_EXCEL = @COD_EXCEL" +
                    " ORDER BY " + OrderBy;
            else
                sCommand.CommandText = "SELECT COD_TITULO, NOME, ATIVO, TIPO_ARMAZENAGEM, DT_GERACAO, HR_GERACAO" +
                    " FROM EXCEL_TITULOS" +
                    " WHERE COD_EXCEL = @COD_EXCEL";

            tblTitulos = clFuncoes.ExecReader(sCommand);

            return tblTitulos;
        }

        public string delTitulo(int CodTitulo)
        {
            ClassWebBI.ClassFuncoes clFuncoes = new ClassWebBI.ClassFuncoes();

            SqlCommand sCommand = new SqlCommand();

            SqlParameter pCodigo = new SqlParameter("@COD_TITULO", System.Data.SqlDbType.Int);
            sCommand.Parameters.Add(pCodigo);
            sCommand.Parameters["@COD_TITULO"].Value = CodTitulo;
            sCommand.CommandText = "DELETE FROM EXCEL_TITULOS WHERE COD_TITULO = @COD_TITULO";

            string sAux = clFuncoes.ExecNonQuery(sCommand);

            return sAux;
        }

        public void getTitulo(int CodTitulo)
        {
            ClassFuncoes clFuncoes = new ClassFuncoes();

            SqlCommand sCommand = new SqlCommand();
            System.Data.DataTable tblTitulo = new System.Data.DataTable();

            SqlParameter pCodigo = new SqlParameter("@COD_TITULO", System.Data.SqlDbType.Int);
            sCommand.Parameters.Add(pCodigo);
            sCommand.Parameters["@COD_TITULO"].Value = CodTitulo;

            sCommand.CommandText = "SELECT COD_TITULO, COD_EXCEL, NOME, ATIVO, NUM_PLAN_PDF FROM EXCEL_TITULOS" +
                " WHERE COD_TITULO = @COD_TITULO";

            tblTitulo = clFuncoes.ExecReader(sCommand);

            if (tblTitulo.Rows.Count > 0)
            {
                fcod_titulo = Convert.ToInt32(tblTitulo.Rows[0]["COD_TITULO"].ToString());
                fcod_excel = Convert.ToInt32(tblTitulo.Rows[0]["COD_EXCEL"].ToString());
                fnome = tblTitulo.Rows[0]["NOME"].ToString();
                fativo = Convert.ToBoolean(tblTitulo.Rows[0]["ATIVO"].ToString());
                fnum_plan_pdf = Convert.ToInt32(tblTitulo.Rows[0]["NUM_PLAN_PDF"].ToString());
            }
        }

        public int getMaxCodTitulo()
        {
            ClassWebBI.ClassFuncoes clFuncoes = new ClassWebBI.ClassFuncoes();
            SqlCommand sCommand = new SqlCommand();

            sCommand.Parameters.Clear();
            sCommand.CommandText = "SELECT MAX(COD_TITULO) AS NUM_TITULO FROM EXCEL_TITULOS";

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

        public string setTitulo(string Tipo)
        {
            ClassWebBI.ClassFuncoes clFuncoes = new ClassWebBI.ClassFuncoes();
            SqlCommand sCommand = new SqlCommand();

            SqlParameter pCodigo = new SqlParameter("@COD_TITULO", System.Data.SqlDbType.Int);
            sCommand.Parameters.Add(pCodigo);
            sCommand.Parameters["@COD_TITULO"].Value = fcod_titulo;

            SqlParameter pExcel = new SqlParameter("@COD_EXCEL", System.Data.SqlDbType.Int);
            sCommand.Parameters.Add(pExcel);
            sCommand.Parameters["@COD_EXCEL"].Value = fcod_excel;

            SqlParameter pNumPlan = new SqlParameter("@NUM_PLAN_PDF", System.Data.SqlDbType.Int);
            sCommand.Parameters.Add(pNumPlan);
            sCommand.Parameters["@NUM_PLAN_PDF"].Value = fnum_plan_pdf;

            SqlParameter pNome = new SqlParameter("@NOME", System.Data.SqlDbType.VarChar, 50);
            sCommand.Parameters.Add(pNome);
            sCommand.Parameters["@NOME"].Value = fnome;

            SqlParameter pArmazenagem = new SqlParameter("@TIPO_ARMAZENAGEM", System.Data.SqlDbType.VarChar, 20);
            sCommand.Parameters.Add(pArmazenagem);
            sCommand.Parameters["@TIPO_ARMAZENAGEM"].Value = ftipo_armazenagem;

            SqlParameter pAtivo = new SqlParameter("@ATIVO", System.Data.SqlDbType.Bit);
            sCommand.Parameters.Add(pAtivo);
            sCommand.Parameters["@ATIVO"].Value = fativo;

            if (Tipo == "Incluir")
                sCommand.CommandText = "INSERT INTO EXCEL_TITULOS (COD_TITULO, NOME, NUM_PLAN_PDF, ATIVO, COD_EXCEL, TIPO_ARMAZENAGEM)" +
                    " VALUES (" +
                    "  @COD_TITULO" +
                    ", @NOME" +
                    ", @NUM_PLAN_PDF" +
                    ", @ATIVO" +
                    ", @COD_EXCEL" +
                    ", @TIPO_ARMAZENAGEM )";
            else
                sCommand.CommandText = "UPDATE EXCEL_TITULOS" +
                    " SET NOME = @NOME" +
                    ", ATIVO = @ATIVO" +
                    ", NUM_PLAN_PDF = @NUM_PLAN_PDF" +
                    ", COD_EXCEL = @COD_EXCEL" +
                    ", TIPO_ARMAZENAGEM = @TIPO_ARMAZENAGEM" +
                    " WHERE COD_TITULO = @COD_TITULO";

            string sAux = clFuncoes.ExecNonQuery(sCommand);

            return sAux;
        }


    }
}
