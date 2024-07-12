using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Features.Users.Dtos
{
    public class UserDto
    {
<<<<<<< HEAD
<<<<<<< HEAD
        public Guid Id { get; set; }
=======
>>>>>>> 25ac370 (feat: create endpoint to get user by id)
=======
        public Guid Id { get; set; }
>>>>>>> af79aac (fix: add id to returned getuserbyid object)
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string? ProfilePictureUrl { get; set; }
        public string PhoneNumber { get; set; }
        public string? Gender { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
    }
}
