using Application.Contracts;
using Application.Features.Users.LoginUser.Command;
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
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication.Google;
using Microsoft.Extensions.DependencyInjection.Extensions;
using DotNetEnv;

var builder = WebApplication.CreateBuilder(args);
DotNetEnv.Env.Load("../.env");
var host = System.Environment.GetEnvironmentVariable("DB_HOST");
var user = System.Environment.GetEnvironmentVariable("DB_USER");
var password = System.Environment.GetEnvironmentVariable("DB_PASS");
var database = System.Environment.GetEnvironmentVariable("DB_NAME");
var port = System.Environment.GetEnvironmentVariable("DB_PORT");
var pooling = System.Environment.GetEnvironmentVariable("DB_POOLING");
var connectionString = $"Host={host}; Database={database};Username={user};Password={password};";

// Add services to the container.
builder.Services.AddDbContext<AppAuthDbContext>(options =>
options.UseNpgsql(connectionString));

builder.Services.AddScoped<IUserRepository, UserRepository>();
builder.Services.AddScoped<ITokenRepository, TokenRepository>();
builder.Services.AddScoped<IEmailService, EmailService>();
builder.Services.AddScoped<IOTPService, OTPService>();
builder.Services.AddScoped<IOTPRepository, OTPRepository>();

builder.Services.Configure<IdentityOptions>(
    options => options.SignIn.RequireConfirmedAccount = true);


builder.Services.AddMediatR(cfg => cfg.RegisterServicesFromAssemblies(Assembly.GetExecutingAssembly()));
builder.Services.AddMediatR(cfg => cfg.RegisterServicesFromAssemblies(typeof(LoginUserCommand).Assembly));

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

            ValidIssuer = System.Environment.GetEnvironmentVariable("JWT_ISSUER"),
            ValidAudience = System.Environment.GetEnvironmentVariable("JWT_AUDIENCE"),
            IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(System.Environment.GetEnvironmentVariable("JWT_KEY")))
        };
    })
    .AddGoogle(googleOptions =>
    {
        googleOptions.ClientId = System.Environment.GetEnvironmentVariable("CLIENT_ID");
        googleOptions.ClientSecret = System.Environment.GetEnvironmentVariable("CLIENT_SECRET");
        // googleOptions.CallbackPath = new PathString("/api/Auth/google-response");
        googleOptions.SignInScheme = CookieAuthenticationDefaults.AuthenticationScheme;
    });

builder.Services.Configure<IdentityOptions>(options =>
{
    options.Password.RequiredLength = 6;
    options.Password.RequireDigit = false;
    options.Password.RequiredUniqueChars = 1;
    options.Password.RequireUppercase = false;
    options.Password.RequireLowercase = false;
    options.Password.RequireDigit = false;

    options.User.RequireUniqueEmail = true;
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

app.Run();
