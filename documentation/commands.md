

I. construction d’images ;
   docker create <conteneur>    Création du docker
   docker image ls              Voir les images disponibles localement
   docker images	        Voir les images disponibles localement
   docker pull ubuntu

II. Gestion des conteneurs ;
   docker ps    		Voir les conteneurs actifs
   docker ps -a 		Voir toutes les conteneurs
   docker run <conteneur> 	Créer et démarrer un nouveau conteneur
      docker run -it ubuntu bash
   docker start <conteneur>     Démarre un conteneur qui existe déjà qui est à l’arrêt
   docker restart <conteneur>   Redémarre un conteneur
   docker attach <conteneur>    Se connecter au processus principal du conteneur 
   docker exec <conteneur>      Lancer un nouvel processus dans le conteneur
   docker pause <conteneur>	Mettre en pause le conteneur
   docker unpause <conteneur>   Reprendre le conteneur
   docker stop  <conteneur>     Arrêter un conteneur
   docker rm  <conteneur>       Effacer un conteneur
   docker system prune
   docker commit <nom-ou-id-du-conteneur> ubuntu-figlet:1.0


   docker build -t figlet-demo:1.0 .
   docker history figlet-demo:1.0
   







III. Gestion des volumes ;
   docker volume create <volume>      création du volume
   docker volume ls
   docker volume inspect <volume>



IV. Gestion de Docker Compose ;
   docker compose up -d
   docker compose down
	docker compose down -v      Pour effacer aussi le volume
   docker compose config    		 la configuration finale après substitution des variables. Elle peut donc révéler les valeurs contenues dans .env
   docker compose ps




V. Consultation des journaux.
   docker logs <conteneur>             logs du conteneur  
   docker compose logs
   docker compose logs db
   docker compose logs -f
   docker network ls
   docker network inspect <nom-du-reseau>







VI. Autres
   docker –version
   docker info


