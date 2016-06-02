namespace QLNhaThuoc.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Thuoc")]
    public partial class Thuoc
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Thuoc()
        {
            CTHoadonbanthuocs = new HashSet<CTHoadonbanthuoc>();
            CTHoadonnhapthuocs = new HashSet<CTHoadonnhapthuoc>();
        }

        public int ThuocID { get; set; }

        [StringLength(50)]
        public string Tenthuoc { get; set; }

        [StringLength(10)]
        public string Donvitinh { get; set; }

        public float? Dongia { get; set; }

        public DateTime? Ngaysanxuat { get; set; }

        public DateTime? Ngayhethan { get; set; }

        [StringLength(50)]
        public string Noisanxuat { get; set; }

        public string Congdung { get; set; }

        public string Thanhphan { get; set; }

        public int? NhacungcapID { get; set; }

        public int? NhomthuocID { get; set; }

        public int? Soluong { get; set; }

        public string NgaysanxuatStr { get { return ((DateTime)Ngaysanxuat).ToString("dd/MM/yyyy"); } }

        public string NgayhethanStr { get { return ((DateTime)Ngayhethan).ToString("dd/MM/yyyy"); } }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CTHoadonbanthuoc> CTHoadonbanthuocs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CTHoadonnhapthuoc> CTHoadonnhapthuocs { get; set; }

        public virtual Nhacungcap Nhacungcap { get; set; }

        public virtual Nhomthuoc Nhomthuoc { get; set; }
    }
}
