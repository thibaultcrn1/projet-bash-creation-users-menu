#!/bin/bash

while IFS=, read -r nom prenom dateNaissance profession
do

    login=$(echo "${nom:0:1}""$prenom" | tr '[:upper:]' '[:lower:]')
    utilisateur="$login"
    mdp=$(echo "${dateNaissance:0:4}$prenom" | tr '[:upper:]' '[:lower:]')
    groupe=$(echo "${profession}" | tr '[:upper:]' '[:lower:]')

    sudo groupadd "$groupe"
    echo "Le groupe $groupe est créé"
    sudo useradd -m -s /bin/bash -G "$groupe" -c "$prenom $nom" -p "$(openssl passwd -1 "$mdp")" "$utilisateur"
    echo "L'utilisateur $utilisateur est créé"
    sudo chage -d 0 "$utilisateur"
 
done < "./bd_util.csv"

echo
echo "Script de création exécuté avec succès."