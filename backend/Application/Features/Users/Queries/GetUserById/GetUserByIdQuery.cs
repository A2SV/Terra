using Application.Features.Users.Dtos;
using MediatR;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Features.Users.Queries.Get
{
    public class GetUserByIdQuery : IRequest<UserDto?>
    {
        [Required]
        public Guid Id { get; set; }
    }
}
