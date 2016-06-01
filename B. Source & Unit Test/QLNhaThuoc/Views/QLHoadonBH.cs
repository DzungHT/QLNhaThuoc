using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using QLNhaThuoc.Business;
using QLNhaThuoc.Entities;

namespace QLNhaThuoc.Views
{
    public partial class QLHoadonBH : UserControl
    {
        public QLHoadonBH()
        {
            InitializeComponent();
            dataGridView1.AutoGenerateColumns = false;  
            dataGridView1.DataSource = APIs.LstHoadon();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            
        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            int HoadonID = int.Parse(dataGridView1.CurrentRow.Cells["HoadonbanthuocID"].Value.ToString());
            int KhachhangID = int.Parse(dataGridView1.CurrentRow.Cells["KhachhangID"].Value.ToString());
            Khachhang kh = APIs.GetKhachhangByID(KhachhangID);
            txtTenKH.Text = kh.Tenkhachhang;
            txtDiachi.Text = kh.Diachi;
            List<CTHoadonbanthuoc> lst = APIs.LstCTByHoadonID(HoadonID);
            listView1.Items.Clear();
            float total =0;
            for (int i = 0; i < lst.Count;i++ )
            {
                CTHoadonbanthuoc ct = lst[i];
                ListViewItem item = new ListViewItem();
                item.Text = (i + 1).ToString();
                Thuoc t = APIs.GetThuocByID(ct.Thuoc)[0];
                item.SubItems.Add(t.Tenthuoc);
                item.SubItems.Add(t.Donvitinh);
                item.SubItems.Add(ct.Soluong.ToString());
                item.SubItems.Add((ct.Dongia*1000).ToString());
                total+=(float)ct.Soluong * (float)ct.Dongia * 1000;
                item.SubItems.Add((ct.Soluong * ct.Dongia * 1000).ToString());
                listView1.Items.Add(item);
            }
            txtTotal.Text = total.ToString();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
