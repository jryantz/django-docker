# Docker (Django - NGINX - uWSGI)

## How to Use

1. Clone repository
1. Update config
    1. Generate and update `SECRET_KEY` in `docker-compose-deploy.yml` file
    1. Add site URLs to `ALLOWED_HOSTS` in `docker-compose-deploy.yml` file
1. Run
    - Local Development
        - `docker compose up --build`
    - Production
        - `docker compose -f docker-compose-deploy.yml up --build`
    - `--build`
        - Builds the image before starting the container
1. Run Commands
    - Local Development
        - `docker compose run app python manage.py <command>`
    - Production
        - `docker compose -f docker-compose-deploy.yml run app python manage.py <command>`
    - `<command>`:
        - `makemigrations`
        - `migrate`

## Repeat Instructions

Follow these instructions to recreate the Docker container from scratch.

### Setup Python

1. Install Python

### Setup Django/uWSGI

1. Create `Dockerfile` and add configuration
1. Create `scripts` folder
1. Create `scripts/entrypoint.sh` and add configuration
1. Create `docker-compose.yml` and add configuration
1. Test, run `docker compose up`

### Setup NGINX

1. Create `nginx` folder
1. Create `nginx/default.conf` and add configuration
1. Create `nginx/uwsgi_params` and copy configuration from https://uwsgi-docs.readthedocs.io/en/latest/Nginx.html#what-is-the-uwsgi-params-file
1. Create `nginx/Dockerfile` and add configuration

### Customize Configuration

1. Configure `SECRET_KEY` and `DEBUG` to use envrionment variables
1. Configure `STATIC_URL`, `MEDIA_URL`, `STATIC_ROOT`, and `MEDIA_ROOT` to point at the correct folders

### Production Deployment Setup

1. Create `docker-compose-deploy.yml` and add configuration
