namespace QLNhaThuoc.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CTHoadonnhapthuoc")]
    public partial class CTHoadonnhapthuoc
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int HoadonnhapthuocID { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ThuocID { get; set; }

        public float? Soluong { get; set; }

        public float? Dongia { get; set; }

        public string Tenthuoc { get { return Thuoc.Tenthuoc; } }

        public string Noisanxuat { get { return Thuoc.Noisanxuat; } }

        public string NgaysanxuatStr { get { return Thuoc.NgaysanxuatStr; } }

        public string NgayhethanStr { get { return Thuoc.NgayhethanStr; } }

        public string Donvitinh { get { return Thuoc.Donvitinh; } }


        public virtual Hoadonnhapthuoc Hoadonnhapthuoc { get; set; }

        public virtual Thuoc Thuoc { get; set; }
    }
}
