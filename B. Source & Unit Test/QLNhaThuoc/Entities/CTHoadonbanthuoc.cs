namespace QLNhaThuoc.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CTHoadonbanthuoc")]
    public partial class CTHoadonbanthuoc
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int HoadonbanthuocID { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Thuoc { get; set; }

        public float? Soluong { get; set; }

        public float? Dongia { get; set; }

        public virtual Hoadonbanthuoc Hoadonbanthuoc { get; set; }

        public virtual Thuoc Thuoc1 { get; set; }
    }
}
