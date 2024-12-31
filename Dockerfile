# Base stage with SDK (for building and running migrations)
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS base
WORKDIR /app
EXPOSE 8080

# Build stage
FROM base AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY . .
RUN dotnet restore "./APIApplication.csproj"
WORKDIR "/src/."
RUN dotnet build "./APIApplication.csproj" -c $BUILD_CONFIGURATION -o /app/build

# Install dotnet-ef tool
RUN dotnet tool install --global dotnet-ef
# Add global tools to PATH
ENV PATH="$PATH:/root/.dotnet/tools"

# Apply migrations during build
RUN dotnet publish "./APIApplication.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false
RUN dotnet ef database update --project /src/APIApplication.csproj

# Final stage for production
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=build /app/publish .

# Set runtime entry point
ENTRYPOINT ["dotnet", "APIApplication.dll"]