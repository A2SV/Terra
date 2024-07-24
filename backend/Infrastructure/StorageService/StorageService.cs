using Google.Cloud.Storage.V1;
using Microsoft.Extensions.Configuration;
using System;
using System.IO;
using System.Threading.Tasks;
using Application.Contracts;
using Microsoft.AspNetCore.Http;
using Application.Contracts;
using Google.Apis.Auth.OAuth2;

namespace Infrastructure.StorageService;

public class StorageService : IStorageService
{
    // private readonly GoogleCredential googleCredential;
    private readonly StorageClient _storageClient;
    private readonly string _bucketName;
    private readonly string _profileImagesFolder;
    private readonly string _propertyImagesFolder;
    private readonly string _propertyVideosFolder;

    public StorageService()
    {
        GoogleCredential GOOGLE_APPLICATION_CREDENTIALS = GoogleCredential.FromFile("/etc/secrets/terra-427922-ae51e66636d9.json");
        _storageClient = StorageClient.Create(GOOGLE_APPLICATION_CREDENTIALS);
        _bucketName = System.Environment.GetEnvironmentVariable("Bucket_Name");
        _profileImagesFolder = System.Environment.GetEnvironmentVariable("ProfileImagesFolder");
        _propertyImagesFolder = System.Environment.GetEnvironmentVariable("PropertyImagesFolder");
        _propertyVideosFolder = System.Environment.GetEnvironmentVariable("PropertyVideosFolder");
    }
    
    public async Task<string> UploadFileAsync(IFormFile file, string fileType)
    {
        string folder;
        switch (fileType.ToLower())
        {
            case "profile":
                folder = _profileImagesFolder;
                break;
            case "property-image":
                folder = _propertyImagesFolder;
                break;
            case "property-video":
                folder = _propertyVideosFolder;
                break;
            default:
                throw new ArgumentException("Invalid file type");
        }

        var uniqueFileName = $"file{DateTime.Now.ToString("_ffffff_yyyy_MM_dd_HH_mm_ss")}{Path.GetExtension(file.FileName)}";
        var objectName = Path.Combine(folder, uniqueFileName).Replace("\\", "/");

        using var stream = file.OpenReadStream();
        await _storageClient.UploadObjectAsync(_bucketName, objectName, null, stream);

        return $"https://storage.googleapis.com/{_bucketName}/{objectName}";
    }
    public async Task<Stream> GetFileAsync(string fileUrl)
    {
        var objectName = new Uri(fileUrl).AbsolutePath.TrimStart('/');
        var memoryStream = new MemoryStream();
        await _storageClient.DownloadObjectAsync(_bucketName, objectName, memoryStream);
        memoryStream.Position = 0;
        return memoryStream;
    }
    
    // public async Task DeleteFileAsync(string fileName)
    // {
    //     await _storageClient.DeleteObjectAsync(_bucketName, fileName);
    // }
}