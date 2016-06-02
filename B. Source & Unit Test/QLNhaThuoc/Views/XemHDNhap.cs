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
    public partial class XemHDNhap : UserControl
    {
        MyData db = new MyData();
        List<Hoadonnhapthuoc> hdnt;
        List<CTHoadonnhapthuoc> ctn;
        public XemHDNhap()
        {
            InitializeComponent();
            dataGridView1.AutoGenerateColumns = false;
            dataGridView2.AutoGenerateColumns = false;

            refreshDataGridView1();
        }
        private List<Hoadonnhapthuoc> GetHoaDonNhap()
        {
            hdnt = db.Hoadonnhapthuocs.ToList();
            return hdnt;
        }
        private void refreshDataGridView1()
        {
            dataGridView1.DataSource = null;
            dataGridView1.DataSource = GetHoaDonNhap();
            dataGridView1.Refresh();
        }
        private void refreshDataGridView2()
        {
            dataGridView2.DataSource = null;
            dataGridView2.DataSource = ctn;
            dataGridView2.Refresh();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            var id = hdnt[e.RowIndex].HoadonnhapthuocID;
            ctn = db.CTHoadonnhapthuocs.Where(x => x.HoadonnhapthuocID == id).ToList();
           
            refreshDataGridView2();
        }
    }
}
