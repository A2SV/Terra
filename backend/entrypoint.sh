#!/bin/bash
set -e  # Stop on error

# Debugging steps to verify dotnet-ef availability
echo "Checking if dotnet-ef is available..."
dotnet ef --help

echo "Running EF migrations..."
dotnet ef database update --project ./Persistence/Persistence.csproj

echo "Starting application..."
dotnet ./WebApi.dll
