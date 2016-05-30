namespace QLNhaThuoc.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Nhanvien")]
    public partial class Nhanvien
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Nhanvien()
        {
            Hoadonbanthuocs = new HashSet<Hoadonbanthuoc>();
            Hoadonnhapthuocs = new HashSet<Hoadonnhapthuoc>();
        }

        public int NhanvienID { get; set; }

        [StringLength(50)]
        public string Hoten { get; set; }

        public float? Hesoluong { get; set; }

        public bool? Gioitinh { get; set; }

        public DateTime? Ngaysinh { get; set; }

        [StringLength(100)]
        public string Diachi { get; set; }

        [StringLength(50)]
        public string Email { get; set; }

        public int? AccountID { get; set; }

        public virtual Account Account { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Hoadonbanthuoc> Hoadonbanthuocs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Hoadonnhapthuoc> Hoadonnhapthuocs { get; set; }
    }
}
