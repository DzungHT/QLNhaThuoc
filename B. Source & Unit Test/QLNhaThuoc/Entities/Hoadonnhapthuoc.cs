namespace QLNhaThuoc.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Hoadonnhapthuoc")]
    public partial class Hoadonnhapthuoc
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Hoadonnhapthuoc()
        {
            CTHoadonnhapthuocs = new HashSet<CTHoadonnhapthuoc>();
        }

        public int HoadonnhapthuocID { get; set; }

        public DateTime? Ngayviet { get; set; }

        public int? NhanvienID { get; set; }

        public int? NhacungcapID { get; set; }

        public float? Thanhtien { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CTHoadonnhapthuoc> CTHoadonnhapthuocs { get; set; }

        public virtual Nhacungcap Nhacungcap { get; set; }

        public virtual Nhanvien Nhanvien { get; set; }
    }
}
