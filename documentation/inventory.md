
# Inventaire initial

| Élément | Type | Port publié | Données persistantes | Répertoire |
|---|---|---:|---|---|
| Image figlet | Image Docker | Aucun | Non | `dockerfile-demo/` |
| Site NGINX | Conteneur Web | 8080 | Non | `nginx-demo/` |
| WordPress | Application Web | 8085 | Configuration applicative | `wordpress-compose/` |
| MariaDB | Base de données | Aucun port publié | Oui, volume Docker | `wordpress-compose/` |
