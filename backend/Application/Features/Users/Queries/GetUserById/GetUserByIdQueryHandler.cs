using Application.Contracts;
using Application.Features.Users.Dtos;
using AutoMapper;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Features.Users.Queries.Get
{
    public class GetUserByIdQueryHandler : IRequestHandler<GetUserByIdQuery, UserDto?>
    {
        private readonly IUserRepository userRepository;
        private readonly IMapper mapper;

        public GetUserByIdQueryHandler(IUserRepository userRepository, IMapper mapper)
        {
            this.userRepository = userRepository;
            this.mapper = mapper;
        }

        public async Task<UserDto?> Handle(GetUserByIdQuery request, CancellationToken cancellationToken)
        {
            var existingUser = await userRepository.GetUserByIdAsync(request.Id.ToString());

            if (existingUser == null)
            {
                return null;
            }

            return mapper.Map<UserDto>(existingUser);
        }
    }
}
