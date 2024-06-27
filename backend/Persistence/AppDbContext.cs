using Microsoft.EntityFrameworkCore.ChangeTracking;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Domain.Common;
using Domain.Entities;

namespace Persistence
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<User>().HasData(
                new User
                {
                    FirstName = "Rich",
                    LastName = "Appiah",
                    Email = "adkdk@gmail.com",

                });

            modelBuilder.Entity<Role>().HasData(
                new Role
                {
                    RoleName = "Tenant",
                });
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

        public DbSet<User> Users;

        public DbSet<Role> Roles;



    }
}