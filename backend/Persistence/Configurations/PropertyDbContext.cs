using Domain.Entities;
using Domain.Enums;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Domain.Common;

namespace Persistence.Configurations
{
    public class PropertyDbContext : DbContext
    {
        public PropertyDbContext(DbContextOptions<PropertyDbContext> options) : base(options) 
        {
        }
        
        public override Task<int> SaveChangesAsync(CancellationToken cancellationToken)
        {
            foreach (var change in ChangeTracker.Entries<BaseEntity>())
            {
                change.Entity.UpdatedAt = DateTime.UtcNow;
                if (change.State == EntityState.Added)
                {
                    change.Entity.CreatedAt = DateTime.UtcNow;
                }

            }
            return base.SaveChangesAsync(cancellationToken);
        }

        public DbSet<Amenity> Amenities { get; set; }
        public DbSet<Apartment> Apartments { get; set; }
        public DbSet<CommercialProperty> CommercialProperties { get; set; }
        public DbSet<ResidentialProperty> DomesticProperties { get; set; }
        public DbSet<EventSpace> EventSpaces { get; set; }
        public DbSet<GuestHouse> GuestHouses { get; set; }
        public DbSet<Hotel> Hotels { get; set; }
        public DbSet<House> Houses { get; set; }
        public DbSet<OfficeSpace> OfficeSpaces { get; set; }
        public DbSet<PaymentInformation> PaymentInformations { get; set; }
        public DbSet<Property> Properties { get; set; }
        public DbSet<PropertyAmenity> PropertyAmenities { get; set; }
        public DbSet<PropertyLocation> PropertyLocations { get; set; }
        public DbSet<PropertyPhoto> PropertyPhotos { get; set; }
        public DbSet<PropertyVideo> PropertyVideos { get; set; }
        public DbSet<Shop> Shops { get; set; }
        public DbSet<StudentHostel> StudentHostels { get; set; }
        public DbSet<Warehouse> Warehouses { get; set; }
    }
}
