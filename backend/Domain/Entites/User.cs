using System.ComponentModel.DataAnnotations;
using Domain.Common;

namespace Domain.Entities
{
    public class User : BaseEntity
    {
        public required string FirstName { get; set; }
        public required string LastName { get; set; }        
        [EmailAddress]
        public required string Email { get; set; }
        public string? Gender { get; set; }
        public DateOnly DateOfBirth { get; set; }
        public string? PhoneNumber { get; set; }
        public string? ProfilePictureUrl { get; set; }
        public byte[] PasswordHash { get; set; } = new byte[32];
        public byte[] PasswordSalt { get; set; } = new byte[32];
        public string? VerificationToken { get; set; }
        public string? PasswordResetToken { get; set; }

        public Role? Role { get; set; }
        public int RoleId { get; set; }
    }
}
