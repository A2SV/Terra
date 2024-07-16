using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;

namespace Persistence.Configurations;

public class PropertyDbContextFactory : IDesignTimeDbContextFactory<PropertyDbContext>
{
    public PropertyDbContext CreateDbContext(string[] args)
    {
        var apiProjectPath = Path.Combine(Directory.GetCurrentDirectory(), "../WebApi");
        IConfigurationRoot configuration = new ConfigurationBuilder()
            .SetBasePath(apiProjectPath)
            .AddJsonFile("appsettings.json")
            .Build();

        var builder = new DbContextOptionsBuilder<PropertyDbContext>();
        DotNetEnv.Env.Load("../.env");
        var host = System.Environment.GetEnvironmentVariable("DB_HOST");
        var user = System.Environment.GetEnvironmentVariable("DB_USER");
        var password = System.Environment.GetEnvironmentVariable("DB_PASS");
        var database = System.Environment.GetEnvironmentVariable("DB_NAME");
        var port = System.Environment.GetEnvironmentVariable("DB_PORT");
        var pooling = System.Environment.GetEnvironmentVariable("DB_POOLING");
        var connectionString = $"Host={host}; Database={database};Username={user};Password={password};";
        builder.UseNpgsql(connectionString);

        return new PropertyDbContext(builder.Options);
    }
}