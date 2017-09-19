using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace ClassWebBI.Dados
{
    public class ClassAssinaturas
    {
        private int _cod_usuario;
        private int _cod_titulo;
        private bool _ativo;
        private string _tipo_envio;
        private string _dias_envio;
        private string _email_alternativo;
        private string _usuario;
        private string _nome_usuario;
    
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

        public string ftipo_envio
        {
            get
            {
                return _tipo_envio;
            }
            set
            {
                _tipo_envio = value;
            }
        }

        public string fdias_envio
        {
            get
            {
                return _dias_envio;
            }
            set
            {
                _dias_envio = value;
            }
        }

        public string femail_alternativo
        {
            get
            {
                return _email_alternativo;
            }
            set
            {
                _email_alternativo = value;
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

        public string fnome_usuario
        {
            get
            {
                return _nome_usuario;
            }
            set
            {
                _nome_usuario = value;
            }
        }

        public DataTable getAssinaturas(int CodTitulo, string OrderBy)
        {
            ClassFuncoes clFuncoes = new ClassFuncoes();

            SqlCommand sCommand = new SqlCommand();
            DataTable tblAssinaturas = new DataTable();

            SqlParameter pCodigo = new SqlParameter("@COD_TITULO", System.Data.SqlDbType.Int);
            sCommand.Parameters.Add(pCodigo);
            sCommand.Parameters["@COD_TITULO"].Value = CodTitulo;

            if (OrderBy != "")
            {
                sCommand.CommandText = "SELECT USUARIOS.COD_USUARIO, USUARIOS.ID_USUARIO, USUARIOS.NOME, USUARIOS.MAIL," +
                    " EXCEL_TITULO_ASSINATURAS.EMAIL_ALTERNATIVO, EXCEL_TITULO_ASSINATURAS.ATIVO" +
                    " FROM EXCEL_TITULO_ASSINATURAS, USUARIOS" +
                    " WHERE COD_TITULO  = @COD_TITULO" +
                    "   AND USUARIOS.COD_USUARIO = EXCEL_TITULO_ASSINATURAS.COD_USUARIO" +
                    " ORDER BY " + OrderBy;
            }
            else
            {
                sCommand.CommandText = "SELECT USUARIOS.COD_USUARIO, USUARIOS.ID_USUARIO, USUARIOS.NOME, USUARIOS.MAIL," +
                    " EXCEL_TITULO_ASSINATURAS.EMAIL_ALTERNATIVO, EXCEL_TITULO_ASSINATURAS.ATIVO" +
                    " FROM EXCEL_TITULO_ASSINATURAS, USUARIOS" +
                    " WHERE COD_TITULO  = @COD_TITULO" +
                    "   AND USUARIOS.COD_USUARIO = EXCEL_TITULO_ASSINATURAS.COD_USUARIO";
            }

            tblAssinaturas = clFuncoes.ExecReader(sCommand);

            return tblAssinaturas;
        }

        public void getAssinatura(int CodUsuario, int CodTitulo)
        {
            ClassFuncoes clFuncoes = new ClassFuncoes();

            SqlCommand sCommand = new SqlCommand();
            DataTable tblAssinatura = new DataTable();

            SqlParameter pCodTitulo = new SqlParameter("@COD_TITULO", System.Data.SqlDbType.Int);
            sCommand.Parameters.Add(pCodTitulo);
            sCommand.Parameters["@COD_TITULO"].Value = CodTitulo;

            SqlParameter pCodUsuario = new SqlParameter("@COD_USUARIO", System.Data.SqlDbType.Int);
            sCommand.Parameters.Add(pCodUsuario);
            sCommand.Parameters["@COD_USUARIO"].Value = CodUsuario;

            sCommand.CommandText = "SELECT " +
                "EXCEL_TITULO_ASSINATURAS.COD_USUARIO, " +
                "EXCEL_TITULO_ASSINATURAS.COD_TITULO, " +
                "EXCEL_TITULO_ASSINATURAS.ATIVO, " +
                "EXCEL_TITULO_ASSINATURAS.TIPO_ENVIO, " +
                "EXCEL_TITULO_ASSINATURAS.DIAS_ENVIO, " +
                "EXCEL_TITULO_ASSINATURAS.EMAIL_ALTERNATIVO, " +
                "USUARIOS.ID_USUARIO, " +
                "USUARIOS.NOME " +
                "FROM EXCEL_TITULO_ASSINATURAS, USUARIOS " +
                "WHERE EXCEL_TITULO_ASSINATURAS.COD_USUARIO = @COD_USUARIO " +
                "AND   EXCEL_TITULO_ASSINATURAS.COD_TITULO = @COD_TITULO " +
                "AND   USUARIOS.COD_USUARIO = EXCEL_TITULO_ASSINATURAS.COD_USUARIO";

            tblAssinatura = clFuncoes.ExecReader(sCommand);

            if (tblAssinatura.Rows.Count > 0)
            {
                fcod_usuario = Convert.ToInt32(tblAssinatura.Rows[0]["COD_USUARIO"].ToString());
                fcod_titulo = Convert.ToInt32(tblAssinatura.Rows[0]["COD_TITULO"].ToString());
                fativo = Convert.ToBoolean(tblAssinatura.Rows[0]["ATIVO"].ToString());
                ftipo_envio = tblAssinatura.Rows[0]["TIPO_ENVIO"].ToString();
                fdias_envio = tblAssinatura.Rows[0]["DIAS_ENVIO"].ToString();
                femail_alternativo = tblAssinatura.Rows[0]["EMAIL_ALTERNATIVO"].ToString();
                fusuario = tblAssinatura.Rows[0]["ID_USUARIO"].ToString();
                fnome_usuario = tblAssinatura.Rows[0]["NOME"].ToString();
            }
        }
        
        public string delAssinatura(int CodUsuario, int CodTitulo)
        {
            ClassWebBI.ClassFuncoes clFuncoes = new ClassWebBI.ClassFuncoes();

            SqlCommand sCommand = new SqlCommand();

            SqlParameter pCodUsuario = new SqlParameter("@COD_USUARIO", System.Data.SqlDbType.Int);
            sCommand.Parameters.Add(pCodUsuario);
            sCommand.Parameters["@COD_USUARIO"].Value = CodUsuario;

            SqlParameter pCodTitulo = new SqlParameter("@COD_TITULO", System.Data.SqlDbType.Int);
            sCommand.Parameters.Add(pCodTitulo);
            sCommand.Parameters["@COD_TITULO"].Value = CodTitulo;

            sCommand.CommandText = "DELETE FROM EXCEL_TITULO_ASSINATURAS WHERE COD_USUARIO = @COD_USUARIO AND COD_TITULO = @COD_TITULO";

            string sAux = clFuncoes.ExecNonQuery(sCommand);

            return sAux;
        }

        public string setAssinatura(string Tipo)
        {
            ClassWebBI.ClassFuncoes clFuncoes = new ClassWebBI.ClassFuncoes();
            SqlCommand sCommand = new SqlCommand();
            
            SqlParameter pCodUsuario = new SqlParameter("@COD_USUARIO", System.Data.SqlDbType.Int);
            sCommand.Parameters.Add(pCodUsuario);
            sCommand.Parameters["@COD_USUARIO"].Value = fcod_usuario;

            SqlParameter pCodTitulo = new SqlParameter("@COD_TITULO", System.Data.SqlDbType.Int);
            sCommand.Parameters.Add(pCodTitulo);
            sCommand.Parameters["@COD_TITULO"].Value = fcod_titulo;

            SqlParameter pAtivo = new SqlParameter("@ATIVO", System.Data.SqlDbType.Bit);
            sCommand.Parameters.Add(pAtivo);
            sCommand.Parameters["@ATIVO"].Value = fativo;

            SqlParameter pMail = new SqlParameter("@EMAIL_ALTERNATIVO", System.Data.SqlDbType.VarChar, 100);
            sCommand.Parameters.Add(pMail);
            sCommand.Parameters["@EMAIL_ALTERNATIVO"].Value = femail_alternativo;

            SqlParameter pTipoEnvio = new SqlParameter("@TIPO_ENVIO", System.Data.SqlDbType.VarChar, 1);
            sCommand.Parameters.Add(pTipoEnvio);
            sCommand.Parameters["@TIPO_ENVIO"].Value = ftipo_envio;

            SqlParameter pDias = new SqlParameter("@DIAS_ENVIO", System.Data.SqlDbType.VarChar, 100);
            sCommand.Parameters.Add(pDias);
            sCommand.Parameters["@DIAS_ENVIO"].Value = fdias_envio;

            if (Tipo == "Incluir")
                sCommand.CommandText = "INSERT INTO EXCEL_TITULO_ASSINATURAS (COD_USUARIO, COD_TITULO, TIPO_ENVIO, DIAS_ENVIO, ATIVO, EMAIL_ALTERNATIVO)" +
                    " VALUES (" +
                    "  @COD_USUARIO" +
                    ", @COD_TITULO" +
                    ", @TIPO_ENVIO" +
                    ", @DIAS_ENVIO" +
                    ", @ATIVO" +
                    ", @EMAIL_ALTERNATIVO)";
            else
                sCommand.CommandText = "UPDATE EXCEL_TITULO_ASSINATURAS" +
                    "  SET ATIVO = @ATIVO" +
                    ", TIPO_ENVIO = @TIPO_ENVIO" +
                    ", DIAS_ENVIO = @DIAS_ENVIO" +
                    ", EMAIL_ALTERNATIVO = @EMAIL_ALTERNATIVO" +
                    " WHERE COD_USUARIO = @COD_USUARIO" +
                    "   AND COD_TITULO = @COD_TITULO";

            string sAux = clFuncoes.ExecNonQuery(sCommand);

            return sAux;
        }

        private bool testaDiaMes(DateTime dData)
        {
            bool lPode = false;

            string[] vAux = fdias_envio.ToString().Split(new char[] { ';' });

            for (int i = 0; i <= vAux.Length - 1; i++)
            {
                if (vAux[i].ToString() == dData.Day.ToString())
                {
                    lPode = true;
                    break;
                }
            }

            return lPode;
        }

        private bool testaDiaSemana(DateTime dData)
        {
            bool lPode = false;

            string[] vAux = fdias_envio.ToString().Split(new char[] { ';' });

            switch (dData.DayOfWeek)
            {
                case DayOfWeek.Sunday:
                    {
                        for (int i = 0; i <= vAux.Length - 1; i++)
                        {
                            if (vAux[i].ToString() == "Domingo")
                            {
                                lPode = true;
                                break;
                            }
                        }
                        break;
                    }
                case DayOfWeek.Monday:
                    {
                        for (int i = 0; i <= vAux.Length - 1; i++)
                        {
                            if (vAux[i].ToString() == "Segunda-Feira")
                            {
                                lPode = true;
                                break;
                            }
                        }
                        break;
                    }
                case DayOfWeek.Tuesday:
                    {
                        for (int i = 0; i <= vAux.Length - 1; i++)
                        {
                            if (vAux[i].ToString() == "Terça-Feira")
                            {
                                lPode = true;
                                break;
                            }
                        }
                        break;
                    }
                case DayOfWeek.Wednesday:
                    {
                        for (int i = 0; i <= vAux.Length - 1; i++)
                        {
                            if (vAux[i].ToString() == "Quarta-Feira")
                            {
                                lPode = true;
                                break;
                            }
                        }
                        break;
                    }
                case DayOfWeek.Thursday:
                    {
                        for (int i = 0; i <= vAux.Length - 1; i++)
                        {
                            if (vAux[i].ToString() == "Quinta-Feira")
                            {
                                lPode = true;
                                break;
                            }
                        }
                        break;
                    }
                case DayOfWeek.Friday:
                    {
                        for (int i = 0; i <= vAux.Length - 1; i++)
                        {
                            if (vAux[i].ToString() == "Sexta-Feira")
                            {
                                lPode = true;
                                break;
                            }
                        }
                        break;
                    }
                case DayOfWeek.Saturday:
                    {
                        for (int i = 0; i <= vAux.Length - 1; i++)
                        {
                            if (vAux[i].ToString() == "Sábado")
                            {
                                lPode = true;
                                break;
                            }
                        }
                        break;
                    }
                default:
                    break;
            }


            return lPode;
        }

        public bool podeEnviarMail()
        {
            bool lPode = false;

            ClassWebBI.ClassFuncoes clFuncoes = new ClassWebBI.ClassFuncoes();

            DateTime dData = Convert.ToDateTime(clFuncoes.GetProperties("fData"));

            if (ftipo_envio == "S")
                lPode = testaDiaSemana(dData);

            if (ftipo_envio == "M")
                lPode = testaDiaMes(dData);

            return lPode;
        }

    }
}
