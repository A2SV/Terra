using Application.Extensions;
using System.Diagnostics;

namespace Application.Models.ApiResult
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
