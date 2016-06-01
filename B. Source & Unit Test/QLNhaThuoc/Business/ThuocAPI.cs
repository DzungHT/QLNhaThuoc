using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QLNhaThuoc.Entities;
using System.ComponentModel;
namespace QLNhaThuoc.Business
{ 
   public class ThuocAPI
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
    }
}
