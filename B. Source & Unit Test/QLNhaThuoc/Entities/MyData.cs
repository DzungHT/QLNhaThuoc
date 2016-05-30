namespace QLNhaThuoc.Entities
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class MyData : DbContext
    {
        public MyData()
            : base("name=MyData")
        {
        }

        public virtual DbSet<Account> Accounts { get; set; }
        public virtual DbSet<CTHoadonbanthuoc> CTHoadonbanthuocs { get; set; }
        public virtual DbSet<CTHoadonnhapthuoc> CTHoadonnhapthuocs { get; set; }
        public virtual DbSet<Hoadonbanthuoc> Hoadonbanthuocs { get; set; }
        public virtual DbSet<Hoadonnhapthuoc> Hoadonnhapthuocs { get; set; }
        public virtual DbSet<Khachhang> Khachhangs { get; set; }
        public virtual DbSet<Nhacungcap> Nhacungcaps { get; set; }
        public virtual DbSet<Nhanvien> Nhanviens { get; set; }
        public virtual DbSet<Nhomthuoc> Nhomthuocs { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<Thuoc> Thuocs { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Hoadonbanthuoc>()
                .HasMany(e => e.CTHoadonbanthuocs)
                .WithRequired(e => e.Hoadonbanthuoc)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Hoadonnhapthuoc>()
                .HasMany(e => e.CTHoadonnhapthuocs)
                .WithRequired(e => e.Hoadonnhapthuoc)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Khachhang>()
                .Property(e => e.Sodienthoai)
                .IsFixedLength();

            modelBuilder.Entity<Nhacungcap>()
                .Property(e => e.Dienthoai)
                .IsUnicode(false);

            modelBuilder.Entity<Thuoc>()
                .HasMany(e => e.CTHoadonbanthuocs)
                .WithRequired(e => e.Thuoc1)
                .HasForeignKey(e => e.Thuoc)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Thuoc>()
                .HasMany(e => e.CTHoadonnhapthuocs)
                .WithRequired(e => e.Thuoc)
                .WillCascadeOnDelete(false);
        }
    }
}
