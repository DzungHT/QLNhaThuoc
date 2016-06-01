using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using QLNhaThuoc.Entities;
using QLNhaThuoc.Business;

namespace QLNhaThuoc.Views
{
    public partial class Hoadon : Form
    {
        public Hoadon()
        {
            InitializeComponent();
            Init();
        }
        private void Init()
        {
            txtDay.Text = DateTime.Now.Day.ToString();
            txtMonth.Text = DateTime.Now.Month.ToString();
            txtYear.Text = DateTime.Now.Year.ToString();
            label11.Text = label21.Text = Global.Tenkhachhang;
            label12.Text = Global.Diachi;
            txtTennhanvien.Text = APIs.GetTennhanvienByID(Global.nhanvienID);
            List<Thuoc> ItemsBuy = Global.lstItemBuy;
            for (int i = 0; i < ItemsBuy.Count; i++)
            {
                Thuoc sp = ItemsBuy[i];
                ListViewItem item = new ListViewItem();
                item.Text = (i + 1).ToString();
                item.SubItems.Add(sp.Tenthuoc);
                item.SubItems.Add(sp.Donvitinh);
                item.SubItems.Add(sp.Soluong.ToString());
                item.SubItems.Add(((float)sp.Dongia * 1000).ToString("N0"));
                item.SubItems.Add(((float)sp.Dongia * (int)sp.Soluong * 1000).ToString("N0"));
                listView1.Items.Add(item);
            }
            double sumMoney = 0;
            foreach (ListViewItem it in listView1.Items)
            {
                sumMoney += double.Parse(it.SubItems[5].Text);
            }
            txtTotal.Text = sumMoney.ToString("N0");

        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        public delegate void PassData(object sender);
        public PassData passData;
        private void button1_Click(object sender, EventArgs e)
        {
            Hoadonbanthuoc hd = new Hoadonbanthuoc();
            hd.KhachhangID = Global.khachhangID;
            hd.Ngayviet = DateTime.Now;
            hd.NhanvienID = Global.nhanvienID;
            int id = APIs.InsertHoadon(hd);
            //hd.HoadonbanghangID = APIs.GetHoadonIDByHoadon(hd);
            foreach (Thuoc sp in Global.lstItemBuy)
            {
                CTHoadonbanthuoc ct = new CTHoadonbanthuoc();
                ct.HoadonbanthuocID = id;
                ct.Thuoc = sp.ThuocID;
                ct.Soluong = sp.Soluong;
                ct.Dongia = sp.Dongia;
                APIs.InsertCTHoadon(ct);
                APIs.UpdateThuoc(sp.ThuocID, (int)sp.Soluong);
            }
            MessageBox.Show("Thanh toán thành công!");
            passData(true);
            this.Close();
        }

        private void Hoadon_FormClosing(object sender, FormClosingEventArgs e)
        {

        }

        private void listView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
