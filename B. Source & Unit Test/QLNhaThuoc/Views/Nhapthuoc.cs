using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using QLNhaThuoc.Entities;

namespace QLNhaThuoc.Views
{
    public partial class Nhapthuoc : UserControl
    {
        MyData db = new MyData();
        public Nhapthuoc()
        {
            InitializeComponent();
            dataGridView1.AutoGenerateColumns = false;

            // Nhóm thuốc
            comboBox3.DataSource = db.Nhomthuocs.ToList();
            comboBox3.ValueMember = "NhomthuocID";
            comboBox3.DisplayMember = "Tennhomthuoc";

            // Đơn vị tính
            var query1 = db.Database.SqlQuery<string>("select DISTINCT t.Donvitinh from Thuoc t").ToArray();
            comboBox5.Items.AddRange(query1);
            comboBox5.AutoCompleteCustomSource.AddRange(query1);

            // Nhà sản xuất
            var query2 = db.Database.SqlQuery<string>("select DISTINCT t.Noisanxuat from Thuoc t").ToArray();
            comboBox2.Items.AddRange(query2);
            comboBox2.AutoCompleteCustomSource.AddRange(query2);
        }

        public void SetNguoiNhap(string name)
        {
            textBox3.Text = name;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                Thuoc t = new Thuoc();
                t.Tenthuoc = textBox2.Text;
                t.Donvitinh = comboBox5.SelectedText;
                t.Dongia = float.Parse(textBox5.Text);
                t.Ngaysanxuat = dateTimePicker1.Value;
                t.Ngayhethan = dateTimePicker2.Value;
                t.Noisanxuat = comboBox2.SelectedText;
                t.Soluong = (int)numericUpDown2.Value;

                
                dataGridView1.Rows.Add(t);

            }
            catch(Exception)
            {
                MessageBox.Show("Thông tin thuốc nhập vào chưa chính xác. Bạn hãy kiểm tra lại!");
            }
        }
    }
}
