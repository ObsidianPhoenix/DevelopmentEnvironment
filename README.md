# Development Environment

A Docker Compose-based local development environment providing Azure service emulators and database services for development and testing.

## Overview

This repository provides a complete local development environment using Docker containers for commonly used Azure services and databases. It includes PowerShell and Zsh helper functions to manage individual services easily.

## Services

The environment includes the following services:

### Databases

- **SQL Server** (Azure SQL Edge) - Port 1433
  - User: `sa`
  - Password: `letme!n123`
  - Data volumes: `~/SQL/Data` and `~/SQL/SystemDbs`
  - Health check enabled

- **Redis** - Port 6379
  - In-memory data store and cache

### Azure Service Emulators

- **Azurite** - Azure Storage Emulator
  - Blob Storage: Port 10000
  - Queue Storage: Port 10001
  - Table Storage: Port 10002
  - Data volume: `~/azurite`

- **Azure Service Bus Emulator** - Port 5672
  - Configuration volume: `~/ASB/`
  - Depends on SQL Server

- **Cosmos DB Emulator** - Ports 8081, 10250-10254, 1234
  - Data Explorer: Port 1234 (http://localhost:1234)
  - Management endpoint: Port 8081
  - HTTP protocol enabled

### Management Tools

- **Redis Commander** - Port 8081
  - Web-based Redis management interface
  - Access at: http://localhost:8081

## Prerequisites

- Docker Desktop installed and running
- PowerShell (Windows) or Zsh (macOS/Linux)
- Sufficient disk space for container images and data volumes

## Getting Started

### Clone the Repository

```bash
git clone https://github.com/ObsidianPhoenix/DevelopmentEnvironment.git
cd DevelopmentEnvironment
```

### Start All Services

#### Windows (PowerShell)

1. Import the helper functions:
   ```powershell
   . .\powershell-helpers.ps1
   ```

2. Start all services:
   ```powershell
   Start-AllDevDocker
   ```

#### macOS/Linux (Zsh)

1. Source the helper functions:
   ```bash
   source ./zsh-helpers.sh
   ```

2. Start all services:
   ```bash
   start-alldevdocker
   ```

### Stop All Services

**Windows:**
```powershell
Stop-AllDevDocker
```

**macOS/Linux:**
```bash
stop-alldevdocker
```

## Individual Service Management

### PowerShell Functions (Windows)

| Service | Start | Stop | Restart |
|---------|-------|------|---------|
| SQL Server | `Start-Sql` | `Stop-Sql` | `Restart-Sql` |
| Redis | `Start-Redis` | `Stop-Redis` | - |
| Azurite | `Start-Azurite` | `Stop-Azurite` | - |
| Service Bus | `Start-Asb` | `Stop-Asb` | - |
| Cosmos DB | `Start-Cosmos` | `Stop-Cosmos` | - |

### Zsh Aliases (macOS/Linux)

| Service | Start | Stop |
|---------|-------|------|
| SQL Server | `start-sql` | `stop-sql` |
| Redis | `start-redis` | `stop-redis` |
| Cosmos DB | `start-cosmos` | `stop-cosmos` |

## Service Access

### SQL Server
```bash
# Connection string
Server=localhost,1433;Database=master;User Id=sa;Password=letme!n123;TrustServerCertificate=True;
```

### Redis
```bash
# Connection string
localhost:6379
```

### Azurite (Storage Account)
```bash
# Connection string
DefaultEndpointsProtocol=http;AccountName=devstoreaccount1;AccountKey=Eby8vdM02xNOcqFlqUwJPLlmEtlCDXJ1OUzFT50uSRZ6IFsuFq2UVErCz4I6tq/K1SZFPTOtr/KBHBeksoGMGw==;BlobEndpoint=http://127.0.0.1:10000/devstoreaccount1;QueueEndpoint=http://127.0.0.1:10001/devstoreaccount1;TableEndpoint=http://127.0.0.1:10002/devstoreaccount1;
```

### Cosmos DB Emulator
```bash
# Endpoint
https://localhost:8081

# Data Explorer
http://localhost:1234
```

### Redis Commander
```bash
# Web Interface
http://localhost:8081
```

## Maintenance

### Update All Container Images
```powershell
Update-DevEnvironment  # Windows
update-devenvionrment  # macOS/Linux
```

### View Logs
```bash
docker-compose logs -f [service-name]
```

### Remove All Containers and Volumes
```bash
docker-compose down -v
```

## Network Configuration

All services are connected to a shared Docker bridge network named `DevelopmentNetwork`, allowing inter-service communication using service names as hostnames.

## Data Persistence

Data is persisted in the following directories on your host machine:

- SQL Server: `~/SQL/Data` and `~/SQL/SystemDbs`
- Azurite: `~/azurite`
- Service Bus: `~/ASB/`

## Troubleshooting

### SQL Server won't start
- Check that port 1433 is not already in use
- Verify Docker has sufficient resources allocated
- Check SQL Server logs: `docker logs sql`

### Cosmos DB Emulator issues
- Ensure you're accessing via HTTP (not HTTPS) for the explorer on port 1234
- Check allocated memory (Cosmos requires significant resources)

### Port conflicts
- Verify no other services are using the required ports
- Modify port mappings in `docker-compose.yml` if needed

## Contributing

Feel free to submit issues or pull requests for improvements to this development environment configuration.

## License

This project is provided as-is for personal development use.
