using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace ClassWebBI
{
    public class ClassLogin
    {
        public bool ValidaLogin(string usuario, string senha, DateTime DtMovto)
        {
            bool lRetorno = false;

            ClassWebBI.Dados.ClassParametros clParametros = new Dados.ClassParametros();
            clParametros.getParametro();

            ClassFuncoes clFuncoes = new ClassWebBI.ClassFuncoes();

            DataTable tblUsuarios = new DataTable();

            SqlCommand sCommand = new SqlCommand();

            SqlParameter pUsuario = new SqlParameter("@ID_USUARIO", System.Data.SqlDbType.VarChar, 20);
            sCommand.Parameters.Add(pUsuario);
            sCommand.Parameters["@ID_USUARIO"].Value = usuario;

            SqlParameter pSenha = new SqlParameter("@SENHA", System.Data.SqlDbType.VarChar, 20);
            sCommand.Parameters.Add(pSenha);
            sCommand.Parameters["@SENHA"].Value = senha;

            sCommand.CommandText = "SELECT COD_USUARIO, NOME, ID_USUARIO, SENHA, MAIL FROM USUARIOS" +
                " WHERE ID_USUARIO = @ID_USUARIO" +
                "   AND SENHA   = @SENHA";

            tblUsuarios = clFuncoes.ExecReader(sCommand);

            if (tblUsuarios.Rows.Count > 0)
            {
                lRetorno = true;

                if (DtMovto > clParametros.fdt_limite_atualizacao)
                    DtMovto = clParametros.fdt_limite_atualizacao;

                clFuncoes.SetProperties("fData", DtMovto.ToShortDateString());
                clFuncoes.SetProperties("fCodUsuario", Convert.ToInt32(tblUsuarios.Rows[0]["COD_USUARIO"].ToString()));
                clFuncoes.SetProperties("fNomeUsuario", tblUsuarios.Rows[0]["NOME"].ToString());
                clFuncoes.SetProperties("fMail", tblUsuarios.Rows[0]["MAIL"].ToString());
                clFuncoes.SetProperties("fUsuario", tblUsuarios.Rows[0]["ID_USUARIO"].ToString());
                clFuncoes.SetProperties("fSenha", tblUsuarios.Rows[0]["SENHA"].ToString());

                string sDir = clFuncoes.GetProperties("fTempDir").ToString();
                if (!File.Exists(@sDir))
                    Directory.CreateDirectory(@sDir);

                sDir = clFuncoes.GetProperties("fTempDir").ToString() + "\\" + clFuncoes.GetProperties("fUsuario").ToString();
                if (!File.Exists(@sDir))
                    Directory.CreateDirectory(@sDir);

                sDir = sDir + "\\";
                clFuncoes.SetProperties("fTempDirUsuario", @sDir);
            }
            
            return lRetorno;
        }

        public bool ValidaLogin(int CodUsuario, DateTime DtMovto)
        {
            bool lRetorno = false;

            ClassWebBI.Dados.ClassParametros clParametros = new Dados.ClassParametros();
            clParametros.getParametro();

            ClassFuncoes clFuncoes = new ClassWebBI.ClassFuncoes();

            DataTable tblUsuarios = new DataTable();

            SqlCommand sCommand = new SqlCommand();

            SqlParameter pUsuario = new SqlParameter("@COD_USUARIO", System.Data.SqlDbType.Int);
            sCommand.Parameters.Add(pUsuario);
            sCommand.Parameters["@COD_USUARIO"].Value = CodUsuario;

            sCommand.CommandText = "SELECT COD_USUARIO, NOME, ID_USUARIO, SENHA, MAIL FROM USUARIOS" +
                " WHERE COD_USUARIO = @COD_USUARIO";

            tblUsuarios = clFuncoes.ExecReader(sCommand);

            if (tblUsuarios.Rows.Count > 0)
            {
                lRetorno = true;

                if (DtMovto > clParametros.fdt_limite_atualizacao)
                    DtMovto = clParametros.fdt_limite_atualizacao;

                clFuncoes.SetProperties("fData", DtMovto.ToShortDateString());
                clFuncoes.SetProperties("fCodUsuario", Convert.ToInt32(tblUsuarios.Rows[0]["COD_USUARIO"].ToString()));
                clFuncoes.SetProperties("fNomeUsuario", tblUsuarios.Rows[0]["NOME"].ToString());
                clFuncoes.SetProperties("fMail", tblUsuarios.Rows[0]["MAIL"].ToString());
                clFuncoes.SetProperties("fUsuario", tblUsuarios.Rows[0]["ID_USUARIO"].ToString());
                clFuncoes.SetProperties("fSenha", tblUsuarios.Rows[0]["SENHA"].ToString());

                string sDir = clFuncoes.GetProperties("fTempDir").ToString();
                if (!File.Exists(@sDir))
                    Directory.CreateDirectory(@sDir);

                sDir = clFuncoes.GetProperties("fTempDir").ToString() + "\\" + clFuncoes.GetProperties("fUsuario").ToString();
                if (!File.Exists(@sDir))
                    Directory.CreateDirectory(@sDir);

                sDir = sDir + "\\";
                clFuncoes.SetProperties("fTempDirUsuario", @sDir);
            }

            return lRetorno;
        }

    }
}
