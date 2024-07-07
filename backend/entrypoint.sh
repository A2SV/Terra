#!/bin/bash
set -e  # Stop on error

echo "Running EF migrations..."
# Uncomment the next line if migrations need to be applied at runtime
# dotnet ef database update --project ./Persistence/Persistence.csproj

echo "Starting application..."
dotnet ./WebApi.dll
