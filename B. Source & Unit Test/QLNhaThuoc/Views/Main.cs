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
        public Main()
        {
            InitializeComponent();
        }
        private void PassData(object sender,string acc)
        {
            bool ok = (bool)sender;
            if (ok)
            {
                MenuItem_Giaodich.Enabled = true;
                MenuItem_Quanlykho.Enabled = true;
                MenuItem_Thongkebaocao.Enabled = true;
                label12.Text = "Đã đăng nhập";
            }
        }
        private void đăngNhậpToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Login.Login frmLogin = new Login.Login();
            frmLogin.passData = PassData;
            frmLogin.ShowDialog();
        }

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

    }
}
