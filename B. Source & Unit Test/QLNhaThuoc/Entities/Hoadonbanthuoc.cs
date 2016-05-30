namespace QLNhaThuoc.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Hoadonbanthuoc")]
    public partial class Hoadonbanthuoc
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Hoadonbanthuoc()
        {
            CTHoadonbanthuocs = new HashSet<CTHoadonbanthuoc>();
        }

        public int HoadonbanthuocID { get; set; }

        public DateTime? Ngayviet { get; set; }

        public int? KhachhangID { get; set; }

        public int? NhanvienID { get; set; }

        public float? Thanhtien { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CTHoadonbanthuoc> CTHoadonbanthuocs { get; set; }

        public virtual Khachhang Khachhang { get; set; }

        public virtual Nhanvien Nhanvien { get; set; }
    }
}
