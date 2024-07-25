using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using Application.Contracts;
using Microsoft.AspNetCore.Authorization;

namespace WebApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class FileController : ControllerBase
{
    private readonly IStorageService _storageService;

    public FileController(IStorageService storageService)
    {
        _storageService = storageService;
    }

    [Authorize]
    [HttpPost("upload")]
    public async Task<IActionResult> UploadFile(IFormFile file, [FromQuery] string fileType)
    {
        if (file == null || file.Length == 0)
            return BadRequest("File is empty");

        var fileUrl = await _storageService.UploadFileAsync(file, fileType);
        return Ok(new { Url = fileUrl });
    }

    [Authorize]
    [HttpGet("download")]
    public async Task<IActionResult> GetFile([FromQuery] string fileUrl)
    {
        if (string.IsNullOrEmpty(fileUrl))
            return BadRequest("File URL is required");

        var fileStream = await _storageService.GetFileAsync(fileUrl);
        var fileName = Path.GetFileName(new Uri(fileUrl).AbsolutePath);
        return File(fileStream, "application/octet-stream", fileName);
    }

    // [HttpDelete("delete/{fileName}")]
    // public async Task<IActionResult> DeleteFile(string fileName)
    // {
    //     await _storageService.DeleteFileAsync(fileName, [FromQuery] string fileType);
    //     return NoContent();
    // }
    
}
