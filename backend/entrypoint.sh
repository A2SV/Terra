#!/bin/bash
set -e  # Stop on error

echo "Running EF migrations..."
dotnet ef database update --project /app/Persistence/Persistence.csproj

echo "Starting application..."
dotnet WebApi.dll
