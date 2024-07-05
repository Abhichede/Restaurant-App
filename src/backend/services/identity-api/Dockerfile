
FROM mcr.microsoft.com/dotnet/sdk:6.0.423-1-alpine3.19 AS build
WORKDIR /src
COPY Identity.API/ ./api
COPY Identity.API.UnitTests ./tests

RUN dotnet restore api/Identity.API.csproj
RUN dotnet restore tests/Identity.API.UnitTests.csproj

COPY . .

WORKDIR /src

RUN dotnet test -t Identity.API.UnitTests/Identity.API.UnitTests.csproj
RUN dotnet build api/Identity.API.csproj -c Release -o /app

FROM build AS publish
RUN dotnet publish api/Identity.API.csproj -c Release -o /app

FROM mcr.microsoft.com/dotnet/aspnet:6.0-alpine3.19 AS final
WORKDIR /app

COPY --from=publish /app .
EXPOSE 80

CMD ["dotnet", "Identity.API.dll"] 
