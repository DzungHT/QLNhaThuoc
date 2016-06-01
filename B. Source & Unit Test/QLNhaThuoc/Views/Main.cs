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
        BanThuoc banthuoc;
        public Main()
        {
            InitializeComponent();

            // show login
            login = new Login();
            login.passData = passLogin;
            login.ShowDialog();
            // init about
            about.Dock = DockStyle.Fill;
            MainPanel.Controls.Add(about);


        }
        private void passLogin(Account acc)
        {
            cur_acc = acc;
            toolStripStatusLabel2.Text = cur_acc.Nhanviens.ToList()[0].Hoten;
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
            banthuoc = new BanThuoc();
            banthuoc.Dock = DockStyle.Fill;
            MainPanel.Controls.Clear();
            MainPanel.Controls.Add(banthuoc);
        }

        private void nhậpHàngToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Nhapthuoc nhapthuoc = new Nhapthuoc();
            nhapthuoc.SetNguoiNhap(cur_acc.Nhanviens.ToList()[0].Hoten);
            nhapthuoc.Dock = DockStyle.Fill;
            MainPanel.Controls.Clear();
            MainPanel.Controls.Add(nhapthuoc);
        }

        private void quảnLýThuốcToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Quanlythuoc quanlythuoc = new Quanlythuoc();
            quanlythuoc.Dock = DockStyle.Fill;
            MainPanel.Controls.Clear();
            MainPanel.Controls.Add(quanlythuoc);
        }

        private void thôngTinPhầnMềmToolStripMenuItem_Click(object sender, EventArgs e)
        {
            MainPanel.Controls.Clear();
            MainPanel.Controls.Add(about);
        }

        private void quảnLýTàiKhoảnToolStripMenuItem_Click(object sender, EventArgs e)
        {
            QuanLyNhanVien qlnv = new QuanLyNhanVien();
            qlnv.Show();
        }
    }
}
