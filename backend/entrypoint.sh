#!/bin/sh

# Check if the project file exists
if [ ! -f "./Persistence/Persistence.csproj" ]; then
  echo "Project file does not exist: ./Persistence/Persistence.csproj"
  ls -la ./Persistence
  exit 1
fi

# Run EF Core migrations
dotnet ef database update --project ./Persistence/Persistence.csproj --startup-project ./WebApi/WebApi.csproj

# Start the application
dotnet WebApi.dll
