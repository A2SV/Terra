using Microsoft.AspNetCore.Http;

namespace Application.Contracts;

public interface IStorageService
{
    Task<string> UploadFileAsync(IFormFile file, string fileType);
    Task<Stream> GetFileAsync (string fileUrl);
    Task DeleteFileAsync(string fileUrl);
}