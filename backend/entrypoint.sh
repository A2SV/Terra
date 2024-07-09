#!/bin/bash
set -e  # Stop on error

echo "Running EF migrations..."
#dotnet dotnet-ef database update --project /app/Persistence/Persistence.csproj --startup-project /app/WebApi/WebApi.csproj

echo "Starting application..."
dotnet WebApi.dll
