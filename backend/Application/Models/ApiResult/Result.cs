using Application.Extensions;
using Application.Models.ApiResult;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Models
{
    public class Result
    {
        public bool IsSuccess { get; set; }
        public ResultStatusCode StatusCode { get; set; }

        public string Message { get; set; }
        public string RequestId { get; }

        public Result(bool isSuccess, ResultStatusCode statusCode, string message = null)
        {
            IsSuccess = isSuccess;
            StatusCode = statusCode;
            Message = message ?? statusCode.ToDisplay();
            RequestId = Activity.Current?.TraceId.ToHexString() ?? string.Empty;
        }
    }

    public class Result<TData> : Result
    where TData : class
    {
        public TData Data { get; set; }

        public Result(bool isSuccess, ResultStatusCode statusCode, TData data, string message = null)
            : base(isSuccess, statusCode, message)
        {
            Data = data;
        }
    }
}
