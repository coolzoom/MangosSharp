FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /app
COPY ./Source/ .
RUN dotnet publish ./Services/RealmServer/RealmServer.csproj -c Release -o bin

FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build /app/bin .
COPY ./.docker/configs ./configs 
ENTRYPOINT ["./RealmServer"]