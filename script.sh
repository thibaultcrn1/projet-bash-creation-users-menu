#!/bin/bash

while IFS=, read -r nom prenom dateNaissance profession
do

    login = $prenom | cut -c1

    echo $nom
    echo $prenom
    echo $dateNaissance
    echo $profession
    echo
done < "./bd_util.csv"