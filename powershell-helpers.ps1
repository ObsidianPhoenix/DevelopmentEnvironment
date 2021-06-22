function Start-AllDevDocker()
{
  docker-compose -f $home/Source/Repos/DevelopmentEnvironment/docker-compose.yml up
}

function Stop-AllDevDocker()
{
  docker-compose -f $home/Source/Repos/DevelopmentEnvironment/docker-compose.yml down
}

function Start-Sql()
{
  docker-compose -f $home/Source/Repos/DevelopmentEnvironment/docker-compose.yml up -d sql
}

function Stop-Sql()
{
  docker-compose -f $home/Source/Repos/DevelopmentEnvironment/docker-compose.yml stop  sql
}

function Start-Redis()
{
  docker-compose -f $home/Source/Repos/DevelopmentEnvironment/docker-compose.yml up -d redis-commander
}

function Stop-Redis()
{
  docker-compose -f $home/Source/Repos/DevelopmentEnvironment/docker-compose.yml stop redis redis-commander
}

function Update-DevEnvironment()
{
  docker-compose -f $home/Source/Repos/DevelopmentEnvironment/docker-compose.yml pull
}