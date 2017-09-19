using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace ClassWebBI.Dados
{
    public class ClassUsuarios
    {
        private int _cod_usuario;
        private string _nome;
        private string _usuario;
        private string _senha;
        private string _endereco_mail;
        private string _usuario_mail;
        private string _senha_mail;
        private string _servidor_mail;
        private int _porta_mail;
        private bool _ssl;
    
        public int fcod_usuario
        {
            get
            {
                return _cod_usuario;
            }
            set
            {
                _cod_usuario = value;
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

        public string fusuario
        {
            get
            {
                return _usuario;
            }
            set
            {
                _usuario = value;
            }
        }

        public string fsenha
        {
            get
            {
                return _senha;
            }
            set
            {
                _senha = value;
            }
        }

        public string fendereco_mail
        {
            get
            {
                return _endereco_mail;
            }
            set
            {
                _endereco_mail = value;
            }
        }

        public bool fssl
        {
            get
            {
                return _ssl;
            }
            set
            {
                _ssl = value;
            }
        }

        public string fusuario_mail
        {
            get
            {
                return _usuario_mail;
            }
            set
            {
                _usuario_mail = value;
            }
        }

        public string fsenha_mail
        {
            get
            {
                return _senha_mail;
            }
            set
            {
                _senha_mail = value;
            }
        }

        public string fservidor_mail
        {
            get
            {
                return _servidor_mail;
            }
            set
            {
                _servidor_mail = value;
            }
        }

        public int fporta_mail
        {
            get
            {
                return _porta_mail;
            }
            set
            {
                _porta_mail = value;
            }
        }

        public void getUsuario(int CodUsuario)
        {
            ClassFuncoes clFuncoes = new ClassFuncoes();

            SqlCommand sCommand = new SqlCommand();
            DataTable tblUsuarios = new DataTable();

            SqlParameter pCodigo = new SqlParameter("@COD_USUARIO", System.Data.SqlDbType.Int);
            sCommand.Parameters.Add(pCodigo);
            sCommand.Parameters["@COD_USUARIO"].Value = CodUsuario;

            sCommand.CommandText = "SELECT USUARIOS.COD_USUARIO, USUARIOS.NOME, USUARIOS.ID_USUARIO, USUARIOS.SENHA, USUARIOS.MAIL, USUARIOS.USER_MAIL, USUARIOS.SENHA_MAIL, PARAMETROS.SERVIDOR_MAIL, PARAMETROS.PORTA_MAIL, PARAMETROS.UTILIZAR_SSL FROM USUARIOS, PARAMETROS" +
                " WHERE USUARIOS.COD_USUARIO = @COD_USUARIO" +
                " AND PARAMETROS.COD_PARAMETRO = 1";

            tblUsuarios = clFuncoes.ExecReader(sCommand);

            if (tblUsuarios.Rows.Count > 0)
            {
                fcod_usuario = Convert.ToInt32(tblUsuarios.Rows[0]["COD_USUARIO"].ToString());
                fnome = tblUsuarios.Rows[0]["NOME"].ToString();
                fusuario = tblUsuarios.Rows[0]["ID_USUARIO"].ToString();
                fsenha = tblUsuarios.Rows[0]["SENHA"].ToString();
                fendereco_mail = tblUsuarios.Rows[0]["MAIL"].ToString();
                fusuario_mail = tblUsuarios.Rows[0]["USER_MAIL"].ToString();
                fsenha_mail = tblUsuarios.Rows[0]["SENHA_MAIL"].ToString();
                fservidor_mail = tblUsuarios.Rows[0]["SERVIDOR_MAIL"].ToString();
                fporta_mail = Convert.ToInt32(tblUsuarios.Rows[0]["PORTA_MAIL"].ToString());
                fssl = Convert.ToBoolean(tblUsuarios.Rows[0]["UTILIZAR_SSL"].ToString());
            }
        }

        public void getUsuario(string Usuario)
        {
            ClassFuncoes clFuncoes = new ClassFuncoes();

            SqlCommand sCommand = new SqlCommand();
            DataTable tblUsuarios = new DataTable();

            SqlParameter pUsuario = new SqlParameter("@ID_USUARIO", System.Data.SqlDbType.VarChar, 20);
            sCommand.Parameters.Add(pUsuario);
            sCommand.Parameters["@ID_USUARIO"].Value = Usuario;

            sCommand.CommandText = "SELECT COD_USUARIO FROM USUARIOS" +
                " WHERE ID_USUARIO = @ID_USUARIO";

            tblUsuarios = clFuncoes.ExecReader(sCommand);

            if (tblUsuarios.Rows.Count > 0)
                getUsuario(Convert.ToInt32(tblUsuarios.Rows[0]["COD_USUARIO"].ToString()));
        }

        public DataTable getUsuarios(string OrderBy)
        {
            ClassFuncoes clFuncoes = new ClassFuncoes();

            SqlCommand sCommand = new SqlCommand();
            DataTable tblUsuarios = new DataTable();

            if (OrderBy != "")
            {
                sCommand.CommandText = "SELECT COD_USUARIO, NOME, ID_USUARIO FROM USUARIOS ORDER BY " + OrderBy;
            }
            else
            {
                sCommand.CommandText = "SELECT COD_USUARIO, NOME, ID_USUARIO FROM USUARIOS";
            }

            tblUsuarios = clFuncoes.ExecReader(sCommand);

            return tblUsuarios;
        }

    }
}
