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
using QLNhaThuoc.Business;
namespace QLNhaThuoc.Views
{
    public partial class BanThuoc : UserControl
    {
        Thuoc currThuoc;
        bool IsInsert;
        private void LoadData()
        {
            dataGridView1.DataSource = ThuocAPI.LstThuoc();
            dataGridView1.AutoGenerateColumns = false;
            
        }
        private void SetDataInfoForm(Thuoc t,int num)
        {
            txtTenthuoc.Text = t.Tenthuoc;
            txtDvt.Text = t.Donvitinh;
            txtDongia.Text = t.Dongia.ToString();
            numericUpDown2.Value = num;
            numericUpDown2.Maximum = (t.Soluong.HasValue?(decimal)t.Soluong:0);
            btnOK.Enabled = true;
            btnCancel.Enabled = true;
        }
        private void RefreshInfoForm(){
            txtTenthuoc.Text = "_______";
            txtDvt.Text = "_______";
            txtDongia.Text = "_______";
            numericUpDown2.Value = 0;
            btnOK.Enabled = false;
            btnCancel.Enabled = false;
        }
        private void CountMoney()
        {
            double Total = 0;
            for (int i = 0; i < listView1.Items.Count; i++)
            {
                Total += (double.Parse(listView1.Items[i].SubItems[3].Text)) * double.Parse(listView1.Items[i].SubItems[2].Text);
            }
            Total *= 1000;
            txtTotal.Text = Total.ToString("N0");

        }
        public BanThuoc()
        {
            InitializeComponent();
            LoadData();
        }


        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            int id = int.Parse(dataGridView1.CurrentRow.Cells["ThuocID"].Value.ToString());
            currThuoc = ThuocAPI.GetThuocByID(id)[0];
            IsInsert = true;
            SetDataInfoForm(currThuoc,0);
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void btnOK_Click(object sender, EventArgs e)
        {
            if (IsInsert)
            {
                foreach (ListViewItem it in listView1.Items)
                {
                    if (it.Text.Equals(currThuoc.ThuocID.ToString()))
                    {
                        it.SubItems[2].Text = (int.Parse(it.SubItems[2].Text) + currThuoc.Soluong).ToString();
                        CountMoney();
                        RefreshInfoForm();
                        return;
                    }
                }
                ListViewItem item = new ListViewItem();
                item.Text = currThuoc.ThuocID.ToString();
                item.SubItems.Add(currThuoc.Tenthuoc);
                item.SubItems.Add(numericUpDown2.Value.ToString());
                item.SubItems.Add(currThuoc.Dongia.ToString());
                listView1.Items.Add(item);
                CountMoney();
                RefreshInfoForm();
            }
            else
            {
                listView1.SelectedItems[0].SubItems[2].Text = numericUpDown2.Value.ToString();
                CountMoney();
                RefreshInfoForm();
            }
        }

        private void listView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int ID =int.Parse(listView1.SelectedItems[0].Text);
            int numm = int.Parse(listView1.SelectedItems[0].SubItems[2].Text);
            currThuoc = ThuocAPI.GetThuocByID(ID)[0];
            SetDataInfoForm(currThuoc, numm);
            IsInsert = false;
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            if (IsInsert)
            {
                RefreshInfoForm();
            }
            else
            {
                listView1.SelectedItems[0].Remove();
                CountMoney();
                RefreshInfoForm();
            }
        }
    }
}
