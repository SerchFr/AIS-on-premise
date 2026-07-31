# Sergio MARTINEZ HERRERA
# 2026-07-31

# WordPress avec Docker Compose

## Démarrage

`docker compose up -d`

## Vérification

`docker compose ps`

`docker compose logs`

## Arrêt

`docker compose down`

## Fichiers locaux

- `compose.yaml` décrit les services.
- `.env` contient les valeurs propres à l'environnement, inclus les mot de passe et ne doit pas être ajouté à Git.
- `.env.example` indique les variables attendues sans contenir les valeurs réelles.
