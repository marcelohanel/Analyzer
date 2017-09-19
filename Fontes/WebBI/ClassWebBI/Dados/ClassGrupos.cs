using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace ClassWebBI.Dados
{
    public class ClassGrupos
    {
        private string _cod_grupo;
        private string _nome;
    
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

        public void getGrupo(string CodGrupo)
        {
            ClassFuncoes clFuncoes = new ClassFuncoes();

            SqlCommand sCommand = new SqlCommand();
            DataTable tblGrupos = new DataTable();

            SqlParameter pCodigo = new SqlParameter("@COD_GRUPO", System.Data.SqlDbType.VarChar, 10);
            sCommand.Parameters.Add(pCodigo);
            sCommand.Parameters["@COD_GRUPO"].Value = CodGrupo;

            sCommand.CommandText = "SELECT COD_GRUPO, NOME FROM GRUPOS WHERE COD_GRUPO = @COD_GRUPO";

            tblGrupos = clFuncoes.ExecReader(sCommand);

            if (tblGrupos.Rows.Count > 0)
            {
                fcod_grupo = tblGrupos.Rows[0]["COD_GRUPO"].ToString();
                fnome = tblGrupos.Rows[0]["NOME"].ToString();
            }
        }

        public string setGrupo(string Tipo)
        {
            ClassWebBI.ClassFuncoes clFuncoes = new ClassWebBI.ClassFuncoes();
            SqlCommand sCommand = new SqlCommand();

            SqlParameter pCodigo = new SqlParameter("@COD_GRUPO", System.Data.SqlDbType.VarChar, 10);
            sCommand.Parameters.Add(pCodigo);
            sCommand.Parameters["@COD_GRUPO"].Value = fcod_grupo;

            SqlParameter pNome = new SqlParameter("@NOME", System.Data.SqlDbType.VarChar, 50);
            sCommand.Parameters.Add(pNome);
            sCommand.Parameters["@NOME"].Value = fnome;

            if (Tipo == "Incluir")
                sCommand.CommandText = "INSERT INTO GRUPOS (COD_GRUPO, NOME)" +
                    " VALUES (" +
                    "  @COD_GRUPO" +
                    ", @NOME )";
            else
                sCommand.CommandText = "UPDATE GRUPOS" +
                    " SET NOME = @NOME" +
                    " WHERE COD_GRUPO = @COD_GRUPO";

            string sAux = clFuncoes.ExecNonQuery(sCommand);

            return sAux;
        }

        public DataTable getGrupos(string OrderBy)
        {
            ClassFuncoes clFuncoes = new ClassFuncoes();

            SqlCommand sCommand = new SqlCommand();
            DataTable tblGrupos = new DataTable();

            if (OrderBy != "")
            {
                sCommand.CommandText = "SELECT COD_GRUPO, NOME FROM GRUPOS ORDER BY " + OrderBy;
            }
            else
            {
                sCommand.CommandText = "SELECT COD_GRUPO, NOME FROM GRUPOS";
            }

            tblGrupos = clFuncoes.ExecReader(sCommand);

            return tblGrupos;
        }

        public string delGrupo(string CodGrupo)
        {
            ClassWebBI.ClassFuncoes clFuncoes = new ClassWebBI.ClassFuncoes();

            SqlCommand sCommand = new SqlCommand();

            SqlParameter pCodGrupo = new SqlParameter("@COD_GRUPO", System.Data.SqlDbType.VarChar, 10);
            sCommand.Parameters.Add(pCodGrupo);
            sCommand.Parameters["@COD_GRUPO"].Value = CodGrupo;
            sCommand.CommandText = "DELETE FROM GRUPOS WHERE COD_GRUPO = @COD_GRUPO";

            string sAux = clFuncoes.ExecNonQuery(sCommand);

            return sAux;
        }
    }
}
