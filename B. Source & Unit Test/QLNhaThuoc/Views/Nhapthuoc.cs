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
        Account acc;
        List<Thuoc> Thuocs = new List<Thuoc>();
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

            // Tên thuốc
            var query3 = db.Database.SqlQuery<string>("select DISTINCT t.Tenthuoc from Thuoc t").ToArray();
            textBox2.AutoCompleteCustomSource.AddRange(query3);

            // Nhà cung cấp
            var query4 = db.Database.SqlQuery<string>("select DISTINCT ncc.Tennhacungcap from Nhacungcap ncc").ToArray();
            textBox4.AutoCompleteCustomSource.AddRange(query4);
        }

        public void SetNguoiNhap(Account a)
        {
            this.acc = a;
            textBox3.Text = a.Nhanviens.ToList()[0].Hoten;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                Thuoc t = new Thuoc();
                t.Tenthuoc = textBox2.Text;
                t.Donvitinh = comboBox5.Text;
                t.Dongia = float.Parse(textBox5.Text);
                t.Ngaysanxuat = dateTimePicker1.Value.Date;
                t.Ngayhethan = dateTimePicker2.Value.Date;
                t.Noisanxuat = comboBox2.Text;
                t.Soluong = (int)numericUpDown2.Value;
                var query = db.Thuocs.Where(x => x.Tenthuoc == t.Tenthuoc && x.Noisanxuat == t.Noisanxuat && x.Ngaysanxuat == t.Ngaysanxuat && x.Ngayhethan == t.Ngayhethan && x.Nhacungcap.Tennhacungcap == textBox4.Text).ToList();
                if (query.Count == 1)
                {
                    t.ThuocID = query[0].ThuocID;
                }
                else
                {
                    t.ThuocID = 0;
                }

                Thuocs.Add(t);
                dataGridView1.DataSource = null;
                dataGridView1.DataSource = Thuocs;
                dataGridView1.Refresh();

            }
            catch (Exception)
            {
                MessageBox.Show("Thông tin thuốc nhập vào chưa chính xác. Bạn hãy kiểm tra lại!");
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            textBox2.Text = "";
            comboBox3.Text = "";
            comboBox5.Text = "";
            comboBox2.Text = "";
            textBox5.Text = "";
            numericUpDown2.Value = 0;
        }

        /// <summary>
        /// Nút lưu trữ
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button4_Click(object sender, EventArgs e)
        {
            try
            {
                int id = int.Parse(textBox1.Text);
                var query1 = db.Hoadonnhapthuocs.Where(x => x.HoadonnhapthuocID == id).ToArray();
                if (query1.Length == 0)
                {
                    var query2 = db.Nhacungcaps.Where(x => x.Tennhacungcap == textBox4.Text).ToArray();
                    Nhacungcap ncc;
                    if (query2.Length == 0)
                    {
                        ncc = new Nhacungcap() { Tennhacungcap = textBox4.Text };
                        db.Nhacungcaps.Add(ncc);
                    }
                    else
                    {
                        ncc = query2[0];
                    }
                    Hoadonnhapthuoc hdnt = new Hoadonnhapthuoc();
                    hdnt.Ngayviet = dateTimePicker3.Value.Date;
                    hdnt.NhanvienID = acc.Nhanviens.ToList()[0].NhanvienID;
                    hdnt.NhacungcapID = ncc.NhacungcapID;
                    hdnt.HoadonnhapthuocID = id;
                    float? thanhtien = 0;
                    Thuocs.ForEach(x => { thanhtien += x.Dongia * x.Soluong; });
                    hdnt.Thanhtien = thanhtien;

                    db.Hoadonnhapthuocs.Add(hdnt);

                    CTHoadonnhapthuoc ct;
                    Thuocs.ForEach(x =>
                    {
                        if (x.ThuocID == 0)
                        {
                            db.Thuocs.Add(x);
                        }
                        else
                        {
                            var t = db.Thuocs.Where(y => y.ThuocID == x.ThuocID).ToList()[0];
                            t.Soluong += x.Soluong;
                            db.Entry(t).State = System.Data.Entity.EntityState.Modified;
                        }
                        ct = new CTHoadonnhapthuoc();
                        ct.HoadonnhapthuocID = hdnt.HoadonnhapthuocID;
                        ct.ThuocID = x.ThuocID;
                        ct.Soluong = x.Soluong;
                        ct.Dongia = x.Dongia;

                        db.CTHoadonnhapthuocs.Add(ct);
                    });
                    db.SaveChanges();
                    MessageBox.Show("Thêm thành công!");
                    reset_View();
                }
                else
                {
                    MessageBox.Show("Số hóa đơn đã tồn tại!");
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Bạn đã điền thông tin hóa đơn nhập hàng sai. Hãy kiểm tra lại!");
            }
        }

        private void reset_View()
        {
            this.textBox1.Text = textBox2.Text =
                textBox4.Text = textBox5.Text =
                comboBox2.Text = comboBox3.Text = comboBox5.Text = string.Empty;
            numericUpDown2.Value = 0;
            Thuocs.Clear();
            dataGridView1.DataSource = null;
            dataGridView1.DataSource = Thuocs;
            dataGridView1.Refresh();

        }

        private void dataGridView1_RowsRemoved(object sender, DataGridViewRowsRemovedEventArgs e)
        {
            var ten = dataGridView1.Rows[e.RowIndex].Cells[0].Value;
            var nsx = dataGridView1.Rows[e.RowIndex].Cells[1].Value;
            var hsd = dataGridView1.Rows[e.RowIndex].Cells[2].Value;
        }
    }
}
