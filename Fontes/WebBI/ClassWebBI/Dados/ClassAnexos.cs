using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace ClassWebBI.Dados
{
    public class ClassAnexos
    {
        private int _cod_anexo;
        private string _nome;
        private int _cod_titulo;
        private string _tipo;
        private DateTime _dt_geracao;
        private string _hr_geracao;
    
        public int fcod_anexo
        {
            get
            {
                return _cod_anexo;
            }
            set
            {
                _cod_anexo = value;
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

        public string ftipo
        {
            get
            {
                return _tipo;
            }
            set
            {
                _tipo = value;
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

        public DataTable getAnexos(int CodTitulo, string OrderBy)
        {
            ClassFuncoes clFuncoes = new ClassFuncoes();

            SqlCommand sCommand = new SqlCommand();
            DataTable tblAnexos = new DataTable();

            SqlParameter pCodigo = new SqlParameter("@COD_TITULO", System.Data.SqlDbType.Int);
            sCommand.Parameters.Add(pCodigo);
            sCommand.Parameters["@COD_TITULO"].Value = CodTitulo;

            if (OrderBy != "")
            {
                sCommand.CommandText = "SELECT COD_ANEXO, NOME, TIPO, TEMPO.DIA, TEMPO.MES, TEMPO.ANO, TEMPO.TRIMESTRE, TEMPO.SEMESTRE, TEMPO.NUM_SEMANA, DT_GERACAO, HR_GERACAO" +
                    " FROM EXCEL_TITULO_ANEXOS, TEMPO" +
                    " WHERE COD_TITULO = @COD_TITULO" +
                    " AND DT_GERACAO = TEMPO.DATA" +
                    " ORDER BY " + OrderBy;
            }
            else
            {
                sCommand.CommandText = "SELECT COD_ANEXO, NOME, TIPO, TEMPO.DIA, TEMPO.MES, TEMPO.ANO, TEMPO.TRIMESTRE, TEMPO.SEMESTRE, TEMPO.NUM_SEMANA, DT_GERACAO, HR_GERACAO" +
                    " FROM EXCEL_TITULO_ANEXOS, TEMPO" +
                    " WHERE COD_TITULO = @COD_TITULO" +
                    " AND DT_GERACAO = TEMPO.DATA";
            }

            tblAnexos = clFuncoes.ExecReader(sCommand);

            return tblAnexos;
        }

        public string delAnexo(int CodAnexo)
        {
            ClassWebBI.ClassFuncoes clFuncoes = new ClassWebBI.ClassFuncoes();

            SqlCommand sCommand = new SqlCommand();

            SqlParameter pCodigo = new SqlParameter("@COD_ANEXO", System.Data.SqlDbType.Int);
            sCommand.Parameters.Add(pCodigo);
            sCommand.Parameters["@COD_ANEXO"].Value = CodAnexo;

            sCommand.CommandText = "DELETE FROM EXCEL_TITULO_ANEXOS WHERE COD_ANEXO = @COD_ANEXO";

            string sAux = clFuncoes.ExecNonQuery(sCommand);

            return sAux;
        }


    }
}
