using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLNhaThuoc.Entities
{
    static class Global
    {
        private static List<Thuoc> _lstItemBuy = new List<Thuoc>();
        private static int _khachhangID = 0;
        private static int _nhanvienID = 0;
        private static string _tenkhachhang = "";
        private static string _diachi = "";
        public static string Tenkhachhang { 
            get{ return _tenkhachhang;}
            set { _tenkhachhang = value; } 
        }
        public static string Diachi
        {
            get { return _diachi; }
            set { _diachi = value; }
        }
        public static List<Thuoc> lstItemBuy
        {
            get { return _lstItemBuy; }
            set { _lstItemBuy = value; }
        }
        public static int khachhangID
        {
            get { return _khachhangID; }
            set { _khachhangID = value; }
        }
        public static int nhanvienID
        {
            get { return _nhanvienID; }
            set { _nhanvienID = value; }
        }
    }
}
