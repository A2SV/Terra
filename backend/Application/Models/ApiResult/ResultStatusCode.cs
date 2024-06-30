using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Models.ApiResult
{
    public enum ResultStatusCode
    {
        [Display(Name = "Success")]
        Success = 200,

        [Display(Name = "Server Error")]
        ServerError = 500,

        [Display(Name = "Bad Request Error")]
        BadRequest = 400,

        [Display(Name = "Not Found")]
        NotFound = 404,


        [Display(Name = "Request Process Error")]
        EntityProcessError = 422,

        [Display(Name = "Authentication Error")]
        UnAuthorized = 401,

        [Display(Name = "Authorization Error")]
        Forbidden = 403,

        [Display(Name = "Not Acceptable")]
        NotAcceptable = 406,

        [Display(Name = "Failed Dependency")]
        FailedDependency = 424
    }
}
