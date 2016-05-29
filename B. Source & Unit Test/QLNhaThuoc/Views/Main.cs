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
        Login frmLogin = new Login();
        About UC_about = new About();
        BanThuoc UC_banthuoc = new BanThuoc();
        
        public Main()
        {
            InitializeComponent();
            UC_about.Dock = DockStyle.Fill;
            UC_banthuoc.Dock = DockStyle.Fill;
            frmLogin.passData = PassData;
            frmLogin.ShowDialog();
            MainPanel.Controls.Clear();
            MainPanel.Controls.Add(UC_about);
        }
        private void PassData(object sender,string acc)
        {
            bool ok = (bool)sender;
            if (ok)
            {
                MenuItem_Giaodich.Enabled = true;
                MenuItem_Quanlykho.Enabled = true;
                MenuItem_Thongkebaocao.Enabled = true;
            }
        }
        private void đăngNhậpToolStripMenuItem_Click(object sender, EventArgs e)
        {
            
        }

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void thôngTinPhầnMềmToolStripMenuItem_Click(object sender, EventArgs e)
        {
            MainPanel.Controls.Clear();
            MainPanel.Controls.Add(UC_about);
        }

        private void bánThuốcToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            MainPanel.Controls.Clear();
            MainPanel.Controls.Add(UC_banthuoc);
        }
    }
}
