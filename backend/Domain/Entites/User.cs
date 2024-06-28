using System.ComponentModel.DataAnnotations;
using Domain.Common;

namespace Domain.Entities
{
    public class User : BaseEntity
    {
        public required string FirstName { get; set; }
        public required string LastName { get; set; }        
        public string? Gender { get; set; }
        public DateOnly DateOfBirth { get; set; }
        public string? ProfilePictureUrl { get; set; }
        public string? VerificationToken { get; set; }
        public string? PasswordResetToken { get; set; }
    }
}
