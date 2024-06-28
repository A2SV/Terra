using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Configuration.Json;
using Persistence;
using System.IO;

public class AppAuthDbContextFactory : IDesignTimeDbContextFactory<AppAuthDbContext>
{
    public AppAuthDbContext CreateDbContext(string[] args)
    {
        var apiProjectPath = Path.Combine(Directory.GetCurrentDirectory(), "../WebApi");
        IConfigurationRoot configuration = new ConfigurationBuilder()
            .SetBasePath(apiProjectPath)
            .AddJsonFile("appsettings.json")
            .Build();

        var builder = new DbContextOptionsBuilder<AppAuthDbContext>();
        var connectionString = configuration.GetConnectionString("AppAuthDbConnectionString");
        builder.UseNpgsql(connectionString);

        return new AppAuthDbContext(builder.Options);
    }
}

