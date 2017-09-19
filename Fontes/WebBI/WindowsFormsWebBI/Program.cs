using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;

namespace WindowsFormsWebBI
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main(string[] args)
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            if (args.Length < 3)
                MessageBox.Show("Parâmetros Inválidos !", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else
                if (args[0].ToString() != "kc4570mh")
                    MessageBox.Show("Parâmetros Inválidos !", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                else
                    Application.Run(new FormPrincipal(args));
        }
    }
}
