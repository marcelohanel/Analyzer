using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Globalization;
using System.Net.Mail;
using System.Net;
using System.Xml;

namespace ClassWebBI
{
    public class ClassFuncoes
    {
        public void LeConfig()
        {
            string sFileName = "C:\\Analyzer\\ConfigWebBI.xml";
            string sConnectionString = "";

            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(sFileName);
            XmlNodeList xnList = xmlDoc.GetElementsByTagName("Config");

            for (int i = 0; i < xnList.Count; i++)
                sConnectionString = xnList[i]["ConnectionString"].InnerText;

            SetProperties("fConnectionString", sConnectionString);
            SetProperties("fTempDir", "C:\\Analyzer\\Temp\\WebBI");
        }

        public void LimpaDiretorioUsuarioLogado()
        {
            ClassWebBI.ClassFuncoes clFuncoes = new ClassWebBI.ClassFuncoes();
            string sDir = clFuncoes.GetProperties("fTempDirUsuario").ToString();

            try
            {
                Directory.Delete(sDir, true);
            }
            catch
            {
            }
        }

        public string GetDataParcial(DateTime Data, string Tipo)
        {
            string sAux = "";

            int iMes = Convert.ToInt32(Data.ToString("MM"));

            if (Tipo == "Diário")
                sAux = Data.ToString("yyyyMMdd");

            if (Tipo == "Semanal")
            {
                Calendar cCal = DateTimeFormatInfo.CurrentInfo.Calendar;

                string sSemana = cCal.GetWeekOfYear(Data,
                    DateTimeFormatInfo.CurrentInfo.CalendarWeekRule,
                    DateTimeFormatInfo.CurrentInfo.FirstDayOfWeek).ToString("00");

                sAux = Data.ToString("yyyy") + sSemana;
            }

            if (Tipo == "Mensal")
                sAux = Data.ToString("yyyyMM");

            if (Tipo == "Trimestral")
            {
                if (iMes >= 1 & iMes <= 3)
                    sAux = Data.ToString("yyyy") + "01";

                if (iMes >= 4 & iMes <= 6)
                    sAux = Data.ToString("yyyy") + "02";

                if (iMes >= 7 & iMes <= 9)
                    sAux = Data.ToString("yyyy") + "03";

                if (iMes >= 10 & iMes <= 12)
                    sAux = Data.ToString("yyyy") + "04";
            }

            if (Tipo == "Semestral")
            {
                if (iMes >= 1 & iMes <= 6)
                    sAux = Data.ToString("yyyy") + "01";

                if (iMes >= 7 & iMes <= 12)
                    sAux = Data.ToString("yyyy") + "02";
            }

            if (Tipo == "Anual")
                sAux = Data.ToString("yyyy");

            if (Tipo == "Único")
                sAux = ("00");

            return sAux;
        }

        public void ExecProcess(string Arquivo, bool WaitExec)
        {
            try
            {
                System.Diagnostics.Process pProcess = new System.Diagnostics.Process();
                pProcess.StartInfo.FileName = Arquivo;
                pProcess.Start();

                if (WaitExec)
                    pProcess.WaitForExit();
            }
            catch
            {
            }
        }

        public void SalvaArquivo(string nomeArquivo, byte[] arquivo)
        {
            try
            {
                FileStream fs = new FileStream(nomeArquivo, FileMode.Create, FileAccess.Write);
                fs.Write(arquivo, 0, arquivo.Length);
                fs.Flush();
                fs.Close();
            }
            catch
            {
            }
        }

        public byte[] CarregarArquivo(string nomeArquivo)
        {
            try
            {
                byte[] imagemBytes = null;
                FileStream fs = new FileStream(nomeArquivo, FileMode.Open, FileAccess.Read);
                BinaryReader br = new BinaryReader(fs);
                imagemBytes = br.ReadBytes(Convert.ToInt32(fs.Length));
                return imagemBytes;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public object GetProperties(string Instrucao)
        {
            try
            {
                return Properties.Settings.Default[Instrucao];
            }
            catch
            {
                return null;
            }
        }

        public void SetProperties(string Instrucao, object Valor)
        {
            Properties.Settings.Default[Instrucao] = Valor;
            Properties.Settings.Default.Save();
        }

        public SqlConnection GetConexaoBD()
        {
            string strConexao = GetProperties("fConnectionString").ToString();
            return new SqlConnection(strConexao);
        }

        public DataTable ExecReader(SqlCommand sCommand)
        {
            SqlConnection sConnection = new ClassFuncoes().GetConexaoBD();
            DataTable tblRetorno = new DataTable();

            try
            {
                sConnection.Open();
                sCommand.Connection = sConnection;
                sCommand.Prepare();
                SqlDataReader rReader = sCommand.ExecuteReader(CommandBehavior.CloseConnection);
                tblRetorno.Load(rReader);
            }
            catch
            {
            }
            finally
            {
                if (sConnection.State == ConnectionState.Open)
                    sConnection.Close();
            }

            return tblRetorno;
        }

        public string ExecScalar(SqlCommand sCommand)
        {
            SqlConnection sConnection = new ClassFuncoes().GetConexaoBD();
            string sRetorno = "";

            try
            {
                sConnection.Open();
                sCommand.Connection = sConnection;
                sCommand.Prepare();
                sRetorno = sCommand.ExecuteScalar().ToString();
            }
            catch
            {
            }
            finally
            {
                if (sConnection.State == ConnectionState.Open)
                    sConnection.Close();
            }

            return sRetorno;
        }

        public string ExecNonQuery(SqlCommand sCommand)
        {
            string sRetorno = "";

            SqlConnection sConnection = new ClassFuncoes().GetConexaoBD();

            try
            {
                sConnection.Open();
                sCommand.Connection = sConnection;
                sCommand.Prepare();
                sCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                sRetorno = ex.Message;
            }
            finally
            {
                if (sConnection.State == ConnectionState.Open)
                    sConnection.Close();
            }

            return sRetorno;
        }

        public string ExecNonQuery(SqlCommand sCommand, SqlCommand sCommand1)
        {
            string sRetorno = "";

            SqlConnection sConnection = new ClassFuncoes().GetConexaoBD();
            sConnection.Open();

            sCommand.Connection = sConnection;
            sCommand1.Connection = sConnection;

            sCommand.Prepare();
            sCommand1.Prepare();

            SqlTransaction objTrans = sConnection.BeginTransaction();

            sCommand.Transaction = objTrans;
            sCommand1.Transaction = objTrans;

            try
            {
                sCommand.ExecuteNonQuery();
                sCommand1.ExecuteNonQuery();

                objTrans.Commit();
            }
            catch (Exception ex)
            {
                objTrans.Rollback();
                sRetorno = ex.Message;
            }
            finally
            {
                if (sConnection.State == ConnectionState.Open)
                    sConnection.Close();
            }

            return sRetorno;
        }

        public bool EnviaMail(string host, int port, string addressRem, string addressDes, string subject, string body, string userName, string password, bool ssl, string anexo)
        {
            bool lRetorno = true;

            SmtpClient cliente = new SmtpClient(host, port);

            cliente.EnableSsl = ssl;

            MailAddress remetente = new MailAddress(addressRem);
            MailAddress destinatario = new MailAddress(addressDes);

            MailMessage mensagem = new MailMessage(remetente, destinatario);
                        
            mensagem.Subject = subject;
            mensagem.Body = body;
            mensagem.Attachments.Add(new Attachment(@anexo));

            NetworkCredential credencial = new NetworkCredential(userName, password);

            cliente.Credentials = credencial;
            
            try
            {
                cliente.Send(mensagem);
            }
            catch
            {
                lRetorno = false;
            }
            
            return lRetorno;
        }

    }
}
