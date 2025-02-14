# Terra API – Backend

Terra API is a property listing backend service built with .NET/C# following Clean Architecture principles. The project is designed to be modular, testable, and scalable, separating concerns into distinct layers (Core, Application, Infrastructure, and Presentation). The API leverages CQRS with MediatR, Entity Framework Core with PostgreSQL, and integrates external services like Google Cloud Storage.

---

## Table of Contents

- [Technologies Used](#technologies-used)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Cloning the Repository](#cloning-the-repository)
  - [Setting Up Environment Variables](#setting-up-environment-variables)
  - [Database Setup](#database-setup)
- [Running the Project](#running-the-project)
- [Testing](#testing)
- [Development Guidelines](#development-guidelines)

---

## Technologies Used

- **.NET 7 (C#)**
- **Entity Framework Core** – ORM for data access
- **PostgreSQL** – Relational database
- **Docker** (optional) – For containerized database/development
- **MediatR** – For implementing CQRS and decoupling application logic
- **Clean Architecture** – Ensures separation of concerns
- **Swagger** – For API documentation
- **xUnit/NUnit** – Testing frameworks
- **Serilog/NLog** (optional) – Structured logging

---

## Project Structure

The project follows Clean Architecture principles:

- **Core Layer**:  
  - **Entities**: Domain objects and business logic.  
  - **Interfaces**: Contracts for services and repositories.  
  - **Domain Services**: Business logic not confined to a single entity.

- **Application Layer**:  
  - **Use Cases**: Specific business functions (commands/queries).  
  - **DTOs**: Data Transfer Objects for moving data between layers.  
  - **Validators**: Data validation logic.  
  - **Repository Interfaces**: Contracts for data access operations.

- **Infrastructure Layer**:  
  - **Repository Implementations**: EF Core DbContexts and data access implementations.  
  - **External Service Integrations**: Services for emailing, cloud storage, etc.  
  - **Logging and Caching Services**: Implementations for cross-cutting concerns.

- **Presentation Layer**:  
  - **Controllers**: Web API endpoints.  
  - **View Models & Mappings**: Structures for API responses.

- **Tests**:  
  - Separate projects for unit and integration tests.

---

## Getting Started

### Prerequisites

Ensure you have the following installed:

- [.NET SDK 7.0+](https://dotnet.microsoft.com/download)
- [PostgreSQL](https://www.postgresql.org/download/)
- [Visual Studio Code](https://code.visualstudio.com/) or [Visual Studio 2022](https://visualstudio.microsoft.com/)
- [Docker](https://www.docker.com/) (optional, for containerized development)
- Git

### Cloning the Repository

Clone the repository and navigate to the backend folder:

```shell
git clone https://github.com/A2SV/Terra.git
cd Terra/backend
```

Then, restore dependencies:

```shell
dotnet restore
```

### Setting Up Environment Variables

For local development, create an `.env.local` file in the root directory. For example:

```env
JWT_KEY=jwt_key
JWT_ISSUER=https://terra-issuer
JWT_AUDIENCE=https://terra-audience
POSTGRES_CONNECTION_STRING=Host=localhost;Database=terra_db;Username=postgres;Password=yourpassword
# Optional variables for external services:
GOOGLE_STORAGE_BUCKET_NAME=your-bucket-name
MAILGUN_API_KEY=mailgun_key
MAILGUN_DOMAIN=mailgun_domain
SENDER_EMAIL=example@mail.com
RESET_PASSWORD_URL=http://localhost:3000/reset-password
PropertyImagesFolder=images
PropertyVideosFolder=videos
GOOGLE_CLIENT_ID=client_id
GOOGLE_CLIENT_SECRET=google_secret
```

For a testing environment, create an `.env` file with similar content.

### Database Setup

1. **Using PostgreSQL Locally:**

   Create a database named `terra_db`:

   ```sql
   CREATE DATABASE terra_db;
   ```

2. **Using Docker:**

   Run a PostgreSQL container:

   ```shell
   docker run --name terra-db -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=yourpassword -e POSTGRES_DB=terra_db -p 5432:5432 -d postgres
   ```

3. **Apply Migrations:**

   Navigate to the Persistence project directory and apply migrations. For example:

   ```shell
   dotnet ef database update -c AppAuthDbContext
   dotnet ef database update -c PropertyDbContext
   ```

---

## Running the Project

Navigate to the WebApi project directory and run the project:

```shell
cd WebApi
dotnet run
```

The API should now be accessible (commonly at `https://localhost:5001`).

---

## Testing

To run the tests (unit and integration), naviagte to the test project
with `cd /Application.test` and run the command: 
```shell
dotnet test
```

Ensure that all tests pass before deploying or merging changes.

---

## Development Guidelines

### Clean Architecture & Project Structure
- **Separation of Concerns:** Keep domain, application, infrastructure, and presentation layers separate.
- **Dependency Direction:** Ensure dependencies only flow inward (Presentation → Application → Core).

### Coding Standards
- Use **PascalCase** for class and method names.
- Use **camelCase** for local variables and method parameters.
- Follow the **Single Responsibility Principle** for classes.
- **Repository Pattern:** Define repository interfaces in the Core/Application layer and implement them in the Infrastructure layer.
- **CQRS & MediatR:** Use MediatR to handle commands and queries.

### Dependency Injection
- Register services and repositories in the Startup/Program file:

  ```csharp
  services.AddScoped<IListingRepository, ListingRepository>();
  services.AddTransient<IEmailService, EmailService>();
  ```

### API Documentation
- Use **Swagger** for API documentation.
- Ensure endpoints are well-documented for consumption by frontend and other teams.
