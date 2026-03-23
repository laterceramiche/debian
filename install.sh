#!/bin/bash

# Controllo privilegi di root
if [ "$EUID" -ne 0 ]; then 
  echo "Per favore, esegui lo script con sudo"
  exit
fi

echo "--- 1. Aggiornamento Indici Pacchetti ---"
apt update && apt upgrade -y

# Definizione delle liste di software
SYSTEM_TOOLS=("htop" "neofetch" "curl" "wget" "git" "build-essential" "unzip" "p7zip-full")
INTERNET=("firefox" "thunderbird" "filezilla" "transmission-gtk")
GRAPHICS=("gimp" "inkscape" "shotwell")
MULTIMEDIA=("vlc" "audacity" "obs-studio" "ffmpeg")
PRODUCTIVITY=("libreoffice" "geany" "gnome-calculator")

echo "--- 2. Installazione Strumenti di Sistema ---"
apt install -y "${SYSTEM_TOOLS[@]}"

echo "--- 3. Installazione Internet & Email ---"
apt install -y "${INTERNET[@]}"

echo "--- 4. Installazione Grafica & Foto ---"
apt install -y "${GRAPHICS[@]}"

echo "--- 5. Installazione Multimedia & Video ---"
apt install -y "${MULTIMEDIA[@]}"

echo "--- 6. Installazione Produttività ---"
apt install -y "${PRODUCTIVITY[@]}"

echo "--- 7. Pulizia Finale ---"
apt autoremove -y
apt clean

echo "------------------------------------------------"
echo "Installazione completata con soli pacchetti APT!"
echo "------------------------------------------------"
