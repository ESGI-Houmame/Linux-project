#!/bin/bash
#on nettoie l'ecran
clear
#On doit demander le nom d'utilisateur, le commentaire, le dossier, la date d'expiration, les groupes, l'identifiant et si c'est un compte systeme ou non
# demander le nom d'utilisateur
read -p "Entrez le nom d'utilisateur :" username

# demander le commentaire
read -p "Entrez le commentaire :" comment

# demander le dossier
read -p "Entrez le dossier :" folder

# demander la date d'expiration
read -p "Entrez la date d'expiration :" expiration

# demander les groupes
read -p "Entrez les groupes (séparés par un virgule) :" groups

# demander l'identifiant
read -p "Entrez l'identifiant :" uid

# demander si c'est un compte systeme ou non
read -p "Est-ce un compte systeme ? (y/n) :" system

#demander le mot de passe
read -s -p "Entrez le mot de passe :" password

#Demander la confirmation du mot de passe
read -s -p "Confirmez le mot de passe :" password2

#On doit checker que les champs ne sont pas vides
# on check si le nom d'utilisateur est vide
if [ -z $username ]
then
    # si le nom d'utilisateur est vide on affiche un message d'erreur
    echo "Le nom d'utilisateur ne peut pas etre vide"
    # on quitte le script
    exit 1
fi

# on check si le commentaire est vide
if [ -z $comment ]
then
    # si le commentaire est vide on affiche un message d'erreur
    echo "Le commentaire ne peut pas etre vide"
    # on quitte le script
    exit 1
fi

# on check si le dossier est vide
if [ -z $folder ]
then
    # si le dossier est vide on affiche un message d'erreur
    echo "Le dossier ne peut pas etre vide"
    # on quitte le script
    exit 1
fi

# on check si la date d'expiration est vide
if [ -z $expiration ]
then
    # si la date d'expiration est vide on affiche un message d'erreur
    echo "La date d'expiration ne peut pas etre vide"
    # on quitte le script
    exit 1
fi

# on check si les groupes sont vides
if [ -z $groups ]
then
    # si les groupes sont vides on affiche un message d'erreur
    echo "Les groupes ne peuvent pas etre vide"
    # on quitte le script
    exit 1
fi

# on check si l'identifiant est vide

if [ -z $uid ]
then
    # si l'identifiant est vide on affiche un message d'erreur
    echo "L'identifiant ne peut pas etre vide"
    # on quitte le script
    exit 1
fi

# on check si le mot de passe est vide
if [ -z $password ]
then
    # si le mot de passe est vide on affiche un message d'erreur
    echo "Le mot de passe ne peut pas etre vide"
    # on quitte le script
    exit 1
fi

# on check si la confirmation du mot de passe est vide

if [ -z $password2 ]
then
    # si la confirmation du mot de passe est vide on affiche un message d'erreur
    echo "La confirmation du mot de passe ne peut pas etre vide"
    # on quitte le script
    exit 1
fi

#On doit checker que les mots de passes sont identiques
# on check si les mots de passes sont identiques
if [ $password != $password2 ]
then
    # si les mots de passes ne sont pas identiques on affiche un message d'erreur
    echo "Les mots de passes ne sont pas identiques"
    # on quitte le script
    exit 1
fi


#On doit checker que l'utilisateur n'existe pas deja
# on check si l'utilisateur existe
if grep -q $username /etc/passwd
then
    # si l'utilisateur existe on affiche un message d'erreur
    echo "L'utilisateur existe deja"
    # on quitte le script
    exit 1
fi

#On doit checker si les groupes existent sinon les créer
# on split les groupes
IFS=',' read -r -a groups <<< "$groups"

# on boucle sur les groupes
for group in "${groups[@]}"
do
    # on check si le groupe existe
    if ! grep -q $group /etc/group
    then
        # si le groupe n'existe pas on le cree
        groupadd $group
    fi
done

#On doit creer l'utilisateur avec les parametres demandes
# si c'est un compte systeme
if [ $system = "y" ]
then
    useradd -r -c $comment -m -d $folder -e $expiration -G $groups -u $uid -p $password  $username
# si ce n'est pas un compte systeme
else
    useradd -c $comment -m -d $folder -e $expiration -G $groups -u $uid -p $password $username
fi

##on doit random un mot de passe et l'afficher
## on genere un mot de passe aleatoire
#password=$(openssl rand -base64 8)
#
## on affiche le mot de passe
#echo "Mot de passe : $password"



