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
        public Nhapthuoc()
        {
            InitializeComponent();
        }
        private Thuoc getObject()
        {
            Thuoc thuoc = new Thuoc();
            thuoc.Tenthuoc = textBox2.Text;

            return thuoc;
        }
    }
}
