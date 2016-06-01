using QLNhaThuoc.Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLNhaThuoc.Views
{
    public partial class Main : Form
    {
        Account cur_acc;
        Login login;
        About about = new About();
        public Main()
        {
            InitializeComponent();

            // show login
            login = new Login();
            login.passData = passLogin;
            login.ShowDialog();
            // init about
            MainPanel.Controls.Add(about);
            about.Dock = DockStyle.Fill;


        }
        private void passLogin(Account acc)
        {
            cur_acc = acc;
            toolStripStatusLabel2.Text = cur_acc.Username;
            if (cur_acc.Level == 1)
            {
                quảnLýTàiKhoảnToolStripMenuItem.Enabled = true;
            }
            else
            {
                quảnLýTàiKhoảnToolStripMenuItem.Enabled = false;
            }
            bánHàngToolStripMenuItem.Enabled = true;
            khoHàngToolStripMenuItem.Enabled = true;
            đăngNhậpToolStripMenuItem.Visible = false;
            đăngXuấtToolStripMenuItem.Visible = true;
        }

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void đăngXuấtToolStripMenuItem_Click(object sender, EventArgs e)
        {
            cur_acc = null;
            toolStripStatusLabel2.Text = string.Empty;
            quảnLýTàiKhoảnToolStripMenuItem.Enabled = false;
            bánHàngToolStripMenuItem.Enabled        = false;
            khoHàngToolStripMenuItem.Enabled        = false;
            đăngXuấtToolStripMenuItem.Visible       = false;
            đăngNhậpToolStripMenuItem.Visible = true;
            login = new Login();
            login.passData = passLogin;
            login.ShowDialog();
        }

        private void bánHàngToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            
        }
    }
}
