function Start-AllDevDocker()
{
  docker-compose -f ~/Repos/DevelopmentEnvironment/docker-compose.yml up
}

alias -g start-alldevdocker='Start-AllDevDocker'

function Stop-AllDevDocker()
{
  docker-compose -f ~/Repos/DevelopmentEnvironment/docker-compose.yml down
}

alias -g stop-alldevdocker='Stop_AllDevDocker'

function Start-Sql()
{
  docker-compose -f ~/Repos/DevelopmentEnvironment/docker-compose.yml up -d sql
}

alias -g start-sql='Start-Sql'

function Stop-Sql()
{
  docker-compose -f ~/Repos/DevelopmentEnvironment/docker-compose.yml stop  sql
}

alias -g stop-sql='Stop-Sql'

function Start-Redis()
{
  docker-compose -f ~/Repos/DevelopmentEnvironment/docker-compose.yml up -d redis-commander
}

alias -g start-redis='Start-Redis'

function Stop-Redis()
{
  docker-compose -f ~/Repos/DevelopmentEnvironment/docker-compose.yml stop redis redis-commander
}

function Start-Cosmos()
{
  docker-compose -f ~/Repos/DevelopmentEnvironment/docker-compose.yml up -d cosmos
}

alias -g start-redis='Start-Cosmos'

function Stop-Cosmos()
{
  docker-compose -f ~/Repos/DevelopmentEnvironment/docker-compose.yml stop cosmos
}

alias -g stop-redis='Stop-Cosmos'

function Update-DevEnvironment()
{
  docker-compose -f ~/Repos/DevelopmentEnvironment/docker-compose.yml pull
}

alias -g update-devenvionrment='Update-DevEnvironment'

function Start-Android()
{
  docker-compose -f ~/Repos/DevelopmentEnvironment/docker-compose.yml up -d android-emulator
}

alias -g stop-redis='Start-Android'

function Stop-Android()
{
  docker-compose -f ~/Repos/DevelopmentEnvironment/docker-compose.yml stop android-emulator
}

alias -g stop-redis='Stop-Android'