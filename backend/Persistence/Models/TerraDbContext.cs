using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Persistence.Models;

public partial class TerraDbContext : DbContext
{
    public TerraDbContext()
    {
    }

    public TerraDbContext(DbContextOptions<TerraDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Amenity> Amenities { get; set; }

    public virtual DbSet<Apartment> Apartments { get; set; }

    public virtual DbSet<AspNetRole> AspNetRoles { get; set; }

    public virtual DbSet<AspNetRoleClaim> AspNetRoleClaims { get; set; }

    public virtual DbSet<AspNetUser> AspNetUsers { get; set; }

    public virtual DbSet<AspNetUserClaim> AspNetUserClaims { get; set; }

    public virtual DbSet<AspNetUserLogin> AspNetUserLogins { get; set; }

    public virtual DbSet<AspNetUserToken> AspNetUserTokens { get; set; }

    public virtual DbSet<CommercialProperty> CommercialProperties { get; set; }

    public virtual DbSet<EventSpace> EventSpaces { get; set; }

    public virtual DbSet<GuestHouse> GuestHouses { get; set; }

    public virtual DbSet<Hotel> Hotels { get; set; }

    public virtual DbSet<House> Houses { get; set; }

    public virtual DbSet<OfficeSpace> OfficeSpaces { get; set; }

    public virtual DbSet<Otp> Otps { get; set; }

    public virtual DbSet<PaymentInformation> PaymentInformations { get; set; }

    public virtual DbSet<Property> Properties { get; set; }

    public virtual DbSet<PropertyAmenity> PropertyAmenities { get; set; }

    public virtual DbSet<PropertyLocation> PropertyLocations { get; set; }

    public virtual DbSet<PropertyPhoto> PropertyPhotos { get; set; }

    public virtual DbSet<PropertyVideo> PropertyVideos { get; set; }

    public virtual DbSet<ResidentialProperty> ResidentialProperties { get; set; }

    public virtual DbSet<Shop> Shops { get; set; }

    public virtual DbSet<StudentHostel> StudentHostels { get; set; }

    public virtual DbSet<User> Users { get; set; }

    public virtual DbSet<Warehouse> Warehouses { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseNpgsql("Host=dpg-cq451k6ehbks73b71u7g-a.oregon-postgres.render.com;Database=terra_db;Username=terra_user;Password=L6D8mbsGeATniKvg4shqbhqWBhIh072Q;Port=5432;Pooling=true");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Amenity>(entity =>
        {
            entity.Property(e => e.Id).ValueGeneratedNever();
        });

        modelBuilder.Entity<Apartment>(entity =>
        {
            entity.Property(e => e.Id).ValueGeneratedNever();
        });

        modelBuilder.Entity<AspNetRole>(entity =>
        {
            entity.HasIndex(e => e.NormalizedName, "RoleNameIndex").IsUnique();

            entity.Property(e => e.Name).HasMaxLength(256);
            entity.Property(e => e.NormalizedName).HasMaxLength(256);
        });

        modelBuilder.Entity<AspNetRoleClaim>(entity =>
        {
            entity.HasIndex(e => e.RoleId, "IX_AspNetRoleClaims_RoleId");

            entity.HasOne(d => d.Role).WithMany(p => p.AspNetRoleClaims).HasForeignKey(d => d.RoleId);
        });

        modelBuilder.Entity<AspNetUser>(entity =>
        {
            entity.HasIndex(e => e.NormalizedEmail, "EmailIndex");

            entity.HasIndex(e => e.NormalizedUserName, "UserNameIndex").IsUnique();

            entity.Property(e => e.Discriminator).HasMaxLength(13);
            entity.Property(e => e.Email).HasMaxLength(256);
            entity.Property(e => e.NormalizedEmail).HasMaxLength(256);
            entity.Property(e => e.NormalizedUserName).HasMaxLength(256);
            entity.Property(e => e.UserName).HasMaxLength(256);

            entity.HasMany(d => d.Roles).WithMany(p => p.Users)
                .UsingEntity<Dictionary<string, object>>(
                    "AspNetUserRole",
                    r => r.HasOne<AspNetRole>().WithMany().HasForeignKey("RoleId"),
                    l => l.HasOne<AspNetUser>().WithMany().HasForeignKey("UserId"),
                    j =>
                    {
                        j.HasKey("UserId", "RoleId");
                        j.ToTable("AspNetUserRoles");
                        j.HasIndex(new[] { "RoleId" }, "IX_AspNetUserRoles_RoleId");
                    });
        });

        modelBuilder.Entity<AspNetUserClaim>(entity =>
        {
            entity.HasIndex(e => e.UserId, "IX_AspNetUserClaims_UserId");

            entity.HasOne(d => d.User).WithMany(p => p.AspNetUserClaims).HasForeignKey(d => d.UserId);
        });

        modelBuilder.Entity<AspNetUserLogin>(entity =>
        {
            entity.HasKey(e => new { e.LoginProvider, e.ProviderKey });

            entity.HasIndex(e => e.UserId, "IX_AspNetUserLogins_UserId");

            entity.HasOne(d => d.User).WithMany(p => p.AspNetUserLogins).HasForeignKey(d => d.UserId);
        });

        modelBuilder.Entity<AspNetUserToken>(entity =>
        {
            entity.HasKey(e => new { e.UserId, e.LoginProvider, e.Name });

            entity.HasOne(d => d.User).WithMany(p => p.AspNetUserTokens).HasForeignKey(d => d.UserId);
        });

        modelBuilder.Entity<CommercialProperty>(entity =>
        {
            entity.Property(e => e.Id).ValueGeneratedNever();
        });

        modelBuilder.Entity<EventSpace>(entity =>
        {
            entity.Property(e => e.Id).ValueGeneratedNever();
        });

        modelBuilder.Entity<GuestHouse>(entity =>
        {
            entity.Property(e => e.Id).ValueGeneratedNever();
        });

        modelBuilder.Entity<Hotel>(entity =>
        {
            entity.Property(e => e.Id).ValueGeneratedNever();
        });

        modelBuilder.Entity<House>(entity =>
        {
            entity.Property(e => e.Id).ValueGeneratedNever();
        });

        modelBuilder.Entity<OfficeSpace>(entity =>
        {
            entity.Property(e => e.Id).ValueGeneratedNever();
        });

        modelBuilder.Entity<Otp>(entity =>
        {
            entity.HasIndex(e => e.UserId, "IX_Otps_UserId");

            entity.Property(e => e.OtpId).ValueGeneratedNever();
            entity.Property(e => e.Otp1)
                .HasMaxLength(255)
                .HasColumnName("Otp");

            entity.HasOne(d => d.User).WithMany(p => p.Otps).HasForeignKey(d => d.UserId);
        });

        modelBuilder.Entity<PaymentInformation>(entity =>
        {
            entity.Property(e => e.Id).ValueGeneratedNever();
        });

        modelBuilder.Entity<Property>(entity =>
        {
            entity.HasIndex(e => e.ListerId, "IX_Properties_ListerId");

            entity.HasIndex(e => e.PaymentInformationId, "IX_Properties_PaymentInformationId");

            entity.HasIndex(e => e.PropertyLocationId, "IX_Properties_PropertyLocationId");

            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.Title).HasMaxLength(100);

            entity.HasOne(d => d.Lister).WithMany(p => p.Properties).HasForeignKey(d => d.ListerId);

            entity.HasOne(d => d.PaymentInformation).WithMany(p => p.Properties).HasForeignKey(d => d.PaymentInformationId);

            entity.HasOne(d => d.PropertyLocation).WithMany(p => p.Properties).HasForeignKey(d => d.PropertyLocationId);
        });

        modelBuilder.Entity<PropertyAmenity>(entity =>
        {
            entity.HasIndex(e => e.AmenityId, "IX_PropertyAmenities_AmenityId");

            entity.HasIndex(e => e.PropertyId, "IX_PropertyAmenities_PropertyId");

            entity.Property(e => e.Id).ValueGeneratedNever();

            entity.HasOne(d => d.Amenity).WithMany(p => p.PropertyAmenities).HasForeignKey(d => d.AmenityId);

            entity.HasOne(d => d.Property).WithMany(p => p.PropertyAmenities).HasForeignKey(d => d.PropertyId);
        });

        modelBuilder.Entity<PropertyLocation>(entity =>
        {
            entity.Property(e => e.Id).ValueGeneratedNever();
        });

        modelBuilder.Entity<PropertyPhoto>(entity =>
        {
            entity.HasIndex(e => e.PropertyId, "IX_PropertyPhotos_PropertyId");

            entity.Property(e => e.Id).ValueGeneratedNever();

            entity.HasOne(d => d.Property).WithMany(p => p.PropertyPhotos).HasForeignKey(d => d.PropertyId);
        });

        modelBuilder.Entity<PropertyVideo>(entity =>
        {
            entity.HasIndex(e => e.PropertyId, "IX_PropertyVideos_PropertyId");

            entity.Property(e => e.Id).ValueGeneratedNever();

            entity.HasOne(d => d.Property).WithMany(p => p.PropertyVideos).HasForeignKey(d => d.PropertyId);
        });

        modelBuilder.Entity<ResidentialProperty>(entity =>
        {
            entity.Property(e => e.Id).ValueGeneratedNever();
        });

        modelBuilder.Entity<Shop>(entity =>
        {
            entity.Property(e => e.Id).ValueGeneratedNever();
        });

        modelBuilder.Entity<StudentHostel>(entity =>
        {
            entity.Property(e => e.Id).ValueGeneratedNever();
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.ToTable("User");
        });

        modelBuilder.Entity<Warehouse>(entity =>
        {
            entity.Property(e => e.Id).ValueGeneratedNever();
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
