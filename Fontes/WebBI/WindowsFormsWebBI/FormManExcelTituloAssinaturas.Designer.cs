namespace WindowsFormsWebBI
{
    partial class FormManExcelTituloAssinaturas
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormManExcelTituloAssinaturas));
            this.panel1 = new System.Windows.Forms.Panel();
            this.label3 = new System.Windows.Forms.Label();
            this.chkDias = new System.Windows.Forms.CheckedListBox();
            this.edtMailAlternativo = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.cbxTipoEnvio = new System.Windows.Forms.ComboBox();
            this.edtCodUsuario = new System.Windows.Forms.TextBox();
            this.edtUsuario = new System.Windows.Forms.TextBox();
            this.edtNomeUsuario = new System.Windows.Forms.TextBox();
            this.lblUsuario = new System.Windows.Forms.LinkLabel();
            this.chkAtivo = new System.Windows.Forms.CheckBox();
            this.lblTipo = new System.Windows.Forms.Label();
            this.btnCancelar = new System.Windows.Forms.Button();
            this.btnConfirmar = new System.Windows.Forms.Button();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.SystemColors.Control;
            this.panel1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel1.Controls.Add(this.label3);
            this.panel1.Controls.Add(this.chkDias);
            this.panel1.Controls.Add(this.edtMailAlternativo);
            this.panel1.Controls.Add(this.label2);
            this.panel1.Controls.Add(this.label1);
            this.panel1.Controls.Add(this.cbxTipoEnvio);
            this.panel1.Controls.Add(this.edtCodUsuario);
            this.panel1.Controls.Add(this.edtUsuario);
            this.panel1.Controls.Add(this.edtNomeUsuario);
            this.panel1.Controls.Add(this.lblUsuario);
            this.panel1.Controls.Add(this.chkAtivo);
            this.panel1.Controls.Add(this.lblTipo);
            this.panel1.Location = new System.Drawing.Point(12, 12);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(569, 484);
            this.panel1.TabIndex = 0;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(108, 152);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(31, 13);
            this.label3.TabIndex = 21;
            this.label3.Text = "Dias:";
            // 
            // chkDias
            // 
            this.chkDias.Items.AddRange(new object[] {
            "Domingo",
            "Segunda-Feira",
            "Terça-Feira",
            "Quarta-Feira",
            "Quinta-Feira",
            "Sexta-Feira",
            "Sábado"});
            this.chkDias.Location = new System.Drawing.Point(140, 152);
            this.chkDias.MultiColumn = true;
            this.chkDias.Name = "chkDias";
            this.chkDias.Size = new System.Drawing.Size(365, 229);
            this.chkDias.TabIndex = 2;
            // 
            // edtMailAlternativo
            // 
            this.edtMailAlternativo.Location = new System.Drawing.Point(140, 387);
            this.edtMailAlternativo.MaxLength = 100;
            this.edtMailAlternativo.Name = "edtMailAlternativo";
            this.edtMailAlternativo.Size = new System.Drawing.Size(365, 20);
            this.edtMailAlternativo.TabIndex = 3;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(48, 390);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(91, 13);
            this.label2.TabIndex = 17;
            this.label2.Text = "E-mail Alternativo:";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(78, 128);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(61, 13);
            this.label1.TabIndex = 16;
            this.label1.Text = "Tipo Envio:";
            // 
            // cbxTipoEnvio
            // 
            this.cbxTipoEnvio.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbxTipoEnvio.FormattingEnabled = true;
            this.cbxTipoEnvio.Items.AddRange(new object[] {
            "Dias da Semana",
            "Dias do Mês"});
            this.cbxTipoEnvio.Location = new System.Drawing.Point(140, 125);
            this.cbxTipoEnvio.Name = "cbxTipoEnvio";
            this.cbxTipoEnvio.Size = new System.Drawing.Size(155, 21);
            this.cbxTipoEnvio.TabIndex = 1;
            this.cbxTipoEnvio.SelectedIndexChanged += new System.EventHandler(this.cbxTipoEnvio_SelectedIndexChanged);
            // 
            // edtCodUsuario
            // 
            this.edtCodUsuario.Enabled = false;
            this.edtCodUsuario.Location = new System.Drawing.Point(301, 73);
            this.edtCodUsuario.MaxLength = 50;
            this.edtCodUsuario.Name = "edtCodUsuario";
            this.edtCodUsuario.Size = new System.Drawing.Size(50, 20);
            this.edtCodUsuario.TabIndex = 14;
            this.edtCodUsuario.TabStop = false;
            this.edtCodUsuario.Text = "0";
            // 
            // edtUsuario
            // 
            this.edtUsuario.Location = new System.Drawing.Point(140, 73);
            this.edtUsuario.MaxLength = 20;
            this.edtUsuario.Name = "edtUsuario";
            this.edtUsuario.Size = new System.Drawing.Size(155, 20);
            this.edtUsuario.TabIndex = 0;
            this.edtUsuario.Leave += new System.EventHandler(this.edtUsuario_Leave);
            // 
            // edtNomeUsuario
            // 
            this.edtNomeUsuario.Enabled = false;
            this.edtNomeUsuario.Location = new System.Drawing.Point(140, 99);
            this.edtNomeUsuario.MaxLength = 50;
            this.edtNomeUsuario.Name = "edtNomeUsuario";
            this.edtNomeUsuario.Size = new System.Drawing.Size(365, 20);
            this.edtNomeUsuario.TabIndex = 12;
            this.edtNomeUsuario.TabStop = false;
            // 
            // lblUsuario
            // 
            this.lblUsuario.AutoSize = true;
            this.lblUsuario.Location = new System.Drawing.Point(93, 76);
            this.lblUsuario.Name = "lblUsuario";
            this.lblUsuario.Size = new System.Drawing.Size(46, 13);
            this.lblUsuario.TabIndex = 0;
            this.lblUsuario.TabStop = true;
            this.lblUsuario.Text = "Usuário:";
            this.lblUsuario.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.lblUsuario_LinkClicked);
            // 
            // chkAtivo
            // 
            this.chkAtivo.AutoSize = true;
            this.chkAtivo.Checked = true;
            this.chkAtivo.CheckState = System.Windows.Forms.CheckState.Checked;
            this.chkAtivo.Location = new System.Drawing.Point(140, 413);
            this.chkAtivo.Name = "chkAtivo";
            this.chkAtivo.Size = new System.Drawing.Size(50, 17);
            this.chkAtivo.TabIndex = 4;
            this.chkAtivo.Text = "Ativo";
            this.chkAtivo.UseVisualStyleBackColor = true;
            // 
            // lblTipo
            // 
            this.lblTipo.AutoSize = true;
            this.lblTipo.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTipo.ForeColor = System.Drawing.Color.Blue;
            this.lblTipo.Location = new System.Drawing.Point(7, 7);
            this.lblTipo.Name = "lblTipo";
            this.lblTipo.Size = new System.Drawing.Size(43, 20);
            this.lblTipo.TabIndex = 2;
            this.lblTipo.Text = "Tipo";
            // 
            // btnCancelar
            // 
            this.btnCancelar.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btnCancelar.Location = new System.Drawing.Point(506, 510);
            this.btnCancelar.Name = "btnCancelar";
            this.btnCancelar.Size = new System.Drawing.Size(75, 23);
            this.btnCancelar.TabIndex = 2;
            this.btnCancelar.Text = "Cancelar";
            this.btnCancelar.UseVisualStyleBackColor = true;
            this.btnCancelar.Click += new System.EventHandler(this.btnCancelar_Click);
            // 
            // btnConfirmar
            // 
            this.btnConfirmar.Location = new System.Drawing.Point(425, 510);
            this.btnConfirmar.Name = "btnConfirmar";
            this.btnConfirmar.Size = new System.Drawing.Size(75, 23);
            this.btnConfirmar.TabIndex = 1;
            this.btnConfirmar.Text = "Confirmar";
            this.btnConfirmar.UseVisualStyleBackColor = true;
            this.btnConfirmar.Click += new System.EventHandler(this.btnConfirmar_Click);
            // 
            // FormManExcelTituloAssinaturas
            // 
            this.AcceptButton = this.btnConfirmar;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.CancelButton = this.btnCancelar;
            this.ClientSize = new System.Drawing.Size(593, 545);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.btnCancelar);
            this.Controls.Add(this.btnConfirmar);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "FormManExcelTituloAssinaturas";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Manutenção da Assinatura";
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label lblTipo;
        private System.Windows.Forms.Button btnCancelar;
        private System.Windows.Forms.Button btnConfirmar;
        private System.Windows.Forms.TextBox edtNomeUsuario;
        private System.Windows.Forms.LinkLabel lblUsuario;
        private System.Windows.Forms.CheckBox chkAtivo;
        private System.Windows.Forms.TextBox edtUsuario;
        private System.Windows.Forms.TextBox edtCodUsuario;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox cbxTipoEnvio;
        private System.Windows.Forms.TextBox edtMailAlternativo;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.CheckedListBox chkDias;
    }
}