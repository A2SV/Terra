﻿using Domain.Entities;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace Persistence.Configurations
{
    public class AppAuthDbContext : IdentityDbContext<User>
    {
        public AppAuthDbContext(DbContextOptions<AppAuthDbContext> options) : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            var adminId = "f7dbc673-4cd9-477b-a809-0739846dd5fb";
            var adminUser = new User
            {
                Id = adminId,
                UserName = "superadmin@gmail.com",
                NormalizedUserName = "superadmin@gmail.com".ToUpper(),
                FirstName = "Superadmin",
                LastName = "Superadmin",
                Email = "superadmin@gmail.com",
                NormalizedEmail = "superadmin@gmail.com".ToUpper()
            };

            adminUser.PasswordHash = new PasswordHasher<IdentityUser>()
                        .HashPassword(adminUser, "superadmin@123");

            modelBuilder.Entity<User>().HasData(adminUser);


            var tenantRoleId = "68a9203a-b05b-407f-a771-682ee11bce11";
            var tenantRole = new IdentityRole
            {
                Id = tenantRoleId,
                Name = "Tenant",
                NormalizedName = "Tenant".ToUpper(),
                ConcurrencyStamp = tenantRoleId
            };

            var landlordRoleId = "8acbde18-1b4b-47b6-bcf7-a5d2f4f1f05c";
            var landlordRole = new IdentityRole
            {
                Id = landlordRoleId,
                Name = "Landlord",
                NormalizedName = "Landlord".ToUpper(),
                ConcurrencyStamp = landlordRoleId
            };

            modelBuilder.Entity<IdentityRole>().HasData(tenantRole, landlordRole);

            var adminUserRoles = new List<IdentityUserRole<string>>
            {
                new IdentityUserRole<string>
                {
                    RoleId = tenantRoleId,
                    UserId = adminId
                },

                new IdentityUserRole<string>
                {
                    RoleId = landlordRoleId,
                    UserId = adminId
                }
            };

            modelBuilder.Entity<IdentityUserRole<string>>().HasData(adminUserRoles);
        }

        public override Task<int> SaveChangesAsync(CancellationToken cancellationToken)
        {
            foreach (var change in ChangeTracker.Entries<User>())
            {
                change.Entity.UpdatedAt = DateTime.UtcNow;
                if (change.State == EntityState.Added)
                {
                    change.Entity.CreatedAt = DateTime.UtcNow;
                }

            }
            return base.SaveChangesAsync(cancellationToken);
        }

        public DbSet<OtpEntry> Otps { get; set; }
    }
}