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

        public virtual Hoadonnhapthuoc Hoadonnhapthuoc { get; set; }

        public virtual Thuoc Thuoc { get; set; }
    }
}
