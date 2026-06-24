function Start-AllDevDocker()
{
  docker-compose -f Z:/Repos/DevelopmentEnvironment/docker-compose.yml up
}

function Stop-AllDevDocker()
{
  docker-compose -f Z:/Repos/DevelopmentEnvironment/docker-compose.yml down
}

function Start-Sql()
{
  docker-compose -f Z:/Repos/DevelopmentEnvironment/docker-compose.yml up -d sql
}

function Restart-Sql()
{
  Stop-Sql
  Start-Sql
}

function Stop-Sql()
{
  docker-compose -f Z:/Repos/DevelopmentEnvironment/docker-compose.yml stop  sql
}

function Start-Redis()
{
  docker-compose -f Z:/Repos/DevelopmentEnvironment/docker-compose.yml up -d redis-commander
}

function Stop-Redis()
{
  docker-compose -f Z:/Repos/DevelopmentEnvironment/docker-compose.yml stop redis redis-commander
}

function Update-DevEnvironment()
{
  docker-compose -f Z:/Repos/DevelopmentEnvironment/docker-compose.yml pull
}

function Start-Asb()
{
  docker-compose -f Z:/Repos/DevelopmentEnvironment/docker-compose.yml up -d asb-emulator
}

function Stop-Asb()
{
  docker-compose -f Z:/Repos/DevelopmentEnvironment/docker-compose.yml stop asb-emulator
}

function Start-Azurite
{
  docker-compose -f Z:/Repos/DevelopmentEnvironment/docker-compose.yml up -d azurite
}

function Stop-Azurite
{
  docker-compose -f Z:/Repos/DevelopmentEnvironment/docker-compose.yml stop azurite
}

function Start-Cosmos()
{
  docker-compose -f Z:/Repos/DevelopmentEnvironment/docker-compose.yml up -d cosmos
}
function Stop-Cosmos()
{
  docker-compose -f Z:/Repos/DevelopmentEnvironment/docker-compose.yml stop cosmos
}

function Start-Android()
{
  docker-compose -f Z:/Repos/DevelopmentEnvironment/docker-compose.yml up -d android-emulator
}

function Stop-Android()
{
  docker-compose -f Z:/Repos/DevelopmentEnvironment/docker-compose.yml stop android-emulator
}