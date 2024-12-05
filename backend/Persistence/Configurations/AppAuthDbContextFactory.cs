using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;
using Persistence.Configurations;
using DotNetEnv;

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

        string env = Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT") ?? "Development";



        if (env == "Development")
        {
            DotNetEnv.Env.Load("../.env.local");

        }
        else
        {
            DotNetEnv.Env.Load("../.env");

        }

        var host = System.Environment.GetEnvironmentVariable("DB_HOST");
        var user = System.Environment.GetEnvironmentVariable("DB_USER");
        var password = System.Environment.GetEnvironmentVariable("DB_PASS");
        var database = System.Environment.GetEnvironmentVariable("DB_NAME");
        var port = System.Environment.GetEnvironmentVariable("DB_PORT");
        var pooling = System.Environment.GetEnvironmentVariable("DB_POOLING");
        var connectionString = "";
        if (env == "Development")
        {
            connectionString = $"Host={host}; User ID={user};Password={password};Server={host};Port={port};Database={database}; Pooling={pooling}";

        }
        else
        {
            connectionString = $"Host={host}; Database={database};Username={user};Password={password};";

        }

        builder.UseNpgsql(connectionString);

        return new AppAuthDbContext(builder.Options);
    }
}

