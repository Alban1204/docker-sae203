# Vidéo à la demande  

## Serveur

Nginx est le serveur que nous avons utilisé, car le service http apache est l'exemple vu en cours. Nous avions envie d'élargir nos connaissance en changeant le serveur, passant donc de apache à nginx. Pour cela, nous avons modifié le Dockerfile. On peut voir ci-dessous le Dockerfile modifié, qui nous permet d'utiliser nginx.

![dockerfile.png](/docs/assets/images/dockerfile.png)

## Plateforme

Nous avons décider de faire une plateforme de vidéo à la demande concernant les animés, c'est à dire des vidéos qui retranscrivent un manga. On a choisi ce thème car yous les membres du projet sont fans de mangas et d'animés. Nous avons donc pris les trois plus gros animés et avons ajouté une petite vidéo de présentation. Cette vidéo sert d'exemple pour notre site de vidéo à la demande. Elles sont courtes pour pouvoir être hébergés sur docker sans problèmes.



For more details see [Basic writing and formatting syntax](https://docs.github.com/en/github/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax).

## En quoi consiste docker
Docker est une plateforme sur laquelle il est possible de lancer certaines applications 

## Lancement de notre serveur video à la demande

Tout d'abord il faut créer une image pour cela on utilise la commande : docker build -t img-ilian .
![build.png](/docs/assets/images/build.png)
Ici l'image a été créé avec succès.
Nous pouvons maintenant lancer notre containers avec la commande : docker run --name SAE -d -p 23164:80 img-ilian
Et on verifie si notre containers c'est bien avec la commande : docker ps  
Qui affiche toutes les instances de docker qui tournent actuellement sur notre environnement. 
![dockerps.png](/docs/assets/images/dockerps.png)

