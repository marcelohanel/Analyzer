namespace WindowsFormsWebBI
{
    partial class FormMail
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormMail));
            this.btnConfirmar = new System.Windows.Forms.Button();
            this.btnCancelar = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.edtDe = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.cbxPara = new System.Windows.Forms.ComboBox();
            this.edtAssunto = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.edtMensagem = new System.Windows.Forms.TextBox();
            this.edtAnexo = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // btnConfirmar
            // 
            this.btnConfirmar.Location = new System.Drawing.Point(449, 391);
            this.btnConfirmar.Name = "btnConfirmar";
            this.btnConfirmar.Size = new System.Drawing.Size(75, 23);
            this.btnConfirmar.TabIndex = 3;
            this.btnConfirmar.Text = "Confirmar";
            this.btnConfirmar.UseVisualStyleBackColor = true;
            this.btnConfirmar.Click += new System.EventHandler(this.btnConfirmar_Click);
            // 
            // btnCancelar
            // 
            this.btnCancelar.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btnCancelar.Location = new System.Drawing.Point(530, 391);
            this.btnCancelar.Name = "btnCancelar";
            this.btnCancelar.Size = new System.Drawing.Size(75, 23);
            this.btnCancelar.TabIndex = 4;
            this.btnCancelar.Text = "Cancelar";
            this.btnCancelar.UseVisualStyleBackColor = true;
            this.btnCancelar.Click += new System.EventHandler(this.btnCancelar_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(50, 21);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(24, 13);
            this.label1.TabIndex = 9;
            this.label1.Text = "De:";
            // 
            // edtDe
            // 
            this.edtDe.Location = new System.Drawing.Point(80, 18);
            this.edtDe.Name = "edtDe";
            this.edtDe.ReadOnly = true;
            this.edtDe.Size = new System.Drawing.Size(525, 20);
            this.edtDe.TabIndex = 10;
            this.edtDe.TabStop = false;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(42, 47);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(32, 13);
            this.label2.TabIndex = 11;
            this.label2.Text = "Para:";
            // 
            // cbxPara
            // 
            this.cbxPara.FormattingEnabled = true;
            this.cbxPara.Location = new System.Drawing.Point(80, 44);
            this.cbxPara.Name = "cbxPara";
            this.cbxPara.Size = new System.Drawing.Size(525, 21);
            this.cbxPara.TabIndex = 0;
            // 
            // edtAssunto
            // 
            this.edtAssunto.Location = new System.Drawing.Point(80, 71);
            this.edtAssunto.MaxLength = 100;
            this.edtAssunto.Name = "edtAssunto";
            this.edtAssunto.Size = new System.Drawing.Size(525, 20);
            this.edtAssunto.TabIndex = 1;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(26, 74);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(48, 13);
            this.label3.TabIndex = 13;
            this.label3.Text = "Assunto:";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(12, 100);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(62, 13);
            this.label4.TabIndex = 15;
            this.label4.Text = "Mensagem:";
            // 
            // edtMensagem
            // 
            this.edtMensagem.Location = new System.Drawing.Point(80, 97);
            this.edtMensagem.MaxLength = 500;
            this.edtMensagem.Multiline = true;
            this.edtMensagem.Name = "edtMensagem";
            this.edtMensagem.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.edtMensagem.Size = new System.Drawing.Size(525, 259);
            this.edtMensagem.TabIndex = 2;
            // 
            // edtAnexo
            // 
            this.edtAnexo.Location = new System.Drawing.Point(80, 362);
            this.edtAnexo.Name = "edtAnexo";
            this.edtAnexo.ReadOnly = true;
            this.edtAnexo.Size = new System.Drawing.Size(525, 20);
            this.edtAnexo.TabIndex = 18;
            this.edtAnexo.TabStop = false;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(34, 365);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(40, 13);
            this.label5.TabIndex = 17;
            this.label5.Text = "Anexo:";
            // 
            // FormMail
            // 
            this.AcceptButton = this.btnConfirmar;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.CancelButton = this.btnCancelar;
            this.ClientSize = new System.Drawing.Size(617, 426);
            this.Controls.Add(this.edtAnexo);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.edtMensagem);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.edtAssunto);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.cbxPara);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.edtDe);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnConfirmar);
            this.Controls.Add(this.btnCancelar);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "FormMail";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Envio de E-mail";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnCancelar;
        private System.Windows.Forms.Button btnConfirmar;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox edtDe;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ComboBox cbxPara;
        private System.Windows.Forms.TextBox edtAssunto;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox edtMensagem;
        private System.Windows.Forms.TextBox edtAnexo;
        private System.Windows.Forms.Label label5;
    }
}