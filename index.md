# *SAE 2.03 : Installation de services reseau*  
-------------------------------------------------------------------------------  


## Vidéo à la demande


### En quoi consiste docker

Docker est une plateforme qui permet de lancer des applications dans des “boites séparées” appelées conteneurs. Un conteneur est lancé à partir d’une image qui est à la base du système 
Ces conteneurs sont locales c'est-à-dire qu'on peut y avoir accès sur notre propre machine, il suffit de mettre le port, par exemple pour les machines de l'IUT, 23164 (un chiffre au hasard) : 80 qui permet d'avoir le port initial de la machine de l'IUT.
Ensuite il est aussi possible de créer des images qui sont lancés grâce aux conteneurs, pour ce faire, il existe une commande qu'il faut exécuter avant le lancement d'un conteneur et pour associer le conteneur à la machine il suffit de mettre le nom de l'image à la fin de la commande. Mais il ne suffit pas de lancer l'image pour avoir accès à toutes les données d'un serveur, c'est dans le dockerfile de l'image que se trouve les commandes permettant de copier le dossier du serveur et d'installer les serveurs comme apache2 ou NGINX.
Docker consiste donc à pouvoir lancer à l'intérieur de sa propre machine (de façon local) un site web ou un serveur par exemple.

### Serveur

Nginx est le serveur que nous avons utilisé, car le service http apache est l'exemple vu en cours. Nous avions envie d'élargir nos connaissances en changeant le serveur, passant donc de apache à nginx. Pour cela, nous avons modifié le Dockerfile. On peut voir ci-dessous le Dockerfile modifié, qui nous permet d'utiliser nginx.
Pour commencer, nous avons modifié la 3ème ligne du deuxième paragraphe de "apache2" en "nginx", ce qui nous permet de changer d'application. 
Mais ce n'est pas tout, il manque des choses pour que nginx puisse fonctionner. Nous avons alors ajouté la commande **RUN echo index.html** ce qui nous permet de lancer notre site internet, puis modifié la dernière ligne, la commande CMD, en passant de *CMD ["/usr/sbin/apache2ctl","-DFOREGROUND"]* à *CMD ["nginx", "-g", "daemon off;"]*.
Cette ligne a été obtenu en faisant des recherches sur internet à propos des condition nécessaires au bon fonctionnement de nginx.

```
# Utiliser l'image http# Utiliser l'image httpd officielle commd officielle comme image parent
FROM debian:latest

RUN  apt-get update && \
    apt-get -y install  \
    nginx

# Copier le répertoire html du répertoire courant vers le répertoire de l'image /usr/.../htdocs
COPY ./html /var/www/html/

# Exécuter la commande echo sur le conteneur 
# (il peut s'agir de n'importe quelle autre commande)
RUN echo index.html


# Rendre le port 80 accessible au monde en dehors de ce conteneur
EXPOSE 80

CMD ["nginx","-g","daemon off;"]
```

### Lancement de notre serveur video à la demande

Tout d'abord, il faut créer une image pour cela on utilise la commande : **docker build -t img-ilian .**
Une image Docker est un modèle en lecture seule, utiliser pour créer des conteneurs Docker.

![build.png](/docs/assets/images/build.png)

Ici l'image a été créé avec succès.
Nous pouvons maintenant lancer notre conteneur avec la commande : **docker run --name SAE -d -p 23164:80 img-ilian**

Et on vérifie si notre conteneur s'est bien lancé avec la commande : **docker ps**.  
Cette commande affiche toutes les instances de docker qui tournent actuellement sur notre environnement. 

![dockerps.png](/docs/assets/images/dockerps.png)

Pour accéder à notre site, il suffit de taper dans la barre de recherche d'un navigateur web la ligne : **di-docker:23164** ( les numeros correspondent au port d'hote que nous avons utiliser pour run le conteneur)

Voici le résultat : 

![site.png](/docs/assets/images/site.png)


### GitHub

Lors de ce projet nous avons travaillé avec github. GitHub permet aux développeurs de stocker et de partager, publiquement ou non, le code qu’ils créent. Pour qu'un utilisateur récupère notre projet il suffit de faire un git clone git@github.com:Alban1204/docker-sae203.git et le dossier docker-sae203 sera sur votre pc.

### Pourquoi cette plateforme ?

Nous avons décidé de faire une plateforme de vidéo à la demande concernant les animés, c'est-à-dire des vidéos qui retranscrivent un manga. On a choisi ce thème car tous les membres du projet sont fans de mangas et d'animés. Nous avons donc pris les trois plus gros animés et avons ajouté une petite vidéo de présentation. Cette vidéo sert d'exemple pour notre site de vidéo à la demande. Elles sont courtes pour pouvoir être hébergés sur docker sans problèmes.

### Difficultés rencontrés

- La compréhension du sujet et de ce qu'il fallait faire a été une tâche complexe, puisque aucun des membres de notre groupe n'a su répondre de façon claire et précise à ce qu'attendais les professeurs, c'est pour ça que pour surmonter cette difficulté nous avons fait appel à un professeur qui nous a expliqué que représentais réellement docker, ce qui nous a permis de comprendre le but de l'exercice qui était de lancer un serveur de façon, et pour notre projet il s'agissait de présenter un site avec des vidéos disponibles localement.

- La deuxième réelle difficulté rencontré et celle de l'utilisation de NGINX, au tout départ nous pensions qu'utiliser Apache2 était suffisant pour avoir réussi le projet, néanmoins ce n'était que du copier-collé des cours d'introduction à docker de Mr Jimenez, donc il a fallu découvrir un serveur différent de Apache2, grâce aux aides de Mr Jimenez nous avons trouvé le serveur NGINX, pour réussir à le lancer nous avons cherché sur internet quelles étaient les commandes nécessaires au lancement du serveur, et aussi en demandant à des camarades.

### Conclusion

Grâce à cette SAE nous avons pu découvrir l’utilité et le fonctionnement de Docker. De plus nous avons aussi améliorer nos capacité à utiliser git hub.
Enfin nous avons réussi à héberger un site html de vidéo à la demande 

