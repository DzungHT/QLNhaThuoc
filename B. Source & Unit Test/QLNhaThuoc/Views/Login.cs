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
    public partial class Login : Form
    {
        Account cur_acc;
        public delegate void PassData(Account acc);
        public PassData passData;
        public Login()
        {
            InitializeComponent();
            textBox1.Focus();
        }
        public bool checkForm(string acc, string pass)
        {
            if (acc.Equals("") || pass.Equals(""))
            {
                MessageBox.Show("Vui lòng điền đầy đủ thông tin!");
                return false;
            }
            else
            {
                return true;
            }
        }
        public bool checkAccount(string acc, string pass)
        {
            MyData db = new MyData();
            var query = db.Accounts.Where(x => x.Username == acc && x.Password == pass).ToList();
            if (query.Count == 1)
            {
                cur_acc = query[0];
                cur_acc.Password = "";
                return true;
            }
            else
            {
                MessageBox.Show("Tên đăng nhập,mật khẩu không đúng!");
                return false;
            }
        }
        private void button2_Click(object sender, EventArgs e)
        {
            textBox1.Clear();
            textBox2.Clear();
        }
        private void button1_Click(object sender, EventArgs e)
        {
            if (checkForm(textBox1.Text, textBox2.Text))
            {
                if (checkAccount(textBox2.Text, textBox1.Text))
                {
                    passData(cur_acc);
                    this.Dispose();
                }
            }
        }

        private void textBox2_KeyPress(object sender, KeyPressEventArgs e)
        {
            switch (e.KeyChar)
            {
                case (char)13:
                    textBox1.Text = string.Empty;
                    textBox1.Focus();
                    break;
                default:
                    break;
            }
        }

        private void textBox1_KeyPress(object sender, KeyPressEventArgs e)
        {
            switch (e.KeyChar)
            {
                case (char)13:
                    button1_Click(new { }, new EventArgs());
                    break;
                default:
                    break;
            }
        }
    }
}
