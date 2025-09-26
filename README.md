# MariaDB OpenFlights Database

A Docker container running MariaDB 11.8 pre-loaded with OpenFlights aviation data.

## About

Data taken from: https://github.com/jpatokal/openflights

This repository contains a Dockerfile for deployment of a MariaDB 11.8 container with the OpenFlights database. The OpenFlights database contains information about airports, airlines, routes, and aircraft from around the world.

## Prerequisites

- Docker installed on your system
- Git (to clone the repository)

## Download

Clone this repository to your local machine:

```bash
git clone https://github.com/marozn/mariadb-openflights
cd mariadb-openflights
```

## Build

Build the Docker image:

```bash
docker build -t mariadb-openflights .
```

## Run

### Quick Start

Run the container with default settings:

```bash
docker run -d \
  --name openflights-db \
  -e MARIADB_ROOT_PASSWORD=yourpassword \
  -p 3306:3306 \
  mariadb-openflights
```

### Using Docker Compose (Optional)

Create a `docker-compose.yml` file:

```yaml
version: '3.8'
services:
  mariadb:
    build: .
    container_name: openflights-db
    environment:
      MARIADB_ROOT_PASSWORD: yourpassword
      MARIADB_USER: openflights
      MARIADB_PASSWORD: openflights
    ports:
      - "3306:3306"
    volumes:
      - openflights-data:/var/lib/mysql

volumes:
  openflights-data:
```

Then run:

```bash
docker-compose up -d
```

## Connect to Database

### Using MariaDB Client

```bash
mariadb -h localhost -P 3306 -u root -p
```

### Using Docker Exec

```bash
docker exec -it openflights-db mariadb -u root -p
```

## Database Schema

The container includes the following tables:
- `airlines` - Airline information
- `airports` - Airport data worldwide
- `countries` - Country codes and names
- `routes` - Flight route information
- `planes` - Aircraft data

## Environment Variables

- `MARIADB_ROOT_PASSWORD` - Root password for MariaDB (required)
- `MARIADB_USER` - Non-root user name
- `MARIADB_PASSWORD` - Password for the non-root user

## Data Persistence

To persist data between container restarts, mount a volume to `/var/lib/mysql`:

```bash
-v openflights-data:/var/lib/mysql
```

## Stopping the Container

```bash
docker stop openflights-db
docker rm openflights-db
```

## License

See [LICENSE](LICENSE) file for details.
