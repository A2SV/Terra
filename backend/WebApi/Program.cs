using System.Net.Mime;
using Application.Contracts;
using Application.Features.Accounts.LoginUser.Command;
using Domain.Entities;
using Infrastructure.EmailService;
using Infrastructure.OTPService;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using Persistence.Configurations;
using Persistence.Repositories;
using System.Reflection;
using System.Text;
using Application.Features.Listings.Commands.CreateApartmentListing;
using Application.Features.Listings.Commands.CreateCommercialListing;
using Application.Features.Listings.Commands.CreateEventSpaceListing;
using Application.Features.Listings.Commands.CreateGuestHouseListing;
using Application.Features.Listings.Commands.CreateHotelListing;
using Application.Features.Listings.Commands.CreateHouseListing;
using Application.Features.Listings.Commands.CreateOfficeSpaceListing;
using Application.Features.Listings.Commands.Common;
using Application.Features.Listings.Commands.CreateShopListing;
using Application.Features.Listings.Commands.CreateStudentHostelListing;
using Application.Features.Listings.Commands.CreateWarehouseListing;
using Application.Features.Listings.Queries.GetAmenity;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication.Google;
using Microsoft.Extensions.DependencyInjection.Extensions;
using DotNetEnv;
using Application.Mappings;
using Google.Cloud.Storage.V1;
using Infrastructure.StorageService;


var builder = WebApplication.CreateBuilder(args);
DotNetEnv.Env.Load("../.env");
var host = System.Environment.GetEnvironmentVariable("DB_HOST");
var user = System.Environment.GetEnvironmentVariable("DB_USER");
var password = System.Environment.GetEnvironmentVariable("DB_PASS");
var database = System.Environment.GetEnvironmentVariable("DB_NAME");
var port = System.Environment.GetEnvironmentVariable("DB_PORT");
var pooling = System.Environment.GetEnvironmentVariable("DB_POOLING");
var connectionString = $"Host={host}; Database={database};Username={user};Password={password};";
var client_id = System.Environment.GetEnvironmentVariable("CLIENT_ID");
var client_secret = System.Environment.GetEnvironmentVariable("CLIENT_SECRET");
var jwt_key = System.Environment.GetEnvironmentVariable("JWT_KEY");
var jwt_issuer = System.Environment.GetEnvironmentVariable("JWT_ISSUER");
var jwt_audience = System.Environment.GetEnvironmentVariable("JWT_AUDIENCE");


// Add services to the container.
builder.Services.AddDbContext<AppAuthDbContext>(options =>
options.UseNpgsql(connectionString));

builder.Services.AddDbContext<PropertyDbContext>(options =>
options.UseNpgsql(connectionString));

builder.Services.AddScoped<IAccountRepository, AccountRepository>();
builder.Services.AddScoped<IUserRepository, UserRepository>();
builder.Services.AddScoped<ITokenRepository, TokenRepository>();
builder.Services.AddScoped<IEmailService, EmailService>();
builder.Services.AddScoped<IOTPService, OTPService>();
builder.Services.AddScoped<IOTPRepository, OTPRepository>();
builder.Services.AddScoped<IListingRepository, ListingRepository>();
builder.Services.AddScoped<IAmenityRepository, AmenityRepository>();
builder.Services.AddScoped<IStorageService, StorageService>();

builder.Services.AddMediatR(cfg => cfg.RegisterServicesFromAssemblies(Assembly.GetExecutingAssembly()));
builder.Services.AddMediatR(cfg => cfg.RegisterServicesFromAssemblies(typeof(LoginUserCommand).Assembly));
builder.Services.AddMediatR(cfg => cfg.RegisterServicesFromAssemblies(typeof(CreateApartmentListingCommand).Assembly));
builder.Services.AddMediatR(cfg => cfg.RegisterServicesFromAssemblies(typeof(CreateCommercialListingCommand).Assembly));
builder.Services.AddMediatR(cfg => cfg.RegisterServicesFromAssemblies(typeof(CreateEventSpaceListingCommand).Assembly));
builder.Services.AddMediatR(cfg => cfg.RegisterServicesFromAssemblies(typeof(CreateGuestHouseListingCommand).Assembly));
builder.Services.AddMediatR(cfg => cfg.RegisterServicesFromAssemblies(typeof(CreateHotelListingCommand).Assembly));
builder.Services.AddMediatR(cfg => cfg.RegisterServicesFromAssemblies(typeof(CreateHouseListingCommand).Assembly));
builder.Services.AddMediatR(cfg => cfg.RegisterServicesFromAssemblies(typeof(CreateOfficeSpaceListingCommand).Assembly));
builder.Services.AddMediatR(cfg => cfg.RegisterServicesFromAssemblies(typeof(CreateResidentialListingCommand).Assembly));
builder.Services.AddMediatR(cfg => cfg.RegisterServicesFromAssemblies(typeof(CreateShopListingCommand).Assembly));
builder.Services.AddMediatR(cfg => cfg.RegisterServicesFromAssemblies(typeof(CreateStudentHostelListingCommand).Assembly));
builder.Services.AddMediatR(cfg => cfg.RegisterServicesFromAssemblies(typeof(CreateWarehouseListingCommand).Assembly));
builder.Services.AddMediatR(cfg => cfg.RegisterServicesFromAssemblies(typeof(InitiateCreateListingCommand).Assembly));

builder.Services.AddMediatR(cfg => cfg.RegisterServicesFromAssemblies(typeof(GetAmenityQuery).Assembly));

builder.Services.AddSingleton(StorageClient.Create());

builder.Services.AddControllers();

builder.Services.AddApiVersioning(options =>
{   options.ReportApiVersions = true;
    options.AssumeDefaultVersionWhenUnspecified = true;
    options.DefaultApiVersion = new ApiVersion(1, 0);
});

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddIdentity<User, IdentityRole>();
builder.Services.AddIdentityCore<User>()
    .AddRoles<IdentityRole>()
    .AddEntityFrameworkStores<AppAuthDbContext>()
    .AddTokenProvider<DataProtectorTokenProvider<User>>("AppAuthDbContext")
    .AddDefaultTokenProviders();


builder.Services.AddAuthentication(options =>
    {
        options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
        options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
        options.DefaultSignInScheme = CookieAuthenticationDefaults.AuthenticationScheme;
    })
    .AddCookie(CookieAuthenticationDefaults.AuthenticationScheme, options =>
    {
        options.LoginPath = "/api/Auth/google-login";
    })
    .AddJwtBearer(options =>
    {
        options.TokenValidationParameters = new TokenValidationParameters
        {
            ValidateIssuer = true,
            ValidateAudience = true,
            ValidateLifetime = true,
            ValidateIssuerSigningKey = true,
            ValidIssuer = "https://terra-wb9c.onrender.com",
            ValidAudience = "https://terra-wb9c.onrender.com",
            IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwt_key))
        };
    })
    .AddGoogle(googleOptions =>
    {
        googleOptions.ClientId = client_id;
        googleOptions.ClientSecret = client_secret;
        // googleOptions.CallbackPath = new PathString("/api/Auth/google-response");
        googleOptions.SignInScheme = CookieAuthenticationDefaults.AuthenticationScheme;
    });

builder.Services.AddIdentityCore<User>()
    .AddRoles<IdentityRole>()
    .AddEntityFrameworkStores<AppAuthDbContext>()
    .AddTokenProvider<DataProtectorTokenProvider<User>>("AppAuthDbContext")
    .AddDefaultTokenProviders();

builder.Services.Configure<IdentityOptions>(options =>
{
    options.Password.RequiredLength = 6;
    options.Password.RequireDigit = false;
    options.Password.RequiredUniqueChars = 1;
    options.Password.RequireUppercase = false;
    options.Password.RequireLowercase = false;
    options.Password.RequireDigit = false;
    options.SignIn.RequireConfirmedEmail = true;
    options.User.RequireUniqueEmail = true;
});

builder.Services.AddCors(options =>
{
    options.AddPolicy("myAppCors", policy =>
    {
        policy.WithOrigins("http://localhost:3000")
                .AllowAnyHeader()
                .AllowAnyMethod();
    });
});

builder.Services.AddAutoMapper(typeof(AutoMapperProfiles));

builder.Services.AddCors(options =>
{
    options.AddPolicy("myAppCors", policy =>
    {
        policy.WithOrigins("http://localhost:3000")
                .AllowAnyHeader()
                .AllowAnyMethod();

        policy.WithOrigins("https://terra-web-deployment.onrender.com/")
                .AllowAnyHeader()
                .AllowAnyMethod();
    });
});

builder.Services.AddAutoMapper(typeof(AutoMapperProfiles));

var app = builder.Build();

// Apply migrations at startup
// Apply migrations at startup
using (var scope = app.Services.CreateScope())
{
    var services = scope.ServiceProvider;
    try
    {
        // Migrate AppAuthDbContext
        var authDbContext = services.GetRequiredService<AppAuthDbContext>();
        authDbContext.Database.Migrate();

        // Migrate PropertyListingDbContext
        var propertyListingDbContext = services.GetRequiredService<PropertyDbContext>();
        propertyListingDbContext.Database.Migrate();
    }
    catch (Exception ex)
    {
        var logger = services.GetRequiredService<ILogger<Program>>();
        logger.LogError(ex, "An error occurred while migrating the database.");
    }
}


// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}


app.UseHttpsRedirection();
app.UseCors("myAppCors");
app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

app.Run();
