#!/bin/bash
set -e  # Stop on error

# Ensure the PATH includes the directory where dotnet-ef is installed
export PATH="$PATH:/root/.dotnet/tools"

echo "Running EF migrations..."
dotnet dotnet --info
dotnet dotnet-ef database update --project /app/Persistence/Persistence.csproj

echo "Starting application..."
dotnet WebApi.dll
