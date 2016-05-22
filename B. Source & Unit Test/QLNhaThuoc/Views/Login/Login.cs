using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLNhaThuoc.Views.Login
{
    public partial class Login : Form
    {
        public delegate void PassData(object sender, string acc);
        public PassData passData;
        public Login()
        {
            InitializeComponent();
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
            if (acc.Equals("admin") && pass.Equals("admin"))
            {
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
                    MessageBox.Show("Đăng nhập thành công");
                    passData(true, "OK");
                    this.Close();
                }
            }
        }
    }
}
