using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QLNhaThuoc.Entities;
using System.ComponentModel;
using System.Data.Entity;
namespace QLNhaThuoc.Business
{ 
   public class APIs
    {
       private static MyData mydata = new MyData();
        public static BindingList<Thuoc> LstThuoc()
        {

            var q = from s in mydata.Thuocs
                    select s;
            var list = new BindingList<Thuoc>(q.ToList());
            return list;
        }
       public static List<Thuoc> GetThuocByID(int ID){
           var q = from s in mydata.Thuocs
                   where s.ThuocID == ID
                   select s;
           return q.ToList<Thuoc>();
       }
       public static string GetDonvitinh(int ID)
       {
           var q = from s in mydata.Thuocs
                   where s.ThuocID == ID
                   select s.Donvitinh;
           return q.ToString();
       }
       public static List<Khachhang> LstKhachhang()
       {
           var q = from s in mydata.Khachhangs
                   select s;
           return q.ToList<Khachhang>();
       }
       public static Khachhang GetKhachhangByID(int ID)
       {
           var k = from s in mydata.Khachhangs
                   where s.KhachhangID == ID
                   select s;
           Khachhang kh = k.ToList<Khachhang>()[0];
           return kh;
       }
       public static Khachhang GetKhachhangByName(string _name)
       {
           var k = from s in mydata.Khachhangs
                   where s.Tenkhachhang == _name
                   select s;
           Khachhang kh = k.ToList<Khachhang>()[0];
           return kh;
       }
       public static void UpdateThuoc(int ID, int Soluong)
       {
           var t = mydata.Thuocs.Single(p => p.ThuocID == ID);
           t.Soluong = t.Soluong - Soluong;
           mydata.Entry(t).State = EntityState.Modified;
           mydata.SaveChanges();
       }
       public static int InsertHoadon(Hoadonbanthuoc hd)
       {
           mydata.Hoadonbanthuocs.Add(hd);
           mydata.SaveChanges();
           return hd.HoadonbanthuocID;
       }
       public static void InsertCTHoadon(CTHoadonbanthuoc ct)
       {
           mydata.CTHoadonbanthuocs.Add(ct);
           mydata.SaveChanges();
       }
       public static int GetNhanvienID(int AccountID)
       {
           var s = from p in mydata.Nhanviens
                   where p.AccountID == AccountID
                   select p.NhanvienID;
           int a = (int)s.ToList()[0];
           return a;
       }
       public static string GetTennhanvienByID(int ID)
       {
           var s = from p in mydata.Nhanviens
                   where p.NhanvienID == ID
                   select p.Hoten;
           string a = s.ToList()[0].ToString();
           return a;
       }
       public static BindingList<Hoadonbanthuoc> LstHoadon()
       {

           var q = from s in mydata.Hoadonbanthuocs
                   select s;
           var list = new BindingList<Hoadonbanthuoc>(q.ToList());
           return list;
       }
       public static List<CTHoadonbanthuoc> LstCTByHoadonID(int ID)
       {
           var q = from s in mydata.CTHoadonbanthuocs
                   where s.HoadonbanthuocID == ID
                   select s;
           return q.ToList();
       }
    }
}
