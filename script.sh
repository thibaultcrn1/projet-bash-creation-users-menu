#!/bin/bash

while IFS=, read -r nom prenom dateNaissance profession
do

    login=${echo ${nom:0:1}$prenom | tr '[:upper:]' '[:lower:]'}
    password=${echo ${dateNaissance:0:3}$prenom | tr '[:upper:]' '[:lower:]'}

    echo $login
    echo $password

    # sudo groupadd $login
    # echo "Le groupe $login est créé"
    # sudo useradd -c "$prenom $nom" -d /home/$login -s /bin/bash $login
    # sudo echo "$login:$password" | chpasswd
    # sudo chage -d0 $login
 
done < "./bd_util.csv"